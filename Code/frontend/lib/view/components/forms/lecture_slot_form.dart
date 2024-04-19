import 'package:flutter/material.dart';
import 'package:frontend/view/constants/colors.dart';
import 'package:provider/provider.dart';

import '../../../controller/providers/resources_data_provider.dart';

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

class LectureSlotForm extends StatefulWidget {
  const LectureSlotForm({super.key});

  @override
  State<LectureSlotForm> createState() => _LectureSlotFormState();
}

class _LectureSlotFormState extends State<LectureSlotForm> {
  late final TextEditingController idController;
  late final String selectedDay;
  late final TextEditingController startTimeController;
  late final TextEditingController endTimeController;

  @override
  void initState() {
    super.initState();
    idController = TextEditingController();
    selectedDay = "";
    startTimeController = TextEditingController();
    endTimeController = TextEditingController();
  }

  void save() {
    final provider = Provider.of<ResourcesDataProvider>(context, listen: false);
    provider.addLectureSlots(
      id: idController.text,
      day: selectedDay,
      startTime: startTimeController.text,
      endTime: endTimeController.text,
    );
    idController.clear();
    selectedDay = "";
    startTimeController.clear();
    endTimeController.clear();
  }

  void onClickSave() {
    save();
    Navigator.of(context).pop();
  }

  void onClickAdd() {
    save();
  }

  void onClickCancel() {
    Navigator.of(context).pop();
  }

  @override
  void dispose() {
    idController.dispose();
    startTimeController.dispose();
    endTimeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: PrimaryTheme.appWhite,
      title: const Text("Lecture Timings"),
      shape: const LinearBorder(),
      content: Form(
        child: Container(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  const Expanded(
                    flex: 1,
                    child: Text("Slot-ID"),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    flex: 2,
                    child: TextField(
                      controller: idController,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  const Expanded(
                    flex: 1,
                    child: Text("Day"),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    flex: 2,
                    child: DropdownMenu(
                      dropdownMenuEntries: days,
                      onSelected: (value) {
                        setState(() {
                          selectedDay = value;
                        });
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  const Expanded(
                    flex: 1,
                    child: Text("Start-Time"),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    flex: 1,
                    child: TextField(
                      controller: startTimeController,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  const Expanded(
                    flex: 1,
                    child: Text("End-Time"),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    flex: 1,
                    child: TextField(
                      controller: endTimeController,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      actions: [
        InkWell(
          onTap: onClickSave,
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
          onTap: onClickAdd,
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
          onTap: onClickCancel,
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
