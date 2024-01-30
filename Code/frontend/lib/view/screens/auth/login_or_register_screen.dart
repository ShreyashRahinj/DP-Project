import 'package:flutter/material.dart';
import 'package:frontend/controller/providers/auth_state_provider.dart';
import 'package:frontend/view/constants/enums.dart';
import 'package:provider/provider.dart';

import '../../constants/colors.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_textfield.dart';

class LoginOrRegisterScreen extends StatefulWidget {
  const LoginOrRegisterScreen({super.key});

  @override
  State<LoginOrRegisterScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginOrRegisterScreen> {
  late final TextEditingController usernameController;
  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  late final TextEditingController confirmPasswordController;

  @override
  void initState() {
    usernameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    super.initState();
  }

  void onClickLogin() {
    String email = emailController.text;
    String password = passwordController.text;
    Provider.of<AuthStateProvider>(context, listen: false).loginUser(
      email: email,
      password: password,
    );
  }

  void onClickRegister() {
    final provider = Provider.of<AuthStateProvider>(context, listen: false);
    String username = usernameController.text;
    String email = emailController.text;
    String password = passwordController.text;
    String confirmPassword = confirmPasswordController.text;
    if (password == confirmPassword) {
      provider.registerUser(
        username: username,
        email: email,
        password: password,
      );
    } else {
      provider.authState = AuthState.exception;
      provider.authError = "Passwords do not match";
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthStateProvider>(
      builder: (context, value, child) => Scaffold(
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
                        onTap:
                            value.showLoginScreen ? () {} : value.changeScreen,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 12),
                          decoration: BoxDecoration(
                            color: value.showLoginScreen
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
                        onTap:
                            value.showLoginScreen ? value.changeScreen : () {},
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 12),
                          decoration: BoxDecoration(
                            color: value.showLoginScreen
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
                const SizedBox(height: 20),
                value.authState == AuthState.exception
                    ? Text(
                        value.authError!,
                        style: const TextStyle(
                          color: PrimaryTheme.errorText,
                          fontSize: 16,
                        ),
                      )
                    : Container(),
                const SizedBox(height: 20),
                Visibility(
                  visible: !value.showLoginScreen,
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
                  visible: !value.showLoginScreen,
                  child: CustomTextField(
                    hintText: 'Confirm Password',
                    controller: confirmPasswordController,
                    obscureText: true,
                    icon: Icons.check,
                  ),
                ),
                const SizedBox(height: 40),
                value.authState == AuthState.loading
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : CustomButton(
                        buttonText:
                            value.showLoginScreen ? 'Login' : 'Register',
                        onTap: value.showLoginScreen
                            ? onClickLogin
                            : onClickRegister,
                      ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
