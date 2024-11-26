import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';
import 'package:wireframe_mobile/common/utils/app_key.dart';
import 'package:wireframe_mobile/common/utils/app_style.dart';
import 'package:wireframe_mobile/common/widgets/loading_spinner.dart';
import 'package:wireframe_mobile/scanner/handler/scanner_handler.dart';

class ScannerPage extends ConsumerWidget {
  const ScannerPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(scannerHandlerProvider);

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [AppStyle.pastelBlue, AppStyle.pastelGreen],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: 0.04.sh),
            Center(
              child: SizedBox(
                width: 0.9.sw,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () => context.pop(),
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                      ),
                    ),
                    Center(
                      child: Image.asset(
                        AppKey.appIcon, // Path to your SVG file
                        height: 40.h,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 0.02.sh),
            state.when(
              data: (data) {
                return data.map(
                  init: (value) {
                    return Column(
                      children: [
                        SizedBox(height: 0.04.sh),
                        SizedBox(
                          height: 0.24.sh,
                          child: Lottie.asset(
                            fit: BoxFit.fitHeight,
                            'assets/animations/scan init.json',
                            animate: true,
                            frameRate: const FrameRate(60),
                            repeat: true,
                          ),
                        ),
                        SizedBox(height: 0.1.sh),
                        ElevatedButton(
                          onPressed: () => ref
                              .read(scannerHandlerProvider.notifier)
                              .pickImage(source: ImageSource.camera),
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 30, vertical: 10),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(13),
                            ),
                            foregroundColor: Colors.black,
                          ),
                          child: const Text("Ambil Foto"),
                        ),
                        const SizedBox(height: 8),
                        ElevatedButton(
                          onPressed: () => ref
                              .read(scannerHandlerProvider.notifier)
                              .pickImage(source: ImageSource.gallery),
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 30, vertical: 10),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(13),
                            ),
                            foregroundColor: Colors.black,
                          ),
                          child: const Text("Pilih dari galeri"),
                        ),
                      ],
                    );
                  },
                  result: (value) {
                    return Card(
                      elevation: 20,
                      clipBehavior: Clip.hardEdge,
                      child: SizedBox(
                        width: 300,
                        child: Column(
                          children: [
                            const SizedBox(height: 18),
                            Container(
                              height: 280,
                              width: 280,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12),
                                image: const DecorationImage(
                                  image: AssetImage('assets/upload.jpg'),
                                ),
                              ),
                              child: Image.file(
                                value.file,
                                fit: BoxFit.fill,
                              ),
                            ),
                            const SizedBox(height: 12),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  // Menampilkan label dan confidence hanya jika confidence >= 80
                                  if (value.confidence >= 80) ...[
                                    Text(
                                      value.label,
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 12),
                                    Text(
                                      "Akurasinya adalah: ${value.confidence.toStringAsFixed(0)}%",
                                      style: const TextStyle(
                                        fontSize: 18,
                                      ),
                                    ),
                                    const SizedBox(height: 12),
                                    const Text(
                                      "Buku tervalidasi sempurna.",
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.green,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ] else ...[
                                    // Jika confidence kurang dari 80, tampilkan teks "Tidak terdeteksi"
                                    const Text(
                                      "Tidak terdeteksi.",
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.red,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    const Text(
                                      "Akurasinya adalah: 0%",
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.red,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                  const SizedBox(height: 12),
                                  ElevatedButton(
                                    onPressed: () => ref
                                        .read(scannerHandlerProvider.notifier)
                                        .pickImage(source: ImageSource.camera),
                                    style: ElevatedButton.styleFrom(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 30, vertical: 10),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(13),
                                      ),
                                      foregroundColor: Colors.black,
                                    ),
                                    child: const Text("Ambil Foto Lagi"),
                                  ),
                                  const SizedBox(height: 8),
                                  ElevatedButton(
                                    onPressed: () => ref
                                        .read(scannerHandlerProvider.notifier)
                                        .pickImage(source: ImageSource.gallery),
                                    style: ElevatedButton.styleFrom(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 30, vertical: 10),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(13),
                                      ),
                                      foregroundColor: Colors.black,
                                    ),
                                    child: const Text("Pilih dari galeri lagi"),
                                  ),
                                  const SizedBox(height: 12),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  error: (value) {
                    return Center(
                      child: Text(
                        value.toString(),
                        style: const TextStyle(color: Colors.red),
                      ),
                    );
                  },
                );
              },
              error: (error, stackTrace) {
                return Center(
                  child: Text(
                    error.toString(),
                    style: const TextStyle(color: Colors.red),
                  ),
                );
              },
              loading: () => const Center(child: LoadingSpinner()),
            ),
          ],
        ),
      ),
    );
  }
}
