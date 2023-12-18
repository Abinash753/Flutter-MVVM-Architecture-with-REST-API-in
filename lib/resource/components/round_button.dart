import 'package:flutter/material.dart';
import 'package:mvvm_architecture/resource/components/color.dart';

class RoundButton extends StatelessWidget {
  final String title;
  final bool loading;
  final VoidCallback onpress;

  const RoundButton(
      {super.key,
      required this.title,
      required this.onpress,
      this.loading = false});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onpress,
      child: Container(
        height: 50,
        width: 300,
        decoration: BoxDecoration(
          color: AppColors.buttonColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
            child: loading
                ? const CircularProgressIndicator(
                    color: Colors.black,
                  )
                : Text(
                    title,
                    style: AppColors.textStyle,
                  )),
      ),
    );
  }
}
