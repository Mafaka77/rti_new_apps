import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rti_new_apps/colors.dart';
import 'package:rti_new_apps/controllers/profile_controller.dart';
import 'package:rti_new_apps/main.dart';
import 'package:rti_new_apps/widgets/reusable_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
      init: ProfileController(),
      builder: (controller) {
        return Scaffold(
          appBar: myAppBarWidget(),
          body: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Obx(
                  () => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          width: Get.width,
                          height: Get.height * 0.13,
                          padding: const EdgeInsets.all(20),
                          color: MyColor.green,
                          child: FittedBox(
                            fit: BoxFit.fitWidth,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                controller.isMeLoading.isTrue
                                    ? nameLoader()
                                    : Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Text(
                                            'Welcome,',
                                            style: TextStyle(fontSize: 18),
                                          ),
                                          Container(
                                            padding:
                                                const EdgeInsets.only(left: 30),
                                            width: 250.0,
                                            child: DefaultTextStyle(
                                              style: GoogleFonts.lilitaOne(
                                                fontSize: 20,
                                                letterSpacing: 2,
                                              ),
                                              child: AnimatedTextKit(
                                                animatedTexts: [
                                                  TypewriterAnimatedText(
                                                      controller
                                                          .user.first.name!),
                                                ],
                                                onTap: () {
                                                  print("Tap Event");
                                                },
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                CircleAvatar(
                                  radius: 20,
                                  backgroundColor: Colors.white,
                                  child: IconButton(
                                    onPressed: () {
                                      openLogoutDialog(context, controller);
                                    },
                                    icon: Icon(
                                      Icons.logout,
                                      color: MyColor.green,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )),
                      sizedBoxHeight(10),
                      ListTile(
                        onTap: () {
                          Get.toNamed('/my-profile-screen');
                        },
                        contentPadding: const EdgeInsets.all(10),
                        dense: true,
                        tileColor: Colors.white,
                        leading: const FittedBox(
                          fit: BoxFit.fitWidth,
                          child: Image(
                            image: AssetImage('images/user.png'),
                          ),
                        ),
                        title: const Text('My Profile'),
                        trailing: IconButton(
                            onPressed: () {
                              Get.toNamed('/my-profile-screen');
                            },
                            icon: const Icon(Icons.arrow_forward_ios_outlined)),
                      ),
                      sizedBoxHeight(10),
                      ListTile(
                        onTap: () {
                          Get.toNamed('/payment-history-screen');
                        },
                        contentPadding: const EdgeInsets.all(10),
                        dense: true,
                        tileColor: Colors.white,
                        leading: const Image(
                          image: AssetImage('images/invoice.png'),
                        ),
                        title: const Text('Payment History'),
                        trailing: IconButton(
                            onPressed: () {
                              Get.toNamed('/payment-history-screen');
                            },
                            icon: const Icon(Icons.arrow_forward_ios_outlined)),
                      ),
                      sizedBoxHeight(10),
                      ListTile(
                        onTap: () {
                          Get.toNamed('/terms-screen');
                        },
                        contentPadding: const EdgeInsets.all(10),
                        dense: true,
                        tileColor: Colors.white,
                        leading: const Image(
                          image: AssetImage('images/terms-and-conditions.png'),
                        ),
                        title: const Text('Terms & Conditions'),
                        trailing: IconButton(
                            onPressed: () {
                              Get.toNamed('/terms-screen');
                            },
                            icon: const Icon(Icons.arrow_forward_ios_outlined)),
                      ),
                      sizedBoxHeight(10),
                      ListTile(
                        onTap: () {
                          Get.toNamed('/payment-policy-screen');
                        },
                        contentPadding: const EdgeInsets.all(10),
                        dense: true,
                        tileColor: Colors.white,
                        leading: const Image(
                          image: AssetImage('images/credit-card.png'),
                        ),
                        title: const Text('Payment Terms'),
                        trailing: IconButton(
                            onPressed: () {
                              Get.toNamed('/payment-policy-screen');
                            },
                            icon: const Icon(Icons.arrow_forward_ios_outlined)),
                      ),
                      sizedBoxHeight(10),
                      ListTile(
                        onTap: () {
                          openDeleteDialog(context, controller);
                        },
                        contentPadding: const EdgeInsets.all(10),
                        dense: true,
                        tileColor: Colors.white,
                        leading: const Image(
                          image: AssetImage('images/delete.png'),
                        ),
                        title: const Text('Delete Account'),
                        trailing: IconButton(
                            onPressed: () {
                              openDeleteDialog(context, controller);
                            },
                            icon: const Icon(Icons.arrow_forward_ios_outlined)),
                      )
                    ],
                  ),
                )),
          ),
        );
      },
    );
  }

  void openDeleteDialog(BuildContext context, ProfileController controller) {
    showDialog(
        context: context,
        builder: (_) {
          return CupertinoAlertDialog(
            title: const Column(
              children: [
                Image(
                  height: 40,
                  image: AssetImage('images/delete.png'),
                ),
                Text('Are you sure?'),
              ],
            ),
            content: const Text('You want to delete your account permanently'),
            actions: [
              MaterialButton(
                onPressed: () {
                  Get.back();
                },
                child: const Text('NO'),
              ),
              MaterialButton(
                onPressed: () {
                  controller.deleteAccount(() {
                    showLoader(context);
                  }, () {
                    hideLoader();
                    Get.offAllNamed('/');
                  }, () {
                    hideLoader();
                  });
                },
                child: const Text('YES'),
              ),
            ],
          );
        });
  }

  void openLogoutDialog(BuildContext context, ProfileController controller) {
    showDialog(
        context: context,
        builder: (_) {
          return CupertinoAlertDialog(
            title: const Column(
              children: [
                Image(
                  height: 40,
                  image: AssetImage('images/logout.png'),
                ),
                Text('Come back soon!'),
              ],
            ),
            content: const Text('Are you sure you want to Log Out?'),
            actions: [
              MaterialButton(
                onPressed: () {
                  Get.back();
                },
                child: const Text('NO'),
              ),
              MaterialButton(
                onPressed: () {
                  print(storage.read('token'));
                  // storage.erase();
                  controller.logout(() {
                    showLoader(context);
                  }, () {
                    storage.erase();
                    Get.offAllNamed('/');
                    hideLoader();
                  }, () {
                    hideLoader();
                  });
                },
                child: const Text('YES'),
              ),
            ],
          );
        });
  }
}
