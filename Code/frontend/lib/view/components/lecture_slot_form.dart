import 'package:flutter/material.dart';
import 'package:frontend/view/constants/colors.dart';

const List<DropdownMenuEntry> days = [
  DropdownMenuEntry(
    label: "Monday",
    value: "Monday",
  ),
  DropdownMenuEntry(
    label: "Tuesday",
    value: "Tuesday",
  ),
  DropdownMenuEntry(
    label: "Wednesday",
    value: "Wednesday",
  ),
  DropdownMenuEntry(
    label: "Thursday",
    value: "Thursday",
  ),
  DropdownMenuEntry(
    label: "Friday",
    value: "Friday",
  ),
];

class LectureSlotForm extends StatelessWidget {
  const LectureSlotForm({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: PrimaryTheme.appWhite,
      title: const Text("Lecture Timings"),
      shape: const LinearBorder(),
      content: Form(
        child: Container(
          padding: const EdgeInsets.all(24),
          child: const Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Text("Slot-ID"),
                  ),
                  Expanded(
                    flex: 2,
                    child: TextField(),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Text("Day"),
                  ),
                  Expanded(
                    flex: 2,
                    child: DropdownMenu(
                      dropdownMenuEntries: days,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Text("Start-Time"),
                  ),
                  Expanded(
                    flex: 1,
                    child: TextField(),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    flex: 1,
                    child: TextField(),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Text("End-Time"),
                  ),
                  Expanded(
                    flex: 1,
                    child: TextField(),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    flex: 1,
                    child: TextField(),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      actions: [
        InkWell(
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: PrimaryTheme.tabEnable,
            ),
            child: const Text('Save'),
          ),
        ),
        InkWell(
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: PrimaryTheme.tabDisable,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Text('Save and Add'),
          ),
        ),
        InkWell(
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: PrimaryTheme.errorText,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Text('Cancel'),
          ),
        ),
      ],
    );
  }
}
