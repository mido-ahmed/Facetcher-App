import 'package:flutter/material.dart';
import 'package:facetcher/core/utils/app_text_style.dart';
import 'package:facetcher/core/widgets/navigator/navigation_bar_wrapper.dart';
import 'package:facetcher/features/app-home-screen/presentation/widget/animated_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../../config/locale/app_localizations.dart';
import '../../../../config/routes/app_routes.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/assets_manager.dart';
import '../../../../core/utils/constants.dart';
import '../../../../core/widgets/app_bar_widget.dart';
import '../../../../core/widgets/icons/animated_icon_button.dart';
import '../../../../core/widgets/image/network_image_loader.dart';
import '../../../user-profile/presentation/cubit/current_user_cubit.dart';
import '../../../user-profile/presentation/cubit/current_user_state.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _toggleNavigationBar = false;

  void _handleToggleNavigationBar() {
    setState(() {
      _toggleNavigationBar = true;
    });
  }

  @override
  void initState() {
    super.initState();
    _getCurrentUser();
  }

  _getCurrentUser() => BlocProvider.of<CurrentUserCubit>(context).findCurrentUser();

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
                leftChild: BlocConsumer<CurrentUserCubit, CurrentUserState>(
                  builder: ((context, state) {
                    if (state is CurrentUserSuccess) {
                      return Row(
                        children: [
                          TextButton(
                            style: ButtonStyle(overlayColor: MaterialStateProperty.all(Colors.transparent),),
                            onPressed: () => { Navigator.pushNamed(context, Routes.userProfile) },
                            child: CircleAvatar(
                              backgroundColor: state.user.profilePictureUrl.isEmpty ? AppColors.button : Colors.transparent,
                              radius: 23.0,
                              child: state.user.profilePictureUrl.isEmpty
                                  ? Image.network(ImageNetwork.userShape2, width: 22,)
                                  : NetworkImageLoader(
                                      width: 50,
                                      height: 50,
                                      url: state.user.profilePictureUrl,
                                      loader: LoadingAnimationWidget.threeArchedCircle(color: Colors.white, size: 25,),
                                    ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Hey, ${state.user.firstName}", style: AppTextStyle.appBarUserProfile,),
                                const SizedBox(height: 1,),
                                Text("Let’s sketch today", style: AppTextStyle.drawingScreenTitleDetails,),
                              ],
                            ),
                          ),
                        ],
                      );
                    } else {
                      return Row(
                        children: [
                          TextButton(
                            style: ButtonStyle(overlayColor: MaterialStateProperty.all(Colors.transparent),),
                            onPressed: () => { Navigator.pushNamed(context, Routes.userProfile) },
                            child: CircleAvatar(
                              backgroundColor: AppColors.button,
                              radius: 23.0,
                              child: Image.network(ImageNetwork.userShape2, width: 22,)
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Hey, ", style: AppTextStyle.appBarUserProfile,),
                                const SizedBox(height: 1,),
                                Text("Let’s sketch today", style: AppTextStyle.drawingScreenTitleDetails,),
                              ],
                            ),
                          ),
                        ],
                      );
                    }
                  }),
                  listener: ((context, state) {
                    if (state is CurrentUserError) {
                      Constants.showSnackBar(context: context, message: AppLocalizations.of(context)!.translate('something_wrong')!);
                      Navigator.pushReplacementNamed(context, Routes.appSignin);
                    }
                  }),
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
                padding: const EdgeInsets.only(top: 5.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 40.0),
                      child: Text("From sketch", style: AppTextStyle.splashTextOne,),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 100.0),
                      child: Text("To Life", style: AppTextStyle.splashTextTwo,),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30.0, right: 30.0, top: 10.0, bottom: 15.0),
                child: SizedBox(
                  child: Text("What we try to do is to reach the criminal together and get the best result in the shortest time.",
                    style: AppTextStyle.homeScreenDetails,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Your History", style: AppTextStyle.homeScreenHistory,),
                    Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: TextButton(
                        onPressed: () => Navigator.pushReplacementNamed(context, Routes.userHistory),
                        style: ButtonStyle(overlayColor: MaterialStateProperty.all(Colors.transparent),),
                        child: Text("More", style: AppTextStyle.historyButton,),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 8,
                    physics: const AlwaysScrollableScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      return Row(
                        children: [
                          Container(
                            width: 100,
                            height: 150,
                            decoration: BoxDecoration(
                                color: AppColors.textSecondary,
                                border: Border.all(color: AppColors.historyBorder, width: 1.0, style: BorderStyle.solid),
                                borderRadius: BorderRadius.circular(20)),
                          ),
                          const SizedBox(width: 18,)
                        ],
                      );
                    },
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 15.0),
                child: AnimatedCircleContainer(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
