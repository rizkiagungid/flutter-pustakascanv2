import 'package:flutter/material.dart';
import 'package:wireframe_mobile/common/utils/app_style.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Info Page'),
        backgroundColor: AppStyle.pastelBlue,
      ),
      body: Center(
        child: Text(
          'Ini adalah halaman Info.',
          style: AppStyle.textTitleBOLD.copyWith(fontSize: 18),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
