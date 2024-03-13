import 'package:flutter/material.dart';
// import 'package:meta/meta.dart';

class Content {
  final String? name;
  final String? imageUrl;
  final String? titleImageUrl;
  final String? videoUrl;
  final String? description;
  final Color? color;

  const Content({
    this.name,
    this.imageUrl,
    this.titleImageUrl,
    this.videoUrl,
    this.description,
    this.color,
  });
}
