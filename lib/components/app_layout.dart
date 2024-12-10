import 'package:EZReminder/components/sidebar.dart';
import 'package:EZReminder/global/ezreminder_colors.dart';
import 'package:EZReminder/screens/home.dart';
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
          actions: [
            IconButton(
              icon: const Icon(
                Icons.home,
                size: 50,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Home()),
                );
              },
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
