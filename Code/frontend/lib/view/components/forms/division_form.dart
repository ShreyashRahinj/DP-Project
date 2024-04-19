import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:frontend/view/constants/colors.dart';
import 'package:provider/provider.dart';

import '../../../controller/providers/resources_data_provider.dart';
import '../../../model/course.dart';
import '../../../model/teacher.dart';

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
  late final TextEditingController nameController;
  late Teacher? selectedTeacher;
  late Course? selectedCourse;

  @override
  void initState() {
    super.initState();
    selectedCourse = null;
    selectedTeacher = null;
    nameController = TextEditingController();
  }

  void save() {
    final provider = Provider.of<ResourcesDataProvider>(context, listen: false);
    provider.addDivision(
      name: nameController.text,
      course: selectedCourse!,
      teacher: selectedTeacher!,
    );
    inspect(provider.divisions);
    nameController.clear();
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

  List<DropdownMenuEntry> getTeachers(List<Teacher> teachers) {
    List<DropdownMenuEntry> teacherEntries = [];
    for (Teacher teacher in teachers) {
      teacherEntries.add(
        DropdownMenuEntry(
          label: teacher.name,
          value: teacher,
        ),
      );
    }
    return teacherEntries;
  }

  List<DropdownMenuEntry> getCourses(List<Course> courses) {
    List<DropdownMenuEntry> courseEntries = [];
    for (Course course in courses) {
      courseEntries.add(
        DropdownMenuEntry(
          label: course.name,
          value: course,
        ),
      );
    }
    return courseEntries;
  }

  @override
  void dispose() {
    selectedTeacher = null;
    selectedCourse = null;
    nameController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ResourcesDataProvider>(
      builder: (context, value, child) => AlertDialog(
        backgroundColor: PrimaryTheme.appWhite,
        title: const Text("Division"),
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
                      child: Text("Name"),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      flex: 2,
                      child: TextField(
                        controller: nameController,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    const Expanded(
                      flex: 1,
                      child: Text("Teacher"),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      flex: 2,
                      child: DropdownMenu(
                        onSelected: (value) {
                          setState(() {
                            selectedTeacher = value;
                          });
                        },
                        dropdownMenuEntries: getTeachers(value.teachers),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    const Expanded(
                      flex: 1,
                      child: Text("Course"),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      flex: 2,
                      child: DropdownMenu(
                        onSelected: (value) {
                          setState(() {
                            selectedCourse = value;
                          });
                        },
                        dropdownMenuEntries: getCourses(value.courses),
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
      ),
    );
  }
}
