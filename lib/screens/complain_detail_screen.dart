import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rti_new_apps/controllers/complain_controller.dart';
import 'package:rti_new_apps/widgets/complaint_details/complain_question_widget.dart';
import 'package:rti_new_apps/widgets/complaint_details/complaint_answer_widget.dart';
import 'package:rti_new_apps/widgets/reusable_widget.dart';

class ComplainDetailScreen extends GetView<ComplainController> {
  const ComplainDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var data = controller.complaintDetail.first;
    return Scaffold(
      appBar: myAppBarWidget(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const ComplainQuestionWidget(),
            data.second_appeal_cic_answer != null
                ? const ComplaintAnswerWidget()
                : Container(),
          ],
        ),
      ),
    );
  }
}
