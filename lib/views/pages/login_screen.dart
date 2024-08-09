import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:limerick_task/blocs/login_bloc/login_bloc.dart';
import 'package:limerick_task/main.dart';
import 'package:limerick_task/views/pages/product_screen.dart';
import 'package:limerick_task/views/widgets/custom_text_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Image.asset('assets/logo.png', height: 100),
                  const Icon(
                    Icons.login_outlined,
                    size: 100,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'প্রবেশ করুন',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  CustomTextFieldWidget(
                    controller: emailController,
                    lebel: 'Email',
                    obscureText: false,
                  ),
                  const SizedBox(height: 20),
                  CustomTextFieldWidget(
                    controller: passwordController,
                    lebel: 'Password',
                    obscureText: (state is LoginScreenState && state.isShowPassword),
                    suffixIcon: IconButton(
                      onPressed: () {
                        BlocProvider.of<LoginBloc>(context).add(LoginIsEyeButtonClickEvent());
                      },
                      icon: (state is LoginScreenState && state.isShowPassword == true) ? Icon(Icons.visibility) : Icon(Icons.visibility_off),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      BlocBuilder<LoginBloc, LoginState>(
                        builder: (context, state) {
                          if (state is LoginScreenState) {
                            return Checkbox(
                              value: state.isChecked,
                              onChanged: (bool? value) {
                                BlocProvider.of<LoginBloc>(context).add(LoginIsPrivacyButtonCheckEvent());
                              },
                            );
                          } else {
                            return Checkbox(
                              value: false,
                              onChanged: (bool? value) {
                                BlocProvider.of<LoginBloc>(context).add(LoginIsPrivacyButtonCheckEvent());
                              },
                            );
                          }
                        },
                      ),
                      const Text(
                        'আমি নীচে নীতির এই পরিষেবার সমস্ত শর্তাদি',
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),

                  // Sign In Button
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: state is LoginLoadingState
                        ? Center(child: CircularProgressIndicator())
                        : ElevatedButton(
                            onPressed: () {
                              if (state is LoginScreenState && state.isChecked == true) {
                                BlocProvider.of<LoginBloc>(context).add(LoginSignInButtonEvent(emailController.text, passwordController.text));
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => const ProductPage()),
                                );
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: (state is LoginScreenState && state.isChecked) == true ? Colors.blue : Colors.grey,
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: const Text(
                              'সাইন ইন করুন',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
