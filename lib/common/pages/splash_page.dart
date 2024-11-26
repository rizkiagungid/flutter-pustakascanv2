import 'package:flutter/material.dart';
import 'package:wireframe_mobile/common/widgets/loading_spinner.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: LoadingSpinner(),
      ),
    );
  }
}
