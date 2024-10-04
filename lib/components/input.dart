import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InputComponent extends StatelessWidget {
  final String label;
  final String hint;
  final VoidCallback onPressed;

  const InputComponent({
    super.key,
    required this.label,
    required this.hint,
    required this.onPressed,
  });

  // ANCHOR Build
  @override
  Widget build(
    BuildContext context,
  ) {
    TextStyle textStyle = CupertinoTheme.of(context).textTheme.textStyle;

    return Container(
      margin: const EdgeInsets.only(
        bottom: 16,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(
          8,
        ),
        child: CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: onPressed,
          child: IgnorePointer(
            child: Material(
              color: const Color(0xFFF5F5F5),
              shadowColor: CupertinoColors.transparent,
              surfaceTintColor: CupertinoColors.transparent,
              child: TextField(
                style: textStyle,
                readOnly: true,
                decoration: InputDecoration(
                  fillColor: CupertinoColors.transparent,
                  labelText: label,
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  labelStyle: textStyle.copyWith(
                    fontWeight: FontWeight.w500,
                    color: CupertinoTheme.of(context).primaryColor,
                  ),
                  hintText: hint,
                  hintStyle: textStyle,
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 15,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
