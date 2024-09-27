import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rti_new_apps/controllers/rti_controller.dart';
import 'package:rti_new_apps/models/my_rti_details_model.dart';
import 'package:rti_new_apps/widgets/reusable_widget.dart';
import 'package:rti_new_apps/widgets/rti_details/first_appeal_question_widget.dart';
import 'package:rti_new_apps/widgets/rti_details/question_widget.dart';
import 'package:rti_new_apps/widgets/rti_details/spio_answer_widget.dart';

class RtiDetailScreen extends GetView<RtiController> {
  const RtiDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var data = controller.myRtiDetails.first;
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Container(
          width: Get.width,
          margin: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const RtiDetailsQuestionWidget(),
              sizedBoxHeight(20),
              data.spio_answer != null ? const SpioAnswerWidget() : Container(),
              data.first_appeal_citizen_question != null
                  ? const FirstQuestionAppealWidget()
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }
}
