import 'package:flutter/material.dart';

enum LogoSize { S, M, L, XL, XXL }

class Logo extends StatelessWidget {
  final LogoSize size;

  const Logo({Key? key, this.size = LogoSize.M}) : super(key: key);

  double _getSize() {
    switch (size) {
      case LogoSize.S:
        return 40;
      case LogoSize.M:
        return 80;
      case LogoSize.L:
        return 120;
      case LogoSize.XL:
        return 160;
      case LogoSize.XXL:
        return 200;
      default:
        return 80;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/image/logo.png',
      width: _getSize(),
      height: _getSize(),
    );
  }
}
