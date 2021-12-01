import 'package:custom_architecture/core/styles/custom_text_styles.dart';
import 'package:custom_architecture/core/widgets/custom_form_field.dart';
import 'package:custom_architecture/modules/authentication/view/controllers/login_controller.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  final LoginController controller;

  final _formKey = GlobalKey<FormState>();
  final _emailCtrl = TextEditingController();
  final _passCtrl = TextEditingController();

  LoginScreen({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              Text(
                'Login',
                style: CustomTextStyles.regularCustom(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    CustomFormField(
                      label: 'Email:',
                      validator: controller.isEmailValid,
                      controller: _emailCtrl,
                    ),
                    CustomFormField(
                      label: 'Senha:',
                      validator: controller.isFieldEmpty,
                      obscureText: true,
                      controller: _passCtrl,
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 20),
                      width: double.infinity,
                      child: OutlinedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            controller.login(_emailCtrl.text, _passCtrl.text);
                          }
                        },
                        child: Container(
                          padding: const EdgeInsets.all(20),
                          child: Text(
                            'ENTRAR',
                            style: CustomTextStyles.regularCustom(),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
