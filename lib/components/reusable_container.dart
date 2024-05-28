import 'package:flutter/material.dart';

class ReusableContainer extends StatelessWidget {
  const ReusableContainer({
    super.key,
    required this.colorr,
    required this.cardchild,
  });
  final Color colorr;
  final Widget cardchild;
  // final Function onPress;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: colorr,
      ),
      height: 200.0,
      width: 170.0,
      child: cardchild,
    );
  }
}
