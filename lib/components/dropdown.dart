import 'package:EZReminder/global/ezreminder_colors.dart';
import 'package:flutter/material.dart';

class Dropdown extends StatefulWidget {
  final List<Map<String, dynamic>> items;
  final String hint;
  final String displayKey;
  final Function(Map<String, dynamic>?) onChanged;
  final Map<String, dynamic>? initialValue;

  const Dropdown({
    super.key,
    required this.items,
    required this.hint,
    required this.displayKey,
    required this.onChanged,
    this.initialValue,
  });

  @override
  DropdownState createState() => DropdownState();
}

class DropdownState extends State<Dropdown> {
  Map<String, dynamic>? selectedItem;

  @override
  void initState() {
    super.initState();
    selectedItem = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<Map<String, dynamic>>(
      value: selectedItem,
      hint: Text(
        widget.hint,
        style: TextStyle(color: Color(EzreminderColors.branco)),
      ),
      items: widget.items.map((item) {
        return DropdownMenuItem<Map<String, dynamic>>(
          value: item,
          child: Text(item[widget.displayKey].toString()),
        );
      }).toList(),
      onChanged: (newValue) {
        setState(() {
          selectedItem = newValue;
        });
        widget.onChanged(newValue);
      },
      borderRadius: const BorderRadius.all(Radius.circular(8)),
      dropdownColor: Color(EzreminderColors.backgroundPreto),
      style: TextStyle(color: Color(EzreminderColors.branco)),
      menuMaxHeight: 200,
    );
  }
}
