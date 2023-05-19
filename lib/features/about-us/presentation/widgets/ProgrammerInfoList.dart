import 'dart:math';

import 'package:facetcher/core/utils/app_text_style.dart';
import 'package:facetcher/features/about-us/presentation/widgets/programers_card_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';

class ProgrammerInfoList extends StatefulWidget {
  final List<ProgrammerInfo> programmerInfo;

  const ProgrammerInfoList({
    Key? key,
    required this.programmerInfo,
  }) : super(key: key);

  @override
  State<ProgrammerInfoList> createState() => _ProgrammerInfoListState();
}

class _ProgrammerInfoListState extends State<ProgrammerInfoList> {
  late final PageController _pageController;
  late final int _currentPage = widget.programmerInfo.length ~/ 2;

  @override
  void initState() {
    super.initState();
    _pageController =
        PageController(initialPage: _currentPage, viewportFraction: 0.7);
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
        aspectRatio: 1.2,
        child: PageView.builder(
            itemCount: widget.programmerInfo.length,
            physics: const ClampingScrollPhysics(),
            controller: _pageController,
            itemBuilder: (context, index) {
              return carouselView(index, widget.programmerInfo);
            }));
  }

  Widget carouselView(int index, List<ProgrammerInfo> recommendedBooks) {
    return AnimatedBuilder(
      animation: _pageController,
      builder: (context, child) {
        double value = 0.0;
        if (_pageController.position.haveDimensions) {
          value = index.toDouble() - (_pageController.page ?? 0);
          value = (value * 0.120).clamp(-1, 1);
        }
        return Transform.rotate(
          angle: pi * value,
          child: carouselCard(recommendedBooks[index]),
        );
      },
    );
  }

  Widget carouselCard(ProgrammerInfo info) {
    var size = MediaQuery.of(context).size;

    return Column(
      children: <Widget>[
        Expanded(
          child: Container(
            color: AppColors.background,
            padding: const EdgeInsets.symmetric(vertical: 30.0),
            width: 210,
            height: size.height-100,
            child: Hero(
              tag: info.programmerName,
              child: GestureDetector(
                onTap: () {},
                child: Card(
                  color: AppColors.background,
                  clipBehavior: Clip.hardEdge,
                  elevation: 12,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    child: Column(
                      children: [
                        Image.network(
                          info.programmerImage,
                          fit: BoxFit.fill,
                          width: size.width,
                          height: 210,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          info.programmerName,
                          style: AppTextStyle.aboutUsTitle,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
