import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:profile/presentation/constants/styles.dart';
import '../theme/theme_extensions.dart';

class AppButton extends StatelessWidget {
  final void Function() onClick;
  final Widget? child;
  final _ButtonType _type;
  final String? _text;

  AppButton({required this.onClick, this.child})
      : _type = _ButtonType.none,
        _text = null;

  AppButton.text({required this.onClick, required String text})
      : child = null,
        _type = _ButtonType.text,
        _text = text;

  AppButton.filledText({required this.onClick, required String text})
      : child = null,
        _type = _ButtonType.filledText,
        _text = text;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onClick,
      height: 60,
      elevation: 0,
      color: _type == _ButtonType.filledText ? theme.buttonColor : null,
      child: _content(),
    );
  }

  Widget? _content() {
    if (_type == _ButtonType.none) {
      return child;
    } else {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            _text!,
            style: _type == _ButtonType.text
                ? AppTextStyle.primaryBoldText(theme)
                : AppTextStyle.primaryBoldText(theme).copyWith(color: theme.onButtonTextColor),
          ),
        ],
      );
    }
  }
}

enum _ButtonType {
  none,
  text,
  filledText,
}
