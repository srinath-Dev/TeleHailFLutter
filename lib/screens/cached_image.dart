import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CachedImage extends StatelessWidget {
  final String imageUrl;
  final bool isRound;
  final double radius;
  final double height;
  final double width;

  final BoxFit fit;

  final String noImageAvailable =
      "https://www.google.com/url?sa=i&url=https%3A%2F%2Fpngimage.net%2Fbutton-profile-png-8%2F&psig=AOvVaw00ubT0_Vn8p3o4Z8QwXoSM&ust=1590848005872000&source=images&cd=vfe&ved=0CAIQjRxqFwoTCKjW3eWg2ekCFQAAAAAdAAAAABAU";

  CachedImage(
      this.imageUrl, {
        this.isRound = false,
        this.radius = 0,
        this.height,
        this.width,
        this.fit = BoxFit.cover,
      });

  @override
  Widget build(BuildContext context) {
    try {
      return SizedBox(
        height: isRound ? radius : height,
        width: isRound ? radius : width,
        child: ClipRRect(
            borderRadius: BorderRadius.circular(isRound ? 50 : radius),
            child: CachedNetworkImage(
              imageUrl: imageUrl,
              fit: fit,
              placeholder: (context, url) =>
                  Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) =>
                  Image.network(noImageAvailable, fit: BoxFit.cover),
            )),
      );
    } catch (e) {
      print(e);
      return Image.network(noImageAvailable, fit: BoxFit.cover);
    }
  }
}