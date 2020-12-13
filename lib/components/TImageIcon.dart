import 'package:flutter/material.dart';

class TImageIcon extends StatefulWidget {
  final String src;
  final double width;
  final double height;

  TImageIcon({this.src, this.width = 40, this.height = 40});

  @override
  _ImageIconState createState() => _ImageIconState();
}

class _ImageIconState extends State<TImageIcon> {
  @override
  Widget build(BuildContext context) {
    Widget image;
    String placeholder = "assets/images/ic_pinhua_2.png";
    if (widget.src.isEmpty) {
      image = Image.asset(
        placeholder,
        width: widget.width,
        height: widget.height,
        fit: BoxFit.cover,
      );
    } else {
      image = FadeInImage.assetNetwork(
        placeholder: placeholder,
        image: widget.src,
        width: widget.width,
        height: widget.height,
        fit: BoxFit.cover,
      );
    }
    return Container(
      child: image,
      // Image.network(
      //   widget.src,
      //   width: widget.width,
      //   height: widget.height,
      //   fit: BoxFit.cover,
      // ),
    );
  }
}
