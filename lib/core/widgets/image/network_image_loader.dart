import 'package:flutter/material.dart';
import 'package:facetcher/core/utils/app_colors.dart';

class NetworkImageLoader extends StatefulWidget {
  final Widget loader;
  final double width;
  final double height;
  final String url;

  const NetworkImageLoader(
      {Key? key,
      required this.loader,
      required this.width,
      required this.height,
      required this.url})
      : super(key: key);

  @override
  State<NetworkImageLoader> createState() => _NetworkImageLoaderState();
}

class _NetworkImageLoaderState extends State<NetworkImageLoader> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.0),
            border: Border.all(width: 1, color: AppColors.textPrimary),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30.0),
            child: Center(
                child: Image.network(widget.url, fit: BoxFit.cover,
                    width: widget.width, height: widget.height, frameBuilder:
                        (context, child, frame, wasSynchronouslyLoaded) {
              return child;
            }, loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) {
                return child;
              } else {
                return Center(
                  child: widget.loader,
                );
              }
            })),
          ),
        ));
  }
}
