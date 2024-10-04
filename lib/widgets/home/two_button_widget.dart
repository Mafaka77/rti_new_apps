import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class TwoButtonWidget extends StatelessWidget {
  const TwoButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      crossAxisSpacing: 16,
      children: [
        Container(
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GridTile(
                child: SvgPicture.asset(
                  'images/rti.svg',
                  height: 80,
                  color: Colors.redAccent,
                ),
              ),
              Container(
                width: Get.width,
                padding: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
                child:
                    const Center(child: AutoSizeText('File RTI Application')),
              )
            ],
          ),
        ),
        Container(
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GridTile(
                child: SvgPicture.asset(
                  'images/complaint.svg',
                  height: 80,
                  color: Colors.redAccent,
                ),
              ),
              Container(
                width: Get.width,
                padding: const EdgeInsets.only(bottom: 20),
                child: const Center(child: AutoSizeText('Raise a Complaint')),
              )
            ],
          ),
        ),
      ],
    );
  }
}
