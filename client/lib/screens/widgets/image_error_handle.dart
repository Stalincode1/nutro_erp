import 'package:flutter/material.dart';

class ImageErrorHandle extends StatefulWidget {
  final double height;
  final double width;
  final Color iconColor;
  final IconData iconData;
  final double iconSize;

  const ImageErrorHandle({
    super.key,
    required this.height,
    required this.width,
    required this.iconColor,
    required this.iconData,
    required this.iconSize,
  });

  @override
  State<ImageErrorHandle> createState() => _ImageErrorHandleState();
}

class _ImageErrorHandleState extends State<ImageErrorHandle> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      width: widget.width,
      child: Center(
        child: Icon(
          widget.iconData,
          color: widget.iconColor,
          size: widget.iconSize,
        ),
      ),
    );
  }
}
