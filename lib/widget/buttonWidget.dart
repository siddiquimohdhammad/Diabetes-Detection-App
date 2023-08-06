// ignore_for_file: sort_child_properties_last

// import 'dart:ffi';

import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  final double? height;
  final double? width;
  final double borderwidth;
  Color? textColor;
  Color? containerColor;

  // final Color color = Color.fromARGB(255, 201, 28, 28);
  final Color borderColor;
  final BorderStyle borderStyle;
  final BorderRadius? borderradius = BorderRadius.circular(20);
  final String? text;
  final IconData? icon;
  VoidCallback? call;
  Alignment align;
  double? borderRadius;

  CustomContainer(
      {super.key,
      this.borderRadius,
      this.containerColor,
      this.textColor,
      this.text,
      this.borderwidth = 5,
      this.height,
      this.width,
      this.borderColor = const Color(0xfff4f4f4),
      this.borderStyle = BorderStyle.solid,
      this.icon,
      this.align = Alignment.center,
      this.call});

  @override
  Widget build(BuildContext context) {
    // var width = MediaQuery.of(context).size.width;
    // var he = MediaQuery.of(context).size.height;

    return Container(
      // alignment: Alignment.bottomRight,
      // height: height,
      // width: width,
      // height: 50,
      // width: 50,
      height: height ?? 100,
      width: width ?? 100,
      child: InkWell(
          child: Container(
            // ignore: prefer_const_constructors
            margin: EdgeInsets.fromLTRB(5, 5, 10, 5),
            decoration: BoxDecoration(
                color: containerColor ?? Colors.yellow,
                borderRadius: BorderRadius.circular(borderRadius ?? 0)),
            child: Align(
                child: Text(
                  text ?? "hello",
                  style: TextStyle(
                      color: textColor,
                      fontSize: 19,
                      fontWeight: FontWeight.bold),
                ),
                alignment: align),
          ),
          onTap: call),
    );
  }
}
