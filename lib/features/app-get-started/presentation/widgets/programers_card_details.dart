import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/app_text_style.dart';

class ProgrammerInfo extends StatefulWidget {
  final String programmerName;
  final String programmerDescription;
  final String programmerImage;

  const ProgrammerInfo({Key? key, required this.programmerName, required this.programmerDescription, required this.programmerImage}) : super(key: key);

  @override
  State<ProgrammerInfo> createState() => _ProgrammerInfoState();
}
UniqueKey? keyTile;
bool isExpanded = false;

// Widget ListBuilder(String programmerName )=> ListView.builder(
//   itemCount: 6,
//   physics: BouncingScrollPhysics(),
//   shrinkWrap: true,
//   padding: const EdgeInsets.only(bottom: 120),
//   itemBuilder: (context, index) =>  const
//   ListTile(
//     title: programmerName,
//   ),
// );

Widget buildImage(String programmerImage) => Image.network(
  programmerImage,
  fit: BoxFit.cover,
  width: double.infinity,
  height: 200,
);
Widget buildText(BuildContext context,String programmerName,String
programmerDescription) =>
    Theme(
      data: ThemeData(
          primaryColor: AppColors.background,
          backgroundColor: AppColors.background,
          hoverColor: AppColors.grey),
      child: ExpansionTile(
        key: keyTile,
        initiallyExpanded: isExpanded,
        childrenPadding: EdgeInsets.all(20).copyWith(top: 10),
        title: Text(
          programmerName,
          style: TextStyle(
            color:
            isExpanded ? AppColors.textSecondary : AppColors.textPrimary,
            fontSize: 20,
            fontWeight: FontWeight.w700,
            fontFamily: AppStrings.fontFamilyCenturtGothicBold,
          ),
        ),
        trailing: Icon(
          Icons.info,
          size: 25,
          color: AppColors.white,
        ),
        children: [
          Text(
            programmerDescription,
            style: AppTextStyle.aboutUsDetails,
          ),
        ],
      ),
    );
class _ProgrammerInfoState extends State<ProgrammerInfo> {

  void expandTile() {
    setState(() {
      isExpanded = true;
      keyTile = UniqueKey();
    });
  }

  void shrinkTile() {
    setState(() {
      isExpanded = false;
      keyTile = UniqueKey();
    });
  }

  @override
  Widget build(BuildContext context,) {
    return Card(
      color: AppColors.grey.withOpacity(0.5),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(
            color: Colors.black.withOpacity(0.5),
            width: 2),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Column(
          children: [
            GestureDetector(
              onTap: () => isExpanded
                  ? shrinkTile()
                  : expandTile(),
              child: buildImage(widget.programmerImage),
            ),
            buildText(context,widget.programmerName,widget.programmerDescription),
          ],
        ),
      ),
    );
  }
}
