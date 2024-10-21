import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rti_new_apps/colors.dart';
import 'package:rti_new_apps/controllers/home_controller.dart';
import 'package:rti_new_apps/widgets/home/two_button_widget.dart';
import 'package:rti_new_apps/widgets/reusable_widget.dart';

class HomeOverflowButtonWidget extends GetView<HomeController> {
  const HomeOverflowButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      clipBehavior: Clip.none,
      fit: StackFit.loose,
      children: [
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              bottomRight: Radius.circular(70),
              bottomLeft: Radius.circular(70),
            ),
            color: MyColor.green,
          ),
          width: Get.width,
          height: Get.height * 0.25,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Image(
                    height: 50,
                    image: AssetImage('images/user.png'),
                  ),
                  sizedBoxWidth(10),
                  Obx(
                    () => controller.isMeLoading.isTrue
                        ? nameLoader()
                        : Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Welcome,',
                                style: TextStyle(
                                    fontSize: 18, color: Colors.white),
                              ),
                              SizedBox(
                                width: 250.0,
                                child: DefaultTextStyle(
                                  style: GoogleFonts.lilitaOne(
                                    fontSize: 24,
                                    letterSpacing: 2,
                                  ),
                                  child: AnimatedTextKit(
                                    animatedTexts: [
                                      TypewriterAnimatedText(
                                          controller.user.first.name!),
                                    ],
                                    onTap: () {
                                      print("Tap Event");
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Obx(
          () => controller.isFaqLoading.isTrue
              ? fileRtiLoader()
              : Positioned(
                  bottom: -80, // Overflowing the bottom of the container
                  left: 30,
                  child: GestureDetector(
                    onTap: () {
                      Get.toNamed('/submit-rti-screen');
                    },
                    child: Container(
                      width: Get.width * 0.4,
                      height: Get.height * 0.24,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(50),
                          topLeft: Radius.circular(5),
                          topRight: Radius.circular(5),
                        ),
                        color: Colors.white,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image(
                            width: Get.width * 0.16,
                            image: const AssetImage('images/search.png'),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(20.0),
                            child: Text('File RTI Application'),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
        ),

        // Button on the bottom right
        Obx(
          () => controller.isFaqLoading.isTrue
              ? fileComplaintLoader()
              : Positioned(
                  bottom: -80, // Overflowing the bottom of the container
                  right: 30,
                  child: GestureDetector(
                    onTap: () {
                      Get.toNamed('/submit-complaint');
                    },
                    child: Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(50),
                          topLeft: Radius.circular(5),
                          topRight: Radius.circular(5),
                        ),
                        color: Colors.white,
                      ),
                      width: Get.width * 0.4,
                      height: Get.height * 0.24,
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image(
                            width: 80,
                            image: AssetImage('images/issue.png'),
                          ),
                          Center(
                            child: Padding(
                              padding: EdgeInsets.all(20.0),
                              child: Text('File a Complaint'),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
        ),
      ],
    );
  }
}
