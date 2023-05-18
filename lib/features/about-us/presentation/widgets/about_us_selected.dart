import 'package:facetcher/core/utils/app_colors.dart';
import 'package:facetcher/features/app-get-started/presentation/widgets/programers_card_details.dart';
import 'package:flutter/material.dart';
import '../../../../core/utils/app_text_style.dart';

class AboutUsSelector extends StatefulWidget {
  const AboutUsSelector({super.key});

  @override
  _AboutUsSelector createState() => _AboutUsSelector();
}

class _AboutUsSelector extends State<AboutUsSelector> {
  List<String> tabs = [
    "About Us",
    "Team Members",
  ];

  int current = 0;

  double changePositionedOfCircle() {
    switch (current) {
      case 0:
        return 0;
      case 1:
        return 115;
      default:
        return 0;
    }
  }

  double changeContainerWidth() {
    switch (current) {
      case 0:
        return 110;
      case 1:
        return 160;
      default:
        return 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    // List<ProgrammerInfo> programmerInfo = [
    //
    //   ProgrammerInfo(programmerName: 'H', programmerDescription: 'hhhhhhhhhhhhh'
    //       'hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh'),
    //   ProgrammerInfo(programmerName: 'M', programmerDescription: 'MMMMMMMMMMMMM'
    //       'MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM'),
    //   ProgrammerInfo(programmerName: 'A', programmerDescription: 'AAAAAAAAAAAAA'
    //       'AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA'
    //       'AAAA'),
    //   ProgrammerInfo(programmerName: 'B', programmerDescription: 'bbbbbbbbbbbbb'
    //       'bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb'
    //       'bbbbbbbbbbbbbbbbbbbbbbb')
    // ];
    var size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              // margin: const EdgeInsets.only(top: 10),
              width: size.width * 0.7,
              height: size.height * 0.05,
              child: Stack(
                children: [
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 1,
                    child: Container(
                      color: AppColors.background,
                      width: size.width * 0.9,
                      height: size.height * 0.5,
                      child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemCount: tabs.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(
                                  left: 15, right: 12, top: 7),
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    current = index;
                                  });
                                },
                                child: Text(tabs[index],
                                    style: AppTextStyle.aboutUsBar),
                              ),
                            );
                          }),
                    ),
                  ),
                  AnimatedPositioned(
                    curve: Curves.fastLinearToSlowEaseIn,
                    bottom: 0,
                    left: changePositionedOfCircle(),
                    duration: const Duration(milliseconds: 500),
                    child: AnimatedContainer(
                      // margin: const EdgeInsets.only(left: 2),
                      width: changeContainerWidth(),
                      height: size.height * 0.05,
                      decoration: BoxDecoration(
                        color: AppColors.grey.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      duration: const Duration(milliseconds: 1000),
                      curve: Curves.fastLinearToSlowEaseIn,
                    ),
                  )
                ],
              ),
            ),
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(top: 30),
                child: tabs[current] == tabs[0]
                    ? Container(
                        width: size.width,
                        height: MediaQuery.of(context).size.height - 250,
                        child: Scrollbar(
                          thickness: 8,
                          radius: Radius.circular(20),
                          child: SingleChildScrollView(
                              child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: 10,
                                  left: 20,
                                  right: 20,
                                ),
                                child: Text(
                                  ''' 
In the last period of time, we found that a lot of criminals commit many crimes, and they commit more and more crimes hiding behind their reliance on a disguise and getting unknown or can’t get their faces from cameras, as many places suffer from a lack of surveillance cameras. So the only main thread on the criminal case is the description of the criminal, which is the main thing that the investigators depend on as an essential item in solving the criminal case. A lot of witnesses go to investigators and have only the description of the criminal as they can’t draw faces accurately.

Hence, the main dependency of getting a criminal becomes on freehand drawing or text description only as it is not required to have a professional painter or professional drawing skills and exactly the criminal’s face details with the investigator, so the main dependency on this case doesn’t depend on a specific one as a professional painter or doesn't depend on the criminal details.

Also, the system has accessibility and portability as you can reach it from an Android device, IOS device, or computer device also it is friendly with all software as we appreciate how important is the system to reach the criminal as soon as possible as every second means a lot in finding and getting a criminal to the Justice without letting it escape.
                        ''',
                                  style: AppTextStyle.aboutUsDetails,
                                ),
                              )
                            ],
                          )),
                        ),
                      )
                    : Container(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                child: ListView.builder(
                                  itemCount: 1,
                                  physics: BouncingScrollPhysics(),
                                  shrinkWrap: true,
                                  padding: const EdgeInsets.only(bottom: 120),
                                  itemBuilder: (context, index) =>
                                      SingleChildScrollView(
                                        scrollDirection: Axis.vertical,
                                        child: Padding(
                                      padding: EdgeInsets.only(bottom: 20),
                                      child: Container(
                                        height: size.height -200,
                                        width: size.width,
                                        child: ListView(
                                          physics: ScrollPhysics(),
                                          children: const [
                                            ListTile(
                                              title: ProgrammerInfo(
                                                programmerName: 'T',
                                                programmerDescription:
                                                    'HIIIIIIIIIIII'
                                                    'IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII',
                                                programmerImage:
                                                    'https://cdn.shopify.com/s/files/1/0310/3571/9739/files/Best_Model_Poses_Female_-_Female_Photoshoot_Poses_for_Girls_-_Medium_Shot_-_Sunny_16_2048x2048.jpg?v=1620704328',
                                              ),
                                            ),
                                            ListTile(
                                              title: ProgrammerInfo(
                                                programmerName: 'h',
                                                programmerDescription:
                                                'HIIIIIIIIIIII'
                                                    'IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII',
                                                programmerImage:
                                                'https://cdn.shopify.com/s/files/1/0310/3571/9739/files/Best_Model_Poses_Female_-_Female_Photoshoot_Poses_for_Girls_-_Medium_Shot_-_Sunny_16_2048x2048.jpg?v=1620704328',
                                              ),
                                            ),
                                            ListTile(
                                              title: ProgrammerInfo(
                                                programmerName: 'm',
                                                programmerDescription:
                                                'HIIIIIIIIIIII'
                                                    'IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII',
                                                programmerImage:
                                                'https://cdn.shopify.com/s/files/1/0310/3571/9739/files/Best_Model_Poses_Female_-_Female_Photoshoot_Poses_for_Girls_-_Medium_Shot_-_Sunny_16_2048x2048.jpg?v=1620704328',
                                              ),
                                            ),
                                            ListTile(
                                              title: ProgrammerInfo(
                                                programmerName: 'i',
                                                programmerDescription:
                                                'HIIIIIIIIIIII'
                                                    'IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII',
                                                programmerImage:
                                                'https://cdn.shopify.com/s/files/1/0310/3571/9739/files/Best_Model_Poses_Female_-_Female_Photoshoot_Poses_for_Girls_-_Medium_Shot_-_Sunny_16_2048x2048.jpg?v=1620704328',
                                              ),
                                            ),
                                            ListTile(
                                              title: ProgrammerInfo(
                                                programmerName: 'k',
                                                programmerDescription:
                                                'HIIIIIIIIIIII'
                                                    'IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII',
                                                programmerImage:
                                                'https://cdn.shopify.com/s/files/1/0310/3571/9739/files/Best_Model_Poses_Female_-_Female_Photoshoot_Poses_for_Girls_-_Medium_Shot_-_Sunny_16_2048x2048.jpg?v=1620704328',
                                              ),
                                            ),
                                            ListTile(
                                              title: ProgrammerInfo(
                                                programmerName: 'l',
                                                programmerDescription:
                                                'HIIIIIIIIIIII'
                                                    'IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII',
                                                programmerImage:
                                                'https://cdn.shopify.com/s/files/1/0310/3571/9739/files/Best_Model_Poses_Female_-_Female_Photoshoot_Poses_for_Girls_-_Medium_Shot_-_Sunny_16_2048x2048.jpg?v=1620704328',
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ProgrammerInfo(programmerName: 'Tota', programmerDescription: 'My name is Sarah and I am a New York City based Flutter developer. I help entrepreneurs & businesses figure out how to build scalable applications.\n\nWith over 7 years experience spanning across many industries from B2B to B2C, I live and breath Flutter.',)
