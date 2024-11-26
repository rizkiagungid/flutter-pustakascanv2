import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:wireframe_mobile/common/utils/app_key.dart';
import 'package:wireframe_mobile/common/utils/app_style.dart';

class AboutPage extends ConsumerWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                        AppKey.appIcon,
                        height: 40.h,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 0.06.sh),
            Container(
              decoration: BoxDecoration(
                color: AppStyle.pastelBlue,
                borderRadius: BorderRadius.circular(10),
              ),
              height: 0.2.sh,
              width: 0.8.sw,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'VERSI APLIKASI',
                    style: AppStyle.textBodyBOLDWhite,
                    textAlign: TextAlign.center,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: AppStyle.pastelWhite,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    height: 0.1.sh,
                    width: 0.7.sw,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          AppKey.appIcon,
                          height: 40.h,
                        ),
                        Text(
                          'V.1.0.0',
                          style: AppStyle.textBody,
                          overflow: TextOverflow.fade,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 0.06.sh),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 0.1.sw),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Tentang Aplikasi:',
                  style: AppStyle.textBodyBOLD.copyWith(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            SizedBox(height: 0.02.sh),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 0.1.sw),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Sistem pendeteksi buku berbasis AI yang dirancang untuk membantu pelayanan perpustakaan di Bogor. Menggunakan Teachable Machine, aplikasi ini dapat mengenali buku dari gambar sampul dan mengidentifikasi kategori buku, serta menyediakan informasi lokasi rak buku di perpustakaan. Sistem ini bertujuan untuk mempercepat proses pencarian buku dan mempermudah pengelolaan koleksi perpustakaan.',
                    style: AppStyle.textBody.copyWith(color: Colors.white),
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.fade,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
