import 'package:flutter/material.dart';
import 'package:rti_new_apps/widgets/reusable_widget.dart';

class MyProfileScreen extends StatelessWidget {
  const MyProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBarWidget(),
      body: const SingleChildScrollView(
        child: Column(),
      ),
    );
  }
}
