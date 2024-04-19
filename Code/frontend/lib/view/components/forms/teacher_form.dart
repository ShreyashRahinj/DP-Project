import 'package:flutter/material.dart';
import 'package:frontend/view/constants/colors.dart';
import 'package:provider/provider.dart';

import '../../../controller/providers/resources_data_provider.dart';

class TeacherForm extends StatefulWidget {
  const TeacherForm({super.key});

  @override
  State<TeacherForm> createState() => _TeacherFormState();
}

class _TeacherFormState extends State<TeacherForm> {
  late final TextEditingController idController;
  late final TextEditingController nameController;

  @override
  void initState() {
    super.initState();
    idController = TextEditingController();
    nameController = TextEditingController();
  }

  void save() {
    final provider = Provider.of<ResourcesDataProvider>(context, listen: false);
    provider.addTeacher(
      id: idController.text,
      name: nameController.text,
    );
    idController.clear();
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

  @override
  void dispose() {
    idController.dispose();
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: PrimaryTheme.appWhite,
      title: const Text("Teacher Details"),
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
                    child: Text("Teacher-ID"),
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
