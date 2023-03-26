import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_style.dart';
import '../../../../core/widgets/app_bar_widget.dart';
import '../../../../core/widgets/buttons/button_widget.dart';
import '../../../../core/widgets/icons/animated_icon_button.dart';
import '../../../../core/widgets/navigator/navigation_bar_wrapper.dart';
import '../widgets/drawing_details_forms_widget.dart';

class DrawingDetails extends StatefulWidget {
  const DrawingDetails({Key? key}) : super(key: key);

  @override
  State<DrawingDetails> createState() => _DrawingDetailsState();
}

class _DrawingDetailsState extends State<DrawingDetails> {
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
          body: Column(
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
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Text(
                      "Add drawing details",
                      style: AppTextStyle.drawingScreenTitle,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(
                        "Enter all the details and description for the drawing, as all what you do here is recorded",
                        style: AppTextStyle.drawingScreenTitleDetails,
                      ),
                    ),
                  ],
                ),
              ),
              DrawingDetailsForms(),
              ButtonWidget(
                backgroundColor: AppColors.navigatorItem,
                onPress: () {
                  Navigator.of(context).pushNamed('/app-drawing-screen');
                },
                text: "Next",
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Next",
                      style: AppTextStyle.buttonText,
                    ),
                    Icon(
                      Icons.arrow_forward_sharp,
                      color: AppColors.textPrimary,
                      size: 17,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
