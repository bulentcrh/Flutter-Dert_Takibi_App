import 'package:f43_dert_takibi_app/Pages/HomePage/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class ToDoTile extends StatelessWidget {
  final String taskName;
  final String taskDetail;
  final double taskPercent;
  Function(BuildContext)? deleteFunction;

  ToDoTile(
      {Key? key,
      required this.taskName,
      required this.taskDetail,
      required this.taskPercent,
      required this.deleteFunction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: GestureDetector(
        onTap: () {
          print("Container'a basıldı");
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => TaskDetail()));
        },
        child: Slidable(
          endActionPane: ActionPane(
            motion: StretchMotion(),
            children: [
              SlidableAction(
                  onPressed: deleteFunction,
                  icon: Icons.delete,
                  backgroundColor: Colors.red),
            ],
          ),
          child: Container(
            padding: EdgeInsets.all(25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 150,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            taskName,
                            style: TextStyle(fontSize: 20),
                          ),
                          SizedBox(
                            height: 7,
                          ),
                          Text(taskDetail),
                        ],
                      ),
                    ),
                    CircularPercentIndicator(
                      radius: 45,
                      lineWidth: 10,
                      percent: (taskPercent / 10),
                      progressColor: Color(0xff1CB8AA),
                      backgroundColor: Colors.red.shade200,
                      circularStrokeCap: CircularStrokeCap.round,
                      center: Text(
                        "%" + (taskPercent * 10).toString(),
                        style: TextStyle(fontSize: 18),
                      ),
                    )
                  ],
                )
              ],
            ),
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: Color.fromARGB(255, 116, 116, 116),
                      blurRadius: 15,
                      spreadRadius: 0)
                ],
                color: Color(0xffFFFFFF),
                borderRadius: BorderRadius.circular(12)),
          ),
        ),
      ),
    );
  }
}
