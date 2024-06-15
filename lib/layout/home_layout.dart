import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tasks/models/task_model/task_model.dart';
import 'package:tasks/modules/archived_tasks/archived_tasks_screen.dart';
import 'package:tasks/modules/completed_tasks/completed_tasks_screen.dart';
import 'package:tasks/modules/my_tasks/my_tasks_screen.dart';
import 'package:tasks/shared/components/custom_snack_bar/custom_snack_bar.dart';
import 'package:tasks/shared/cubit/task_cubit.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({super.key});

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> with TickerProviderStateMixin {
  late final TabController _tabController;
  bool textFieldVisibility = false;
  bool enableSaveButton = false;
  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  String? date;
  String? time;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this, initialIndex: 0);
    _tabController.addListener(_handleTabIndex);
  }

  @override
  void dispose() {
    _tabController.removeListener(_handleTabIndex);
    _tabController.dispose();
    super.dispose();
  }

  void _handleTabIndex() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tasks'),
        centerTitle: true,
        bottom: TabBar(
          controller: _tabController,
          tabs: const <Widget>[
            Tab(
              text: 'My Tasks',
            ),
            Tab(
              text: 'Completed',
            ),
            Tab(
              text: 'Archived',
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const <Widget>[
          MyTasksScreen(),
          CompletedTasksScreen(),
          ArchivedTasksScreen(),
        ],
      ),
      floatingActionButton: _tabController.index == 0
          ? FloatingActionButton(
              onPressed: () {
                customModalBottomSheet(context).whenComplete(
                  () {
                    textFieldVisibility = false;
                    enableSaveButton = false;
                  },
                );
              },
              child: const Icon(Icons.add_task_rounded),
            )
          : null,
    );
  }

  Future<dynamic> customModalBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setModalState) {
            return Padding(
              padding: EdgeInsets.only(
                  right: 25.0,
                  left: 25.0,
                  top: 25.0,
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  TextField(
                    controller: nameController,
                    autofocus: true,
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                      hintText: 'Task Name',
                      border: InputBorder.none,
                    ),
                    onChanged: (value) {
                      if (value.isNotEmpty && value.trim().isNotEmpty) {
                        setModalState(
                          () {
                            enableSaveButton = true;
                          },
                        );
                      } else {
                        setModalState(
                          () {
                            enableSaveButton = false;
                          },
                        );
                      }
                    },
                  ),
                  Visibility(
                    visible: textFieldVisibility,
                    child: TextField(
                      controller: descriptionController,
                      autofocus: true,
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                        hintText: 'Description',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 25.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            GestureDetector(
                              onTap: () {
                                setModalState(
                                  () {
                                    textFieldVisibility = true;
                                  },
                                );
                              },
                              child: const Icon(
                                Icons.description_rounded,
                              ),
                            ),
                            const SizedBox(
                              width: 20.0,
                            ),
                            GestureDetector(
                              onTap: () {
                                showDatePicker(
                                  context: context,
                                  firstDate: DateTime.now(),
                                  lastDate: DateTime(DateTime.now().year + 1),
                                  initialDate: DateTime.now(),
                                ).then(
                                  (value) {
                                    if (value != null) {
                                      date = DateFormat.MMMEd().format(value);
                                    }
                                  },
                                );
                              },
                              child: const Icon(
                                Icons.calendar_month_rounded,
                              ),
                            ),
                            const SizedBox(
                              width: 20.0,
                            ),
                            GestureDetector(
                              onTap: () {
                                showTimePicker(
                                  context: context,
                                  initialTime: TimeOfDay.now(),
                                ).then(
                                  (value) {
                                    if (value != null) {
                                      final now = DateTime.now();
                                      time = DateFormat.jm().format(
                                        DateTime(now.year, now.month, now.day,
                                            value.hour, value.minute),
                                      );
                                    }
                                  },
                                );
                              },
                              child: const Icon(
                                Icons.watch_later_rounded,
                              ),
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: enableSaveButton
                              ? () {
                                  setState(() {
                                    TaskCubit.getCubit(context).insertTask(
                                      TaskModel(
                                          name: nameController.text,
                                          description:
                                              descriptionController.text.isEmpty
                                                  ? null
                                                  : descriptionController.text,
                                          date: date,
                                          time: time,
                                          status: 0),
                                    );
                                    nameController.clear();
                                    descriptionController.clear();
                                    date = null;
                                    time = null;
                                    Navigator.pop(context);
                                    customSnackBar(
                                        context, 'Task Created Successfully.');
                                  });
                                }
                              : () {},
                          child: Text(
                            'Add',
                            textAlign: TextAlign.end,
                            style: TextStyle(
                                color: enableSaveButton
                                    ? Colors.blue.shade700
                                    : Colors.grey,
                                fontSize: 16.0,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
