import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class BookView extends StatelessWidget {
  const BookView({super.key, required this.image});
  final String image;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadiusGeometry.circular(12),
      child: AspectRatio(
        aspectRatio: 2.8 / 4,
        child: CachedNetworkImage(imageUrl: image, fit: BoxFit.cover),
      ),
    );
  }
}
