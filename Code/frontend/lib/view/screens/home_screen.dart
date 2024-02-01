import 'package:flutter/material.dart';
import 'package:frontend/view/constants/colors.dart';
import 'package:frontend/view/constants/routes.dart';
import 'package:frontend/view/widgets/app_feature_tile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void toLoginDialog() {
    Navigator.pushNamed(context, createTimetableScreenRoute);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PrimaryTheme.homeBg,
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, 40),
        child: AppBar(
          backgroundColor: PrimaryTheme.appBarBg,
          leadingWidth: MediaQuery.sizeOf(context).width / 4,
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.sizeOf(context).height / 2,
              padding: const EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Timetable Scheduler',
                          style: TextStyle(
                            color: PrimaryTheme.appBlack,
                            fontSize: 48,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 24),
                        const SizedBox(
                          width: 386,
                          child: Text(
                            'Create and generate whole year\'s timetable online by following just few steps. Super easy and fast timetable generation.',
                            style: TextStyle(
                              color: PrimaryTheme.appBlack,
                              fontSize: 24,
                              fontWeight: FontWeight.w200,
                            ),
                          ),
                        ),
                        const SizedBox(height: 24),
                        InkWell(
                          onTap: toLoginDialog,
                          child: Container(
                            padding: const EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              color: PrimaryTheme.homeButtonBg,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Text(
                              'Create Timetable',
                              style: TextStyle(
                                color: PrimaryTheme.appBlack,
                                fontSize: 22,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    child: Image.asset('assets/images/tt_home_preview_1.png'),
                  ),
                ],
              ),
            ),
            Container(
              height: MediaQuery.sizeOf(context).height / 2,
              decoration: BoxDecoration(
                color: PrimaryTheme.homeAboutBg,
                image: DecorationImage(
                  fit: BoxFit.fitHeight,
                  image:
                      Image.asset('assets/images/tt_home_preview_2.png').image,
                ),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  AppFeatureTile(
                    icon: Icons.check,
                    title: 'Easy to Use',
                    description: [
                      'Create timetable by following easy steps.',
                      'Complete all the requirements and generate the time table Easily.',
                    ],
                  ),
                  AppFeatureTile(
                    icon: Icons.check,
                    title: 'Flawless',
                    description: [
                      'Generate a timetable with no errors.',
                      'Conflicts free super easy experience.',
                    ],
                  ),
                  AppFeatureTile(
                    icon: Icons.check,
                    title: 'Quick Generate',
                    description: [
                      'Fast Service and Quick Responsive.',
                      'Generate timetable within few minutes.',
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
