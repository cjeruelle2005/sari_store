import 'dart:io';
import 'package:csv/csv.dart';
import 'package:excel/excel.dart' as xls;
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';
import 'package:sari_store/core/errors/result.dart';
import 'package:sari_store/core/errors/failures.dart';
import 'package:sari_store/features/reports/domain/entities/sales_report.dart';
import 'package:sari_store/features/reports/domain/entities/profit_report.dart';
import 'package:sari_store/features/reports/domain/entities/expense_report.dart';
import 'package:sari_store/features/reports/domain/entities/inventory_report.dart';
import 'package:sari_store/features/reports/domain/entities/utang_report.dart';
import 'package:sari_store/shared/data/database/app_database.dart';

class ExportService {
  final AppDatabase _db;

  ExportService(this._db);

  // Generate PDF for sales report
  Future<Result<File>> exportSalesReportPdf(SalesReport report) async {
    try {
      final pdf = pw.Document();
      final storeInfo = await _db.settingsDao.getStoreInfo();
      pdf.addPage(
        pw.MultiPage(
          pageFormat: PdfPageFormat.a4,
          build: (ctx) => [
            pw.Header(text: storeInfo?.storeName ?? 'Sari-Sari Store'),
            pw.Text('Sales Report'),
            pw.Text('${report.from.toLocal()} — ${report.to.toLocal()}'),
            pw.Divider(),
            pw.Text('Total Sales: ${report.totalSales.toStringAsFixed(2)}'),
            pw.Text('Transactions: ${report.totalTransactions}'),
            pw.Text('Avg. Transaction: ${report.averageTransaction.toStringAsFixed(2)}'),
            pw.SizedBox(height: 16),
            pw.Text('Daily Breakdown', style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
            pw.TableHelper.fromTextArray(
              headers: ['Date', 'Sales', 'Transactions'],
              data: report.dailyBreakdown.map((d) => [
                d.date.toIso8601String().substring(0, 10),
                d.total.toStringAsFixed(2),
                d.transactions.toString(),
              ]).toList(),
            ),
            pw.SizedBox(height: 16),
            pw.Text('Top Products', style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
            pw.TableHelper.fromTextArray(
              headers: ['Product', 'Qty Sold', 'Amount'],
              data: report.topProducts.map((p) => [
                p.productName,
                p.quantitySold.toString(),
                p.totalAmount.toStringAsFixed(2),
              ]).toList(),
            ),
          ],
        ),
      );
      final tempDir = await getTemporaryDirectory();
      final file = File('${tempDir.path}/sales_report_${DateTime.now().millisecondsSinceEpoch}.pdf');
      await file.writeAsBytes(await pdf.save());
      return Result.success(file);
    } catch (e) {
      return Result.failure(Failure.exportFailure(message: 'PDF export failed: $e'));
    }
  }

  // CSV for any report using a generic approach; we'll make specific methods
  Future<Result<File>> exportSalesReportCsv(SalesReport report) async {
    try {
      final rows = <List<String>>[
        ['Date', 'Sales', 'Transactions'],
        ...report.dailyBreakdown.map((d) => [
          d.date.toIso8601String().substring(0, 10),
          d.total.toStringAsFixed(2),
          d.transactions.toString(),
        ]),
        [],
        ['Total Sales', report.totalSales.toStringAsFixed(2)],
      ];
      final csvString = const ListToCsvConverter().convert(rows);
      final tempDir = await getTemporaryDirectory();
      final file = File('${tempDir.path}/sales_report_${DateTime.now().millisecondsSinceEpoch}.csv');
      await file.writeAsString(csvString);
      return Result.success(file);
    } catch (e) {
      return Result.failure(Failure.exportFailure(message: 'CSV export failed: $e'));
    }
  }

  Future<Result<File>> exportSalesReportExcel(SalesReport report) async {
    try {
      final excel = xls.Excel.createExcel();
      final sheet = excel['Sales Report'];
      sheet.appendRow(['Date', 'Sales', 'Transactions']);
      for (final d in report.dailyBreakdown) {
        sheet.appendRow([
          d.date.toIso8601String().substring(0, 10),
          d.total,
          d.transactions,
        ]);
      }
      sheet.appendRow(['Total', report.totalSales, report.totalTransactions]);
      final tempDir = await getTemporaryDirectory();
      final file = File('${tempDir.path}/sales_report_${DateTime.now().millisecondsSinceEpoch}.xlsx');
      await file.writeAsBytes(excel.encode()!);
      return Result.success(file);
    } catch (e) {
      return Result.failure(Failure.exportFailure(message: 'Excel export failed: $e'));
    }
  }
}