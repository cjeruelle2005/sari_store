import 'package:freezed_annotation/freezed_annotation.dart';

part 'transaction_summary.freezed.dart';
part 'transaction_summary.g.dart';

@freezed
class TransactionSummary with _$TransactionSummary {
  const factory TransactionSummary({
    required double subtotal,
    required double discount,
    required double total,
    required double paymentReceived,
    required double change,
  }) = _TransactionSummary;

  factory TransactionSummary.fromJson(Map<String, dynamic> json) => _$TransactionSummaryFromJson(json);
}