import 'package:flutter/material.dart';
import 'package:frontend/controller/api/resources.dart';
import 'package:frontend/controller/providers/resources_data_provider.dart';
import 'package:frontend/view/components/forms/course_form.dart';
import 'package:frontend/view/components/forms/division_form.dart';
import 'package:frontend/view/components/forms/lecture_slot_form.dart';
import 'package:frontend/view/components/forms/room_form.dart';
import 'package:frontend/view/components/forms/teacher_form.dart';
import 'package:frontend/view/components/resources_component.dart';
import 'package:frontend/view/constants/colors.dart';
import 'package:frontend/view/constants/resources.dart';
import 'package:frontend/view/constants/routes.dart';
import 'package:frontend/view/widgets/custom_button.dart';
import 'package:provider/provider.dart';

class CreateTimetableScreen extends StatefulWidget {
  const CreateTimetableScreen({super.key});

  @override
  State<CreateTimetableScreen> createState() => _CreateTimetableScreenState();
}

class _CreateTimetableScreenState extends State<CreateTimetableScreen> {
  onClickAdd(int index) {
    switch (index) {
      case 0:
        showDialog(
          barrierDismissible: false,
          context: context,
          builder: (context) => const RoomForm(),
        );
      case 1:
        showDialog(
          barrierDismissible: false,
          context: context,
          builder: (context) => const LectureSlotForm(),
        );
      case 2:
        showDialog(
          barrierDismissible: false,
          context: context,
          builder: (context) => const TeacherForm(),
        );
      case 3:
        showDialog(
          barrierDismissible: false,
          context: context,
          builder: (context) => const CourseForm(),
        );
      case 4:
        showDialog(
          barrierDismissible: false,
          context: context,
          builder: (context) => const DivisionForm(),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PrimaryTheme.appWhite,
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, 40),
        child: AppBar(
          backgroundColor: PrimaryTheme.appBarBg,
          foregroundColor: PrimaryTheme.appWhite,
          title: InkWell(
            onTap: () {},
            child: const Text(
              'Timetable Scheduler',
              style: TextStyle(fontSize: 18, color: PrimaryTheme.appWhite),
            ),
          ),
          actions: [
            InkWell(
              onTap: () {},
              child: const Text(
                'About Us',
                style: TextStyle(
                  color: PrimaryTheme.appWhite,
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
            const SizedBox(width: 16),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, authGateRoute);
              },
              child: const Text(
                'Sign Up',
                style: TextStyle(
                  color: PrimaryTheme.appWhite,
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
            const SizedBox(width: 16),
          ],
        ),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.3,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: resourcesList.length,
                itemBuilder: (context, index) {
                  return ResourcesComponents(
                    title: resourcesList[index]['title'] as String,
                    arr: resourcesList[index]['fields'] as List<String>,
                    onTap: () => onClickAdd(index),
                  );
                },
              ),
            ),
          ),
          CustomButton(
            buttonText: 'Save Data',
            onTap: () async {
              ResourceAPIService api = ResourceAPIService();
              final provider =
                  Provider.of<ResourcesDataProvider>(context, listen: false);
              await api.saveAllData(
                lectureSlots: provider.lectureSlots,
                rooms: provider.rooms,
                teachers: provider.teachers,
                courses: provider.courses,
                divisions: provider.divisions,
              );
            },
          ),
        ],
      ),
    );
  }
}
