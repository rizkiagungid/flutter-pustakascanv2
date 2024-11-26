import 'dart:io';

import 'package:flutter_tflite/flutter_tflite.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wireframe_mobile/scanner/model/scanner_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'scanner_handler.g.dart';

@riverpod
class ScannerHandler extends _$ScannerHandler {
  @override
  Future<ScannerState> build() async {
    return await init();
  }

  Future<ScannerState> init() async {
    late ScannerState val;
    try {
      await Tflite.loadModel(
        model: "assets/model/model_unquant.tflite",
        labels: "assets/labels.txt",
        numThreads: 1,
        isAsset: true,
        useGpuDelegate: false,
      );
      val = const ScannerState.init();
    } catch (e) {
      val = ScannerState.error(error: e.toString());
    }
    state = AsyncValue.data(val);
    return val;
  }

  Future<void> pickImage({required ImageSource source}) async {
    final picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: source);

    if (image == null) return;

    final file = File(image.path);
    state = const AsyncValue.loading();

    try {
      final recognitions = await Tflite.runModelOnImage(
        path: image.path,
        imageMean: 0.0,
        imageStd: 255.0,
        numResults: 2,
        threshold: 0.2,
        asynch: true,
      );

      if (recognitions == null || recognitions.isEmpty) {
        state = const AsyncValue.data(
            ScannerState.error(error: "No recognitions found"));
        return;
      }

      final label = recognitions[0]['label'].toString();
      final confidence = (recognitions[0]['confidence'] * 100);

      state = AsyncValue.data(ScannerState.result(
        file: file,
        label: label,
        confidence: confidence,
      ));
    } catch (e) {
      state = AsyncValue.data(ScannerState.error(error: e.toString()));
    }
  }

  void dispose() {
    Tflite.close();
  }
}
