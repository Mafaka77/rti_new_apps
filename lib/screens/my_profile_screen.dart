import 'package:flutter/material.dart';
import 'package:rti_new_apps/widgets/reusable_widget.dart';

class MyProfileScreen extends StatelessWidget {
  const MyProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBarWidget(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  isDense: true,
                  border: textBoxFocusBorder(),
                  enabledBorder: textBoxFocusBorder(),
                  focusedBorder: textBoxFocusBorder(),
                ),
              ),
              sizedBoxHeight(10),
              TextFormField(
                decoration: InputDecoration(
                  isDense: true,
                  border: textBoxFocusBorder(),
                  enabledBorder: textBoxFocusBorder(),
                  focusedBorder: textBoxFocusBorder(),
                ),
              ),
              sizedBoxHeight(10),
              TextFormField(
                decoration: InputDecoration(
                  isDense: true,
                  border: textBoxFocusBorder(),
                  enabledBorder: textBoxFocusBorder(),
                  focusedBorder: textBoxFocusBorder(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
