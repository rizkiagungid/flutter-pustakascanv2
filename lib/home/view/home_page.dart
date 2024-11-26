import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wireframe_mobile/common/utils/app_key.dart';
import 'package:wireframe_mobile/common/utils/app_style.dart';
import 'package:wireframe_mobile/common/widgets/action_button_styled.dart';
import 'package:wireframe_mobile/router/routes.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  int _selectedIndex = 0;

  // Daftar rute navigasi
  static const List<String> _routes = [
    '/about', // Informasi Aplikasi
    '/books', // Daftar Buku
    '/about-me', // About Me
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    context.push(_routes[index]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [AppStyle.pastelBlue, AppStyle.pastelGreen],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(height: 0.04.sh),
              Center(
                child: Image.asset(
                  AppKey.appIcon,
                  height: 0.24.sh,
                ),
              ),
              SizedBox(height: 0.04.sh),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 0.1.sw),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  color: AppStyle.pastelWhite.withOpacity(0.9),
                  elevation: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Selamat Datang di Aplikasi!',
                          style: AppStyle.textTitleBOLD.copyWith(fontSize: 18),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Di sini Anda dapat memindai Buku dan mendapatkan informasi tentang letak buku tersebut. Gunakan tombol di bawah untuk memulai.',
                          style: AppStyle.textBodyGrey,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 0.1.sh),
              ActionButtonStyled(
                btnColor: AppStyle.pastelBlue,
                onPressed: () async {
                  const ScannerRoute().push(context); // Tombol tetap di tengah
                },
                label: Text(
                  'BUKA SCANNER',
                  style: AppStyle.textSubTitleWhite,
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: AppStyle.pastelBlue,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.info_outline),
            label: 'Informasi',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book_outlined),
            label: 'Buku',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'About Me',
          ),
        ],
      ),
    );
  }
}
