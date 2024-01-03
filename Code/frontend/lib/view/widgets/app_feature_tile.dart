import 'package:flutter/material.dart';

import '../constants/colors.dart';

class AppFeatureTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final List<String> description;
  const AppFeatureTile({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      height: 299,
      width: 380,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            PrimaryTheme.homeAboutGd1,
            PrimaryTheme.homeAboutGd2,
          ],
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: PrimaryTheme.appBlack,
              ),
              const SizedBox(width: 10),
              Text(
                title,
                style: const TextStyle(
                  color: PrimaryTheme.appBlack,
                  fontSize: 32,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          ListView.builder(
            shrinkWrap: true,
            itemCount: description.length,
            itemBuilder: (context, index) => Text(
              description[index],
              style: const TextStyle(
                color: PrimaryTheme.appBlack,
                fontSize: 24,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
