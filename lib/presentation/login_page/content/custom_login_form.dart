import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/helper/size_customize.dart';
import 'package:weather_app/presentation/navbar.dart';
import 'package:weather_app/provider/weather_provider.dart';
import 'package:weather_app/style/custom_text.dart';
import 'package:weather_app/widgets/custom_button.dart';
import 'package:weather_app/widgets/custom_form_field.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _username = TextEditingController();
  final TextEditingController _password = TextEditingController();
  bool isSending = false;
  String error = '';
  String username = "user";
  String password = "user";
  @override
  void dispose() {
    _username.dispose();
    _password.dispose();
    super.dispose();
  }

  void showError(String errorMessage) {
    if (!mounted) return;
    setState(() {
      error = errorMessage;
    });
  }

  bool canPressButton() {
    return !isSending;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<WeatherProvider>(
      builder: (context, provider, child) {
        return Container(
          margin: EdgeInsets.symmetric(
            horizontal: SizeCustomize.setSp(15),
            vertical: SizeCustomize.setSp(30),
          ),
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)],
          ),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (error.isNotEmpty)
                  Align(
                    alignment: Alignment.centerLeft,
                    child: SubText(text: error, colors: Colors.red),
                  ),
                CustomizeTextField(
                  hintText: 'Masukkan Username',
                  textController: _username,
                  obscureText: false,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Masukkan Username!';
                    }
                    return null;
                  },
                  colors: Colors.transparent,
                  border: BorderSide(color: Colors.grey, width: 1),
                ),
                SizeCustomize.spaceArea(10),
                CustomizeTextField(
                  hintText: 'Masukkan password',
                  textController: _password,
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Masukkan Password!";
                    }
                    return null;
                  },
                  colors: Colors.transparent,
                  border: BorderSide(color: Colors.grey, width: 1),
                ),
                SizeCustomize.spaceArea(20),
                CustomizeButton(
                  widget: SubText(text: "Login", colors: Colors.white),
                  width: SizeCustomize.widthScreen(),
                  function:
                      canPressButton()
                          ? () async {
                            if (_formKey.currentState?.validate() ?? false) {
                              try {
                                setState(() => isSending = true);
                                if (_username.text != username ||
                                    _password.text != password) {
                                  throw Exception("Invalid credentials");
                                }
                                await provider.postData();
                                if (!mounted) return;
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => const NavBarScreen(),
                                  ),
                                );
                              } catch (e) {
                                if (mounted) {
                                  setState(() => isSending = false);
                                  showError("Username atau Password salah!");
                                }
                              }
                            }
                          }
                          : null,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
