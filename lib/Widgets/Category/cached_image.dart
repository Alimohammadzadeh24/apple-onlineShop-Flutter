import 'package:apple_online_shop/Constant/color.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CachedImage extends StatelessWidget {
  const CachedImage({super.key, required this.imageUrl});
  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: CachedNetworkImage(
        imageUrl: imageUrl ?? '',
        errorWidget: (context, url, error) => Container(
          color: Colors.red[100],
        ),
        placeholder: (context, url) => Shimmer.fromColors(
          baseColor: CustomColors.grey,
          highlightColor: Colors.grey.shade100,
          //Check This Section of Code
          child: Container(
            width: 320,
            height: 160,
            color: CustomColors.grey,
          ),
        ),
      ),
    );
  }
}
