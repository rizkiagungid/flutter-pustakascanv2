import 'dart:io';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'scanner_state.freezed.dart';

@freezed
class ScannerState with _$ScannerState {
  const factory ScannerState.init() = Init;
  const factory ScannerState.result({
    required File file,
    required String label,
    required double confidence,
  }) = Result;
  const factory ScannerState.error({
    required String error,
  }) = Error;
}
