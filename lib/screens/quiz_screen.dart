import 'package:flutter/material.dart';
import 'package:flutter_app_template/data/controllers/question_controller.dart';
import 'package:flutter_app_template/data/models/question_list.dart';
import 'package:flutter_app_template/utils/strings.dart';
import 'package:flutter_app_template/utils/utils.dart';
import 'package:flutter_app_template/widgets/custom_button.dart';
import 'package:flutter_app_template/widgets/loading_indicator.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import '../utils/color_res.dart';

class QuizScreen extends StatelessWidget {
  QuizScreen({super.key});
  final controller = Get.put(QuestionController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorRes.canvasColor,
        body: Obx(
            (() => controller.isLoading.value ? const LoadingIndicator() : _ui(context, controller.currentQuestion))));
  }

  Widget _ui(BuildContext context, Question question) {
    return Column(
      children: [
        verticalSpacing(40),
        //progress timer
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: LinearPercentIndicator(
            animation: false,
            lineHeight: 5.0,
            percent: controller.progressIndicatorTime.value.toDouble() / 10,
            linearStrokeCap: LinearStrokeCap.butt,
            progressColor: Colors.red,
          ),
        ),

        //score area
        Container(
          color: Colors.white,
          height: 50.h,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "${Strings.question}: ${controller.questionNumberText()}",
                  style: Theme.of(context).textTheme.headline2!.copyWith(color: ColorRes.primaryColor),
                ),
                Text(
                  "${Strings.score}: ${controller.totalScore.value}",
                  style: Theme.of(context).textTheme.headline2!.copyWith(color: ColorRes.primaryColor),
                )
              ],
            ),
          ),
        ),
        verticalSpacing(10),
        // question area
        Container(
          margin: const EdgeInsets.all(15),
          height: 300.h,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10.r)), color: Colors.white),
          child: Stack(
            alignment: Alignment.center,
            children: [
              verticalSpacing(5),
              //point
              AnimatedPositioned(
                top: 5,
                duration: const Duration(seconds: 1),
                child: Text(
                  "${question.score} ${Strings.point}",
                  style: Theme.of(context).textTheme.headline3!.copyWith(color: ColorRes.primaryColor),
                ),
              ),

              //image
              question.questionImageUrl != null && question.questionImageUrl != "null"
                  ? AnimatedPositioned(
                      top: 35,
                      duration: const Duration(seconds: 1),
                      child: Image.network(
                        question.questionImageUrl!,
                        height: 200,
                      ),
                    )
                  : const SizedBox(),
              verticalSpacing(20),
              //question

              AnimatedPositioned(
                bottom: 5,
                left: 5,
                right: 5,
                duration: const Duration(seconds: 1),
                child: Text(
                  question.question ?? '',
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: Theme.of(context)
                      .textTheme
                      .headline1!
                      .copyWith(color: ColorRes.primaryColor, fontWeight: FontWeight.bold),
                ),
              ),
              verticalSpacing(5),
            ],
          ),
        ),

        question.answers!.a != null
            ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                child: CustomButton(
                  onPressed: () => controller.isButtonClickable.value ? controller.checkAnswer("A") : null,
                  title: question.answers!.a ?? "",
                  borderSide: controller.aButtonBorder.value,
                  size: Size(MediaQuery.of(context).size.width, 35),
                ),
              )
            : const SizedBox(),
        question.answers!.b != null
            ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                child: CustomButton(
                  onPressed: () => controller.isButtonClickable.value ? controller.checkAnswer("B") : null,
                  title: question.answers!.b ?? "",
                  borderSide: controller.bButtonBorder.value,
                  size: Size(MediaQuery.of(context).size.width, 35),
                ),
              )
            : const SizedBox(),
        question.answers!.c != null
            ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                child: CustomButton(
                  onPressed: () => controller.isButtonClickable.value ? controller.checkAnswer("C") : null,
                  title: question.answers!.c ?? "",
                  borderSide: controller.cButtonBorder.value,
                  size: Size(MediaQuery.of(context).size.width, 35),
                ),
              )
            : const SizedBox(),
        question.answers!.d != null
            ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                child: CustomButton(
                  onPressed: () => controller.isButtonClickable.value ? controller.checkAnswer("D") : null,
                  title: question.answers!.d ?? "",
                  borderSide: controller.dButtonBorder.value,
                  size: Size(MediaQuery.of(context).size.width, 35),
                ),
              )
            : const SizedBox(),
      ],
    );
  }
}
