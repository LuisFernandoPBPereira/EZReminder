import 'package:ez_reminder/components/sidebar.dart';
import 'package:ez_reminder/global/ezreminder_colors.dart';
import 'package:flutter/material.dart';

class AppLayout extends StatelessWidget {
  final Widget content;
  final Widget? customFloatingActionButton;
  final FloatingActionButtonLocation? customFloatingActionButtonLocation;

  const AppLayout(
      {super.key,
      required this.content,
      this.customFloatingActionButton,
      this.customFloatingActionButtonLocation});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(EzreminderColors.backgroundPreto),
        appBar: AppBar(
          toolbarHeight: 75,
          backgroundColor: Color(EzreminderColors.primaryVerde),
          leading: Builder(builder: (context) {
            return IconButton(
              icon: const Icon(
                Icons.menu,
                size: 50,
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          }),
          actions: const [
            Icon(
              Icons.notifications,
              size: 50,
            )
          ],
          automaticallyImplyLeading: false,
        ),
        body: content,
        drawer: Sidebar(),
        floatingActionButton: customFloatingActionButton,
        floatingActionButtonLocation: customFloatingActionButtonLocation,
      ),
    );
  }
}
