import 'package:flutter/material.dart';
import 'package:frontend/view/constants/colors.dart';

class InputComponents extends StatelessWidget {
  final String title;
  final List<String> arr;
  final Function() onTap;

  const InputComponents({
    super.key,
    required this.title,
    required this.arr,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        alignment: Alignment.center,
        height: MediaQuery.sizeOf(context).height * 0.28,
        width: MediaQuery.sizeOf(context).height * 0.28,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: PrimaryTheme.inputFieldComponentBg,
          border: Border.all(
            color: PrimaryTheme.appBlack.withOpacity(0.05),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 28,
              ),
            ),
            const SizedBox(height: 16),
            ListView.builder(
              shrinkWrap: true,
              itemCount: arr.length,
              itemBuilder: (context, index) {
                return Container(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.circle_rounded,
                        size: 8,
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      Text(
                        arr[index],
                        style: const TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            const SizedBox(height: 16),
            InkWell(
              onTap: onTap,
              child: Container(
                width: double.infinity,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: PrimaryTheme.homeButtonBg,
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(
                    color: PrimaryTheme.appBlack.withOpacity(0.1),
                  ),
                ),
                padding: const EdgeInsets.all(4),
                child: const Text(
                  'Add',
                  style: TextStyle(
                    fontSize: 22,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
