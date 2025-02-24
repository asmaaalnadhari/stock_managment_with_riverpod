import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child:  CupertinoActivityIndicator(
      color: Theme.of(context).colorScheme.primaryContainer,
      radius: 15,
    ));
  }
}
