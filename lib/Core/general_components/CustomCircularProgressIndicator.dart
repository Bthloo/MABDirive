import 'package:flutter/material.dart';
import 'package:mab_drive/Core/ColorHelper.dart';

class CustomCircularProgressIndicator extends StatelessWidget {
  const CustomCircularProgressIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        color: ColorHelper.mainColor,
      ),
    );
  }
}
