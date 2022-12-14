import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomLoader extends StatelessWidget {
  const BottomLoader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 35,
      width: 35,
      child: CupertinoActivityIndicator(),
    );
  }
}
