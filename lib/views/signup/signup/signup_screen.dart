import 'package:app/views/signup/signup/signup_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool notShow = true;
  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController senha = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final signupProvider = Provider.of<SignupProvider>(context);
    Size size = MediaQuery.of(context).size;
    GlobalKey<FormState> _key = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro'),
        centerTitle: false,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            width: size.width * 0.8,
            child: Form(
              key: _key,
              child: Column(
                children: [
                  SizedBox(
                    height: size.height * 0.05,
                  ),
                  TextFormField(
                    controller: name,
                    validator: (text) {
                      if (text!.isEmpty) {
                        return 'Informe seu nome';
                      }
                      return null;
                    },
                    decoration:
                        const InputDecoration(hintText: 'Informe seu nome'),
                  ),
                  SizedBox(
                    height: size.height * 0.05,
                  ),
                  TextFormField(
                    controller: email,
                    validator: (text) {
                      if (text!.isEmpty) {
                        return 'Informe um email';
                      }
                      return null;
                    },
                    decoration:
                        const InputDecoration(hintText: 'Informe seu email'),
                  ),
                  SizedBox(
                    height: size.height * 0.05,
                  ),
                  TextFormField(
                    controller: senha,
                    validator: (text) {
                      if (text!.isEmpty) {
                        return 'Informe uma senha';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        hintText: 'Informe sua senha',
                        suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                notShow = !notShow;
                              });
                            },
                            child:
                                Icon(notShow ? Icons.lock : Icons.lock_open))),
                    obscureText: notShow,
                  ),
                  SizedBox(
                    height: size.height * 0.05,
                  ),
                  TextButton(
                      onPressed: () {
                        // Navigator.of(context).pop();
                        if (_key.currentState!.validate()) {
                          signupProvider.user.name = name.text;
                          signupProvider.user.email = email.text;
                          signupProvider.user.passowrd = senha.text;
                          signupProvider.register(context);
                        }
                      },
                      child: const Text('Cadastrar'))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
