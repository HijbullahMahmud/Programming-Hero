import 'package:flutter/material.dart';
import 'package:flutter_app_template/routes/routes.dart';
import 'package:flutter_app_template/utils/assets_utils.dart';
import 'package:flutter_app_template/utils/color_res.dart';
import 'package:flutter_app_template/utils/strings.dart';
import 'package:flutter_app_template/utils/utils.dart';
import 'package:flutter_app_template/widgets/custom_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../data/storage_helper.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorRes.canvasColor,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //logo section
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Image.asset(
                    AssetsUtils.logo,
                  ),
                ),
                Text(
                  Strings.quiz,
                  style: Theme.of(context).textTheme.bodyText2,
                ),
              ],
            ),
            verticalSpacing(20),
            //high score section
            AnimatedContainer(
              duration: const Duration(seconds: 1),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    Strings.highScores,
                    style: Theme.of(context).textTheme.headline1,
                  ),
                  Text(
                    "${StorageHelper().getHighScore()} ${Strings.points}",
                    style: Theme.of(context).textTheme.headline1,
                  ),
                ],
              ),
            ),
            verticalSpacing(20),
            //start button
            CustomButton(
              onPressed: () => Get.offAndToNamed(Routes.quizScreen),
              title: Strings.start,
              size: Size(200.w, 30.h),
              borderSide: BorderSide.none,
            )
          ],
        ),
      ),
    );
  }
}
