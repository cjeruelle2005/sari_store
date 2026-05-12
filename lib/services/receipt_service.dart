import 'dart:io';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sari_store/core/errors/result.dart';
import 'package:sari_store/core/errors/failures.dart';
import 'package:sari_store/core/logger/app_logger.dart';
import 'package:sari_store/shared/data/database/app_database.dart';

class ReceiptService {
  final AppDatabase _db;
  ReceiptService(this._db);

  Future<Result<File>> generateReceiptPdf(int transactionId) async {
    try {
      final tx = await _db.transactionDao.getTransactionById(transactionId);
      if (tx == null) return Result.failure(const Failure.notFound(message: 'Transaction not found'));

      final items = await _db.transactionDao.getItemsForTransaction(transactionId);
      final cashier = await _db.userDao.getUserById(tx.cashierId);
      final storeInfo = await _db.settingsDao.getStoreInfo();

      // Enrich items with product names
      final List<Map<String, dynamic>> itemRows = [];
      for (final item in items) {
        final product = await _db.productDao.getProductById(item.productId);
        itemRows.add({
          'name': product?.name ?? 'Unknown',
          'qty': item.quantity,
          'price': item.unitPrice,
          'total': item.totalPrice,
        });
      }

      final pdf = pw.Document();
      pdf.addPage(
        pw.Page(
          pageFormat: PdfPageFormat.roll80,
          build: (pw.Context context) {
            return pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Center(child: pw.Text(storeInfo?.storeName ?? 'Sari-Sari Store',
                    style: const pw.TextStyle(fontSize: 14, fontWeight: pw.FontWeight.bold))),
                pw.Center(child: pw.Text(storeInfo?.address ?? '')),
                pw.Divider(),
                pw.Text('Invoice: ${tx.invoiceNumber}'),
                pw.Text('Date: ${_formatDate(tx.transactionDate)}'),
                pw.Text('Cashier: ${cashier?.fullName ?? 'Unknown'}'),
                pw.Divider(),
                pw.TableHelper.fromTextArray(
                  headers: ['Item', 'Qty', 'Price', 'Total'],
                  data: itemRows.map((row) => [
                    row['name'],
                    row['qty'].toString(),
                    row['price'].toStringAsFixed(2),
                    row['total'].toStringAsFixed(2),
                  ]).toList(),
                  headerStyle: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                  cellStyle: const pw.TextStyle(fontSize: 10),
                ),
                pw.Divider(),
                pw.Row(mainAxisAlignment: pw.MainAxisAlignment.spaceBetween, children: [
                  pw.Text('Subtotal'),
                  pw.Text((tx.totalAmount).toStringAsFixed(2)), // before discount: items total? We'll compute
                ]),
                if (tx.discount > 0)
                  pw.Row(mainAxisAlignment: pw.MainAxisAlignment.spaceBetween, children: [
                    pw.Text('Discount'),
                    pw.Text('-${tx.discount.toStringAsFixed(2)}'),
                  ]),
                pw.Row(mainAxisAlignment: pw.MainAxisAlignment.spaceBetween, children: [
                  pw.Text('Total', style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                  pw.Text('${(tx.totalAmount).toStringAsFixed(2)}', style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                ]),
                pw.Row(mainAxisAlignment: pw.MainAxisAlignment.spaceBetween, children: [
                  pw.Text('Payment'),
                  pw.Text(tx.paymentReceived.toStringAsFixed(2)),
                ]),
                pw.Row(mainAxisAlignment: pw.MainAxisAlignment.spaceBetween, children: [
                  pw.Text('Change'),
                  pw.Text(tx.changeAmount.toStringAsFixed(2)),
                ]),
                pw.SizedBox(height: 20),
                pw.Center(child: pw.Text(storeInfo?.receiptMessage ?? 'Thank you!')),
              ],
            );
          },
        ),
      );

      final tempDir = await getTemporaryDirectory();
      final file = File('${tempDir.path}/receipt_$transactionId.pdf');
      await file.writeAsBytes(await pdf.save());
      return Result.success(file);
    } catch (e, stack) {
      AppLogger.error('Receipt generation failed', e, stack);
      return Result.failure(Failure.printFailure(message: 'Failed to generate receipt PDF'));
    }
  }

  String _formatDate(DateTime d) =>
      '${d.day.toString().padLeft(2, '0')}/${d.month.toString().padLeft(2, '0')}/${d.year} '
      '${d.hour.toString().padLeft(2, '0')}:${d.minute.toString().padLeft(2, '0')}';
}