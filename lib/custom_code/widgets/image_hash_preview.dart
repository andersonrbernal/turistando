// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter_blurhash/flutter_blurhash.dart';

class ImageHashPreview extends StatefulWidget {
  const ImageHashPreview({
    Key? key,
    this.width,
    this.height,
    required this.imagePath,
    required this.imageHash,
  }) : super(key: key);

  final double? width;
  final double? height;
  final String imagePath;
  final String imageHash;

  @override
  _ImageHashPreviewState createState() => _ImageHashPreviewState();
}

class _ImageHashPreviewState extends State<ImageHashPreview> {
  @override
  Widget build(BuildContext context) {
    return BlurHash(
      color: Colors.transparent,
      hash: widget.imageHash,
      image: widget.imagePath,
      imageFit: BoxFit.cover,
    );
  }
}
