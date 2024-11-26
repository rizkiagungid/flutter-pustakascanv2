import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wireframe_mobile/common/utils/app_style.dart';
import 'package:wireframe_mobile/common/utils/hooks_side_effect.dart';

import 'loading_spinner.dart';

class ActionButtonStyled extends HookWidget {
  const ActionButtonStyled({
    super.key,
    required this.onPressed,
    required this.label,
    this.rounding,
    this.height,
    this.width,
    this.btnColor,
  });
  final AsyncCallback onPressed;
  final Widget label;
  final double? rounding;
  final double? height;
  final double? width;
  final Color? btnColor;

  @override
  Widget build(BuildContext context) {
    final (clear: _, :mutate, :snapshot) = useSideEffect<void>();
    Future<void> pressButton() async {
      final future = onPressed();
      mutate(future);
      try {
        await future;
      } catch (exception) {
        if (!context.mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Something went wrong $exception')),
        );
      }
    }

    return SizedBox(
      height: height ?? 0.06.sh,
      width: width ?? 0.8.sw,
      child: ElevatedButton(
        onPressed: snapshot.connectionState == ConnectionState.waiting
            ? null
            : pressButton,
        clipBehavior: Clip.antiAlias,
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(
            horizontal: 5,
            vertical: 5,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(rounding ?? 12),
          ),
          backgroundColor: btnColor ?? AppStyle.brandColor,
        ),
        child: Center(
          child: snapshot.connectionState == ConnectionState.waiting
              ? const LoadingSpinner()
              : label,
        ),
      ),
    );
  }
}

class ActionButtonOutlineStyled extends HookWidget {
  const ActionButtonOutlineStyled({
    super.key,
    required this.onPressed,
    required this.label,
    this.width,
  });
  final AsyncCallback onPressed;
  final Widget label;
  final double? width;

  @override
  Widget build(BuildContext context) {
    final (clear: _, :mutate, :snapshot) = useSideEffect<void>();
    Future<void> pressButton() async {
      final future = onPressed();
      mutate(future);
      try {
        await future;
      } catch (exception) {
        if (!context.mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Something went wrong $exception')),
        );
      }
    }

    return SizedBox(
      height: 0.06.sh,
      width: width ?? 0.8.sw,
      child: ElevatedButton(
        onPressed: snapshot.connectionState == ConnectionState.waiting
            ? null
            : pressButton,
        clipBehavior: Clip.antiAlias,
        style: ElevatedButton.styleFrom(
          side: const BorderSide(
            color: Colors.blue, // Set side border color
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 5,
            vertical: 5,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          backgroundColor: Colors.white, // Set background color
          foregroundColor: Colors.blue, // Set text color
        ),
        child: Center(
          child: snapshot.connectionState == ConnectionState.waiting
              ? const LoadingSpinner()
              : label,
        ),
      ),
    );
  }
}
