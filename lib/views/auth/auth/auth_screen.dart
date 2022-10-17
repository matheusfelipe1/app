import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

import 'auth_provider.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool notShow = true;
  final TextEditingController email = TextEditingController();
  final TextEditingController senha = TextEditingController();
  GlobalKey<FormState> _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
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
                    controller: email,
                    validator: (text) {
                      if (text!.isEmpty) {
                        return 'Informe seu email';
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
                        return 'Informe sua senha';
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
                        if (_key.currentState!.validate()) {
                          authProvider.sign(email.text, senha.text, context);
                        }
                      },
                      child: const Text('Acessar')),
                  SizedBox(
                    height: size.height * 0.05,
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/signup');
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
