import 'package:facetcher/core/utils/media_query_values.dart';
import 'package:flutter/material.dart';

import '../../../../config/routes/app_routes.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_style.dart';
import '../../../../core/utils/assets_manager.dart';
import '../../../../core/widgets/app_bar_widget.dart';
import '../../../../core/widgets/icons/animated_icon_button.dart';
import '../../../../core/widgets/navigator/navigation_bar_wrapper.dart';
import '../widgets/programmer_info_list.dart';
import '../widgets/programmers_card_details.dart';

class AboutUsScreen extends StatefulWidget {
  const AboutUsScreen({Key? key}) : super(key: key);

  @override
  State<AboutUsScreen> createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen> {
  bool _toggleNavigationBar = false;

  void _handleToggleNavigationBar() {
    setState(() {
      _toggleNavigationBar = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return NavigationBarWrapper(
      toggleNavigationBar: _toggleNavigationBar,
      path: ModalRoute.of(context)?.settings.name,
      child: Material(
        child: Scaffold(
            extendBody: true,
            resizeToAvoidBottomInset: true,
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AppBarWidget(
                    leftChild: IconButton(
                      icon: Icon(Icons.arrow_back, color: AppColors.white),
                      onPressed: () => Navigator.pushReplacementNamed(context, Routes.appHome),
                    ),
                    rightChild: AnimatedIconButton(
                      icon: AnimatedIcons.menu_close,
                      color: AppColors.fontPrimary,
                      onPressed: () => _handleToggleNavigationBar(),
                      durationMilliseconds: 500,
                      size: 32.0,
                      end: 1.0,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 35.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Center(child: Text("About Us", style: AppTextStyle.drawingScreenTitle,),)
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 45, right: 45, top: 10, bottom: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 10,),
                          child: Text(
                            'Facetcher is an app designed to generating '
                            'images of human face based on hand drawing '
                            'sketches. The app has a user-friendly '
                            'interface that makes it easy for users '
                            'to create facial sketches and generate images.',
                            style: AppTextStyle.aboutUsDetails,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10,),
                          child: Text(
                            'To use the app, users first provide basic case details such as the title, gender, and description. They can then begin drawing the facial sketch using the app''s '
                            'intuitive drawing tools. Once the sketch is complete, the app generates an image of the suspect based on the sketch.',
                            style: AppTextStyle.aboutUsDetails,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: context.height * 0.6,
                    decoration:  BoxDecoration(
                      borderRadius: BorderRadius.circular(50)
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 10, bottom: 10, left: 35, right: 35),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text("Team Members", style: AppTextStyle.drawingScreenTitle,),
                            ],
                          ),
                        ),
                        const ProgrammerInfoList(
                          programmerInfo: [
                            ProgrammerInfo(
                                programmerName: 'Bavly Ashraf',
                                programmerImage: ImageNetwork.teamBavly,
                                programmerGithubUrl: 'https://github.com/Bavly001',
                            ),
                            ProgrammerInfo(
                                programmerName: 'Mohamed Ahmed',
                                programmerImage: ImageNetwork.teamMido,
                                programmerGithubUrl: 'https://github.com/mido-ahmed',
                            ),
                            ProgrammerInfo(
                                programmerName: 'Henry Azer',
                                programmerImage: ImageNetwork.teamHenry,
                                programmerGithubUrl: 'https://github.com/henry-azer',
                            ),
                            ProgrammerInfo(
                                programmerName: 'Martina Kamal',
                                programmerImage: ImageNetwork.teamMartina,
                                programmerGithubUrl: 'https://github.com/Tota6',
                            ),
                            ProgrammerInfo(
                                programmerName: 'Alber Ashraf',
                                programmerImage: ImageNetwork.teamAlber,
                                programmerGithubUrl: 'https://github.com/Alber-Ashraf',
                            ),
                           ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )),
      ),
    );
  }
}
