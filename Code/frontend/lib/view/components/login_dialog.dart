import 'package:flutter/material.dart';
import 'package:frontend/view/constants/colors.dart';
import 'package:frontend/view/widgets/custom_button.dart';
import 'package:frontend/view/widgets/custom_textfield.dart';

class LoginDialog extends StatefulWidget {
  const LoginDialog({super.key});

  @override
  State<LoginDialog> createState() => _LoginDialogState();
}

class _LoginDialogState extends State<LoginDialog> {
  late final TextEditingController usernameController;
  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  late final TextEditingController confirmPasswordController;
  bool showLoginTab = false;

  @override
  void initState() {
    usernameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    super.initState();
  }

  onClickLogin() {}
  onClickRegister() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PrimaryTheme.homeAboutBg,
      body: Center(
        child: Container(
          width: MediaQuery.sizeOf(context).width / 3,
          decoration: BoxDecoration(
            color: PrimaryTheme.homeAboutGd1,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    flex: 1,
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          showLoginTab = true;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 12),
                        decoration: BoxDecoration(
                          color: showLoginTab
                              ? PrimaryTheme.tabEnable
                              : PrimaryTheme.tabDisable,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(8),
                          ),
                        ),
                        child: const Text(
                          'Login',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: PrimaryTheme.appWhite,
                            fontSize: 24,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          showLoginTab = false;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 12),
                        decoration: BoxDecoration(
                          color: showLoginTab
                              ? PrimaryTheme.tabDisable
                              : PrimaryTheme.tabEnable,
                          borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(8),
                          ),
                        ),
                        child: const Text(
                          'Register',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: PrimaryTheme.appWhite,
                            fontSize: 24,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              Visibility(
                visible: !showLoginTab,
                child: CustomTextField(
                  hintText: 'Username',
                  controller: usernameController,
                  obscureText: false,
                  icon: Icons.person,
                ),
              ),
              CustomTextField(
                hintText: 'Email',
                controller: emailController,
                obscureText: false,
                icon: Icons.email,
              ),
              CustomTextField(
                hintText: 'Password',
                controller: passwordController,
                obscureText: true,
                icon: Icons.lock,
              ),
              Visibility(
                visible: !showLoginTab,
                child: CustomTextField(
                  hintText: 'Confirm Password',
                  controller: confirmPasswordController,
                  obscureText: true,
                  icon: Icons.check,
                ),
              ),
              const SizedBox(height: 40),
              CustomButton(
                buttonText: showLoginTab ? 'Login' : 'Register',
                onTap: showLoginTab ? onClickLogin : onClickRegister,
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
