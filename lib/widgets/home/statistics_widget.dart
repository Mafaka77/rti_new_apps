import 'package:flutter/material.dart';
import 'package:rti_new_apps/colors.dart';
import 'package:rti_new_apps/widgets/reusable_widget.dart';

class StatisticsWidget extends StatelessWidget {
  const StatisticsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 5,
                height: 10,
                color: MyColor.green,
              ),
              sizedBoxWidth(5),
              const Text('Online RTI Count'),
            ],
          ),
          sizedBoxHeight(10),
          Container(
            color: Colors.white,
            child: ListTile(
              leading: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Today',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '1',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              trailing: Card(
                borderOnForeground: true,
                color: MyColor.lightGreen,
                elevation: 0,
                child: const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text('5 Oct'),
                ),
              ),
            ),
          ),
          sizedBoxHeight(10),
          Container(
            color: Colors.white,
            child: ListTile(
              leading: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Week',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '4',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              trailing: Card(
                borderOnForeground: true,
                color: MyColor.lightGreen,
                elevation: 0,
                child: const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text('5 Oct - 9 Oct'),
                ),
              ),
            ),
          ),
          sizedBoxHeight(10),
          Container(
            color: Colors.white,
            child: ListTile(
              leading: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Month',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '4',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              trailing: Card(
                borderOnForeground: true,
                color: MyColor.lightGreen,
                elevation: 0,
                child: const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text('Oct'),
                ),
              ),
            ),
          ),
          sizedBoxHeight(10),
          Container(
            color: Colors.white,
            child: ListTile(
              leading: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Year',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '4',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              trailing: Card(
                borderOnForeground: true,
                color: MyColor.lightGreen,
                elevation: 0,
                child: const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text('2024'),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
