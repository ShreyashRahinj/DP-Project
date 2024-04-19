import 'package:flutter/material.dart';
import 'package:frontend/view/constants/colors.dart';
import 'package:provider/provider.dart';

import '../../../controller/providers/resources_data_provider.dart';

const List<DropdownMenuEntry> teachers = [
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
const List<DropdownMenuEntry> courses = [
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

class DivisionForm extends StatefulWidget {
  const DivisionForm({super.key});

  @override
  State<DivisionForm> createState() => _DivisionFormState();
}

class _DivisionFormState extends State<DivisionForm> {
  late final TextEditingController idController;
  late final TextEditingController nameController;
  late final TextEditingController lectureController;
  late final TextEditingController capacityController;

  @override
  void initState() {
    super.initState();
    idController = TextEditingController();
    nameController = TextEditingController();
    lectureController = TextEditingController();
    capacityController = TextEditingController();
  }

  void save() {
    final provider = Provider.of<ResourcesDataProvider>(context, listen: false);
    provider.addCourse(
      id: idController.text,
      name: nameController.text,
      lectureNo: int.parse(lectureController.text),
      capacity: int.parse(capacityController.text),
    );
    idController.clear();
    nameController.clear();
    lectureController.clear();
    capacityController.clear();
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
    nameController.dispose();
    lectureController.dispose();
    capacityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: PrimaryTheme.appWhite,
      title: const Text("Division"),
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
                    child: Text("Name"),
                  ),
                  SizedBox(width: 8),
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
                    child: Text("Teacher"),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    flex: 2,
                    child: DropdownMenu(
                      dropdownMenuEntries: teachers,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Text("Course"),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    flex: 2,
                    child: DropdownMenu(
                      dropdownMenuEntries: courses,
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
          onTap: () {
            Navigator.pop(context);
          },
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
