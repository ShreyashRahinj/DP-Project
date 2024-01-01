import 'package:flutter/material.dart';
import 'package:frontend/view/constants/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryTheme['homeBg'],
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, 40),
        child: AppBar(
          backgroundColor: primaryTheme['appBarBg'],
          leadingWidth: MediaQuery.sizeOf(context).width / 4,
          title: InkWell(
            onTap: () {},
            child: Text(
              'Timetable Scheduler',
              style:
                  TextStyle(fontSize: 18, color: primaryTheme['appBarTitle']),
            ),
          ),
          actions: [
            InkWell(
              onTap: () {},
              child: Text(
                'About Us',
                style: TextStyle(
                  color: primaryTheme['appBarTitle'],
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
            const SizedBox(width: 16),
            InkWell(
              onTap: () {},
              child: Text(
                'Sign Up',
                style: TextStyle(
                  color: primaryTheme['appBarTitle'],
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
                        Text(
                          'Timetable Scheduler',
                          style: TextStyle(
                            color: primaryTheme['homeTextBlack'],
                            fontSize: 48,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 24),
                        SizedBox(
                          width: 386,
                          child: Text(
                            'Create and generate whole year\'s timetable online by following just few steps. Super easy and fast timetable generation.',
                            style: TextStyle(
                              color: primaryTheme['homeTextBlack'],
                              fontSize: 24,
                              fontWeight: FontWeight.w200,
                            ),
                          ),
                        ),
                        const SizedBox(height: 24),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            padding: const EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              color: primaryTheme['homeButtonBg'],
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              'Create Timetable',
                              style: TextStyle(
                                color: primaryTheme['homeTextBlack'],
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
                color: primaryTheme['homeAboutBg'],
                image: DecorationImage(
                  fit: BoxFit.fitHeight,
                  image:
                      Image.asset('assets/images/tt_home_preview_2.png').image,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    padding: const EdgeInsets.all(16),
                    height: 299,
                    width: 380,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          primaryTheme['homeAboutGd1']!,
                          primaryTheme['homeAboutGd2']!,
                        ],
                      ),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.check,
                              color: primaryTheme['homeTextBlack'],
                            ),
                            const SizedBox(width: 10),
                            Text(
                              'Easy to Use',
                              style: TextStyle(
                                color: primaryTheme['homeTextBlack'],
                                fontSize: 32,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Text(
                          'Create timetable by following easy steps.',
                          style: TextStyle(
                            color: primaryTheme['homeTextBlack'],
                            fontSize: 24,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        Text(
                          'Complete all the requirements and generate the time table Easily',
                          style: TextStyle(
                            color: primaryTheme['homeTextBlack'],
                            fontSize: 24,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(16),
                    height: 299,
                    width: 380,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          primaryTheme['homeAboutGd1']!,
                          primaryTheme['homeAboutGd2']!,
                        ],
                      ),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.check,
                              color: primaryTheme['homeTextBlack'],
                            ),
                            const SizedBox(width: 10),
                            Text(
                              'Flawless ',
                              style: TextStyle(
                                color: primaryTheme['homeTextBlack'],
                                fontSize: 32,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Text(
                          'Generate a timetable with no errors.',
                          style: TextStyle(
                            color: primaryTheme['homeTextBlack'],
                            fontSize: 24,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        Text(
                          'Conflicts free super easy experience',
                          style: TextStyle(
                            color: primaryTheme['homeTextBlack'],
                            fontSize: 24,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(16),
                    height: 299,
                    width: 380,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          primaryTheme['homeAboutGd1']!,
                          primaryTheme['homeAboutGd2']!,
                        ],
                      ),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.check,
                              color: primaryTheme['homeTextBlack'],
                            ),
                            const SizedBox(width: 10),
                            Text(
                              'Quick Generate',
                              style: TextStyle(
                                color: primaryTheme['homeTextBlack'],
                                fontSize: 32,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Text(
                          'Fast Service and Quick Responsive.',
                          style: TextStyle(
                            color: primaryTheme['homeTextBlack'],
                            fontSize: 24,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        Text(
                          'Generate timetable within few minutes.',
                          style: TextStyle(
                            color: primaryTheme['homeTextBlack'],
                            fontSize: 24,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
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
