import 'dart:ffi';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import 'package:task_assisance/app/core/utils/extention.dart';

import 'package:task_assisance/app/modules/home/controller.dart';

class DoingList extends StatelessWidget {
  final homeCtrl = Get.find<HomeController>();
  DoingList({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => homeCtrl.doingTodos.isEmpty && homeCtrl.doneTodos.isEmpty
          ? Column(
              children: [
                Image.asset(
                  'assets/images/task.png',
                  fit: BoxFit.cover,
                  width: 65.0.wp,
                ),
                Text('Add Task',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16.0.sp))
              ],
            )
          : ListView(
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              children: [
                ...homeCtrl.doingTodos.map((element) => Padding(
                  padding:  EdgeInsets.symmetric(
                    vertical: 3.0.wp,
                    horizontal: 9.0.wp),
                  child: Row(
                        children: [
                          SizedBox(
                            width: 20,
                            height: 20,
                            child: Checkbox(
                              fillColor: MaterialStateProperty.resolveWith(
                                  (states) => Colors.white),
                              value: element['done'],
                              onChanged: (value) {
                                homeCtrl.doneTodo(element['title']);
                              },
                            ),
                           
                          ),
                           Padding(
                             padding:  EdgeInsets.symmetric(horizontal: 4.0),
                             child: Text(element['title'],
                             overflow: TextOverflow.ellipsis,
                             ),
                           )
                        ],
                      ),
                )).toList(),
                if(homeCtrl.doingTodos.isNotEmpty)
               Padding(
                 padding:  EdgeInsets.symmetric(horizontal: 5.0.wp),
                 child: const Divider(thickness: 2,),
               )
              ],
            ),
    );
  }
}
