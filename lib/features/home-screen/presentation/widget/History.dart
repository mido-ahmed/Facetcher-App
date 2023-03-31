import 'package:flutter/material.dart';
import 'package:facetcher/core/utils/app_text_style.dart';

class HistoryDraws extends StatefulWidget {
  const HistoryDraws({Key? key}) : super(key: key);

  @override
  State<HistoryDraws> createState() => _HistoryDrawsState();
}

class _HistoryDrawsState extends State<HistoryDraws> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Your History",
              style: AppTextStyle.homeScreenHistory,
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                "more",
                style: AppTextStyle.historyButton,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
