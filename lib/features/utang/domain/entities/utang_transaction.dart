import 'package:freezed_annotation/freezed_annotation.dart';

part 'utang_transaction.freezed.dart';
part 'utang_transaction.g.dart';

enum UtangType { borrow, payment }

@freezed
class UtangTransaction with _$UtangTransaction {
  const factory UtangTransaction({
    required int id,
    required int customerId,
    required UtangType type,
    required double amount,
    required double balanceAfter,
    String? notes,
    required DateTime transactionDate,
  }) = _UtangTransaction;

  factory UtangTransaction.fromJson(Map<String, dynamic> json) => _$UtangTransactionFromJson(json);
}