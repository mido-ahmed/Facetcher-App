import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:facetcher/data/models/user-submission/user_submission.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_style.dart';
import '../../../../core/utils/constants.dart';
import '../../../../core/utils/string_util.dart';
import '../../../../core/widgets/app_bar_widget.dart';
import '../../../../core/widgets/buttons/button_form_widget.dart';
import '../../../../core/widgets/icons/animated_icon_button.dart';
import '../../../../core/widgets/image/network_image_loader.dart';
import '../../../../core/widgets/navigator/navigation_bar_wrapper.dart';

class UserHistoryDetailsScreen extends StatefulWidget {
  const UserHistoryDetailsScreen({Key? key}) : super(key: key);

  @override
  State<UserHistoryDetailsScreen> createState() => _UserHistoryDetailsState();
}

class _UserHistoryDetailsState extends State<UserHistoryDetailsScreen> {
  bool _toggleNavigationBar = false;
  final GlobalKey _globalKey = GlobalKey();
  bool _isSavingPdf = false;

  void _handleToggleNavigationBar() {
    setState(() {
      _toggleNavigationBar = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    UserSubmission userSubmission = ModalRoute.of(context)?.settings.arguments as UserSubmission;
    String userSubmissionCode = userSubmission.inputImage.name.substring(4, userSubmission.inputImage.name.length - 4);
    return NavigationBarWrapper(
      toggleNavigationBar: _toggleNavigationBar,
      path: ModalRoute.of(context)?.settings.name,
      child: Material(
        child: Scaffold(
          extendBody: true,
          resizeToAvoidBottomInset: true,
          body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Center(
              child: Column(
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
                  RepaintBoundary(
                    key: _globalKey,
                    child: Column(
                      children: [
                        Text("Submission Report", style: AppTextStyle.drawingScreenTitle,),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 45.0),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 25.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text("Title: ", style: AppTextStyle.textReportFieldTitle,),
                                        Text(userSubmission.title, style: AppTextStyle.textReportField,),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 15.0),
                                      child: Row(
                                        children: [
                                          Text("Gender: ", style: AppTextStyle.textReportFieldTitle,),
                                          Text(StringUtil.capitalizeFirstLetter(userSubmission.gender), style: AppTextStyle.textReportField,),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 15.0),
                                      child: Row(
                                        children: [
                                          Text("Trials Count: ", style: AppTextStyle.textReportFieldTitle,),
                                          Text("${userSubmission.trialCount}", style: AppTextStyle.textReportField,),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 15.0),
                                      child: Row(
                                        children: [
                                          Text("Submission Date: ", style: AppTextStyle.textReportFieldTitle,),
                                          Text(StringUtil.convertDateTimeToDate(userSubmission.submissionDate), style: AppTextStyle.textReportField,),
                                        ],
                                      ),
                                    ),
                                    RichText(
                                      text: TextSpan(
                                        children: [
                                          TextSpan(text: "Description: ", style: AppTextStyle.textReportFieldTitle),
                                          TextSpan(text: userSubmission.description, style: AppTextStyle.textReportField,),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Center(child: Text("Your drawing and output", style: AppTextStyle.textDrawingReport,)),
                              const SizedBox(height: 10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  NetworkImageLoader(
                                    width: 150,
                                    height: 185,
                                    url: userSubmission.inputImage.imageUrl,
                                    loader: LoadingAnimationWidget.threeArchedCircle(color: Colors.white, size: 40,),
                                  ),
                                  NetworkImageLoader(
                                    width: 150,
                                    height: 185,
                                    url: userSubmission.outputImage.imageUrl,
                                    loader: LoadingAnimationWidget.threeArchedCircle(color: Colors.white, size: 40,),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30.0),
                    child: ButtonFormWidget(
                      onPress: () => _isSavingPdf ? {} : _savePdf(userSubmissionCode),
                      child: _isSavingPdf
                          ? Padding(
                              padding: const EdgeInsets.only(top: 5.0, left: 10.0),
                              child: LoadingAnimationWidget.staggeredDotsWave(
                                color: Colors.white,
                                size: 30,
                              ),
                            )
                          : Padding(
                              padding: const EdgeInsets.only(right: 10.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text("Save as pdf", style: AppTextStyle.loginButton,),
                                  const SizedBox(width: 4,),
                                  Icon(Icons.save_alt, color: AppColors.textPrimary, size: 17,),
                                ],
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
    );
  }

  Future<void> _savePdf(String userSubmissionCode) async {
    setState(() { _isSavingPdf = true; });
    try {
      final pdf = pw.Document();
      final image = pw.MemoryImage(await _captureScreenshot());
      pdf.addPage(pw.Page(
        build: (pw.Context context) => pw.Center(
          child: pw.Container(
            color: PdfColor.fromHex("#3D4149"),
            child: pw.Column(
              children: [
                pw.SizedBox(height: 50.0),
                pw.Image(image),
              ],
            ),
          ),
        ),
      ));

      final outputDir = await _getDownloadsPath();
      final outputFile = File("$outputDir/submission-report-$userSubmissionCode.pdf");
      await outputFile.writeAsBytes(await pdf.save());

      Constants.showSnackBar(context: context, message: "PDF saved successfully!");
    } catch (exception) {
      Constants.showSnackBar(context: context, message: "Failed to save PDF");
    } finally {
      setState(() { _isSavingPdf = false; });
    }
  }

  Future<Uint8List> _captureScreenshot() async {
    RenderRepaintBoundary boundary =
    _globalKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
    ui.Image image = await boundary.toImage(pixelRatio: 3.0);
    ByteData? byteData =
    await image.toByteData(format: ui.ImageByteFormat.png);
    return byteData!.buffer.asUint8List();
  }

  Future<String> _getDownloadsPath() async {
    if (Platform.isAndroid) {
      return '/storage/emulated/0/Download';
    } else if (Platform.isIOS) {
      return (await getApplicationDocumentsDirectory()).path;
    } else if (Platform.isWindows) {
      return '${Platform.environment['USERPROFILE']}\\Downloads';
    } else if (Platform.isMacOS) {
      return '${Platform.environment['HOME']}/Downloads';
    } else {
      throw UnsupportedError('Unsupported platform');
    }
  }
}
