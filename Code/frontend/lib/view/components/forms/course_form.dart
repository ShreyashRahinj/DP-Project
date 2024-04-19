import 'package:flutter/material.dart';
import 'package:frontend/controller/providers/resources_data_provider.dart';
import 'package:frontend/view/constants/colors.dart';
import 'package:provider/provider.dart';

class CourseForm extends StatefulWidget {
  const CourseForm({super.key});

  @override
  State<CourseForm> createState() => _CourseFormState();
}

class _CourseFormState extends State<CourseForm> {
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
      title: const Text("Course Details"),
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
                    child: Text("Course-ID"),
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
                    child: Text("No. of Lectures"),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    flex: 2,
                    child: TextField(
                      controller: lectureController,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  const Expanded(
                    flex: 1,
                    child: Text("Capacity"),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    flex: 2,
                    child: TextField(
                      controller: capacityController,
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
