import 'package:flutter/material.dart';
import 'package:todo_app_challenage/view/widget/bottom_add_task.dart';
import 'package:todo_app_challenage/view/widget/task_title.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomepageState();
}

class _HomepageState extends State<HomePage> {
  TextEditingController textcontroller = TextEditingController();
  bool isOpenBottomWidget = false;

  List exampleData = [
    ['1', false],
    ['12', false],
    ['54', false],
    ['5', false],
  ];

  //checkboxChange fn
  void checkboxChange(bool? isComplete, index) {
    setState(() {
      exampleData[index][1] = isComplete;
    });
  }

  //single delete
  void deleteAt(int index) {
    setState(() {
      exampleData.removeAt(index);
    });
  }

  //addtask fn
  void addTask() {
    setState(() {
      if (textcontroller.text.replaceAll(" ", "") != "") {
        exampleData.insert(0, [textcontroller.text, false]);
        textcontroller.clear();
      }
    });
  }

  //all delete
  void allDelete() {
    setState(() {
      exampleData.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          backgroundColor: Colors.grey[300],
          elevation: 0,
          scrolledUnderElevation: 0,
          title: Text(
            'ＴＯ ＤＯ',
            style: TextStyle(
              fontSize: 24,
              color: Colors.grey[700],
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 5),
              child: GestureDetector(
                onTap: () => allDelete(),
                child: const Icon(
                  Icons.delete_rounded,
                  size: 35,
                  color: Colors.black54,
                ),
              ),
            ),
          ],
        ),
        body: Stack(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: exampleData.isNotEmpty
                  ? ListView.builder(
                      itemCount: exampleData.length,
                      itemBuilder: (context, index) {
                        return TaskTitle(
                          key: ValueKey(exampleData[index][0]),
                          checkChange: (value) => checkboxChange(value, index),
                          title: exampleData[index][0],
                          isComplete: exampleData[index][1],
                          deleteFn: () => deleteAt(index),
                        );
                      })
                  : const Center(
                      child: Text('新增一些任務吧'),
                    ),
            ),
            //add task container
            Positioned(
                bottom: 50,
                right: 18,
                child: Padding(
                  padding: const EdgeInsets.only(left: 18),
                  child: BottomAddTask(
                    width: MediaQuery.of(context).size.width - 36,
                    isOpen: isOpenBottomWidget,
                    openSwitch: () {
                      setState(() {
                        isOpenBottomWidget = !isOpenBottomWidget;
                      });
                    },
                    textEditingController: textcontroller,
                    addFn: () => addTask(),
                  ),
                )),
          ],
        ));
  }
}
