import 'package:flutter/material.dart';
import 'package:tasks/modules/archived_tasks/archived_tasks_screen.dart';
import 'package:tasks/modules/completed_tasks/completed_tasks_screen.dart';
import 'package:tasks/modules/my_tasks/my_tasks_screen.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({super.key});

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> with TickerProviderStateMixin {
  late final TabController _tabController;

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
              onPressed: () {},
              child: const Icon(Icons.add_task_rounded),
            )
          : null,
    );
  }
}
