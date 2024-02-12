import 'package:flutter/material.dart';
import 'package:frontend/view/components/lecture_slot_form.dart';
import 'package:frontend/view/components/resources_component.dart';
import 'package:frontend/view/constants/colors.dart';
import 'package:frontend/view/constants/resources.dart';
import 'package:frontend/view/constants/routes.dart';

class CreateTimetableScreen extends StatelessWidget {
  const CreateTimetableScreen({super.key});

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
                    onTap: () {
                      showDialog(
                        barrierDismissible: false,
                        context: context,
                        builder: (context) => const LectureSlotForm(),
                      );
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
