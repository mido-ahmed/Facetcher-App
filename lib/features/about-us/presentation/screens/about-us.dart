import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_style.dart';
import '../../../../core/widgets/app_bar_widget.dart';
import '../../../../core/widgets/icons/animated_icon_button.dart';
import '../../../../core/widgets/navigator/navigation_bar_wrapper.dart';
import '../widgets/ProgrammerInfoList.dart';
import '../widgets/programers_card_details.dart';

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
    var size = MediaQuery.of(context).size;

    final List<ProgrammerInfo> programmerInfo = [
      const ProgrammerInfo(
        programmerName: 'Tota',
        programmerImage:
            'https://cdn.shopify.com/s/files/1/0310/3571/9739/files/Best_Model_Poses_Female_-_Female_Photoshoot_Poses_for_Girls_-_Medium_Shot_-_Sunny_16_2048x2048.jpg?v=1620704328',
      ),
      const ProgrammerInfo(
        programmerName: 't',
        programmerImage:
            'https://cdn.shopify.com/s/files/1/0310/3571/9739/files/Best_Model_Poses_Female_-_Female_Photoshoot_Poses_for_Girls_-_Medium_Shot_-_Sunny_16_2048x2048.jpg?v=1620704328',
      ),
      const ProgrammerInfo(
        programmerName: 'A',
        programmerImage:
            'https://cdn.shopify.com/s/files/1/0310/3571/9739/files/Best_Model_Poses_Female_-_Female_Photoshoot_Poses_for_Girls_-_Medium_Shot_-_Sunny_16_2048x2048.jpg?v=1620704328',
      )
    ];
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
                      onPressed: () => Navigator.pop(context),
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
                        Center(
                          child: Text(
                            "About Us",
                            style: AppTextStyle.drawingScreenTitle,
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 45, vertical: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 10,
                          ),
                          child: Text(
                            'Facetcher is an app designed to generating '
                            'images of human face based on hand drawing '
                            'sketches. The app has a user-friendly '
                            'interface that makes it easy for users '
                            'to create facial sketches and generate '
                            'images of suspects.',
                            style: AppTextStyle.aboutUsDetails,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 10,
                          ),
                          child: Text(
                            'To use the app, users first provide basic case details such as the title, gender, and description. They can then begin drawing the facial sketch using the app'
                            's intuitive drawing tools. Once the sketch is complete, the app generates an image of the suspect based on the sketch. Users can edit the sketch until they are happy with the result.',
                            style: AppTextStyle.aboutUsDetails,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: size.height - 400,
                    decoration:  BoxDecoration(
                      borderRadius: BorderRadius.circular(50)
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 10, bottom: 10, left: 35, right: 35),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Team Members",
                                style: AppTextStyle.drawingScreenTitle,
                              ),
                            ],
                          ),
                        ),
                        const ProgrammerInfoList(
                          programmerInfo: [
                            ProgrammerInfo(
                              programmerName: 'Bavly Ashraf',
                              programmerImage:
                                  'https://d178ormcbshsy5.cloudfront.net/team-bavly.jpg',
                            ),
                            ProgrammerInfo(
                              programmerName: 'Alber Ashraf',
                              programmerImage:
                                  'https://d178ormcbshsy5.cloudfront.net/team-alber.jpg',
                            ),
                            ProgrammerInfo(
                              programmerName: 'Mohamed Ahmed',
                              programmerImage:
                                  'https://d178ormcbshsy5.cloudfront.net/team-mido.jpg',
                            ),
                            ProgrammerInfo(
                              programmerName: 'Henry Azer',
                              programmerImage:
                                  'https://d178ormcbshsy5.cloudfront.net/team-henry.jpg',
                            ),
                            ProgrammerInfo(
                              programmerName: 'Martina Kamal',
                              programmerImage:
                                  'https://d178ormcbshsy5.cloudfront.net/team-martina.jpg',
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
