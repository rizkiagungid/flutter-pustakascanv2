import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AboutMePage extends StatelessWidget {
  const AboutMePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Me'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Foto Profil
            Center(
              child: CircleAvatar(
                radius: 60.r,
                backgroundImage: AssetImage('assets/image/saya.jpeg'), // FOTO
              ),
            ),
            SizedBox(height: 20.h),
            // Informasi Personal
            Text(
              'Informasi',
              style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            Text(
              'NIM: 15200060',
              style: TextStyle(fontSize: 16.sp),
              textAlign: TextAlign.center,
            ),
            Text(
              'Nama: MOHAMAD RIDWAN APRIYADI',
              style: TextStyle(fontSize: 16.sp),
              textAlign: TextAlign.center,
            ),
            Text(
              'Kampus: Universitas Bina Sarana Informatika',
              style: TextStyle(fontSize: 16.sp),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10.h),
            // Outline Skripsi
            Text(
              'Judul Skripsi:',
              style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            Text(
              'sistem pendeteksi buku pada perpustakaan bogor menggunakan teachable machine.',
              style: TextStyle(fontSize: 16.sp),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20.h),
            // Tujuan Aplikasi
            Text(
              'Tujuan Aplikasi:',
              style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            Text(
              'untuk memudahkan pengunjung atau pelayanan perpustakaan mengembalikan buku di tempat atau rak dengan sesuai',
              style: TextStyle(fontSize: 16.sp),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
