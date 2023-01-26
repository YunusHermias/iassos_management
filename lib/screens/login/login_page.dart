import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iassos_management/globals/providers.dart';
import 'package:iassos_management/screens/login/login_controller.dart';
import 'package:iassos_management/screens/login/widgets/login_input.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  late TextEditingController usernameTextEditingController;
  late TextEditingController passwordTextEditingController;

  @override
  void initState() {
    super.initState();
    usernameTextEditingController = TextEditingController();
    passwordTextEditingController = TextEditingController();
  }

  showSnackBar(String msg, BuildContext buildContext) {
    SnackBar snackBar = SnackBar(
      content: Text(msg),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    final LoginController loginController = ref.watch(loginProvider);
    return ModalProgressHUD(
      inAsyncCall: loginController.isLoginInProgress,
      child: Scaffold(
        backgroundColor: Colors.black12,
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "Iassos Management",
          ),
        ),
        body: Center(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12.0),
            ),
            height: 500.0,
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Login",
                    style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 50.0,
                  ),
                  LoginInput(
                      iconData: Icons.person,
                      labelText: "Username",
                      textEditingController: usernameTextEditingController),
                  LoginInput(
                    obscure: true,
                    iconData: Icons.lock,
                    labelText: "Password",
                    textEditingController: passwordTextEditingController,
                  ),
                  const SizedBox(height: 35.0),
                  SizedBox(
                    height: 35.00,
                    width: 300.0,
                    child: ElevatedButton(
                      onPressed: () async {
                        loginController.changeLoginProgressStatus(true);
                        String username = usernameTextEditingController.text;
                        String password = passwordTextEditingController.text;

                        if (username.isEmpty || password.isEmpty) {
                          showSnackBar("Username or password can not be empty!",
                              context);
                        }
                        bool loginResult = await loginController.login(
                            usernameTextEditingController.text,
                            passwordTextEditingController.text);

                        if (!loginResult) {
                          showSnackBar("Wrong Credentials", context);
                        } else {
                          print("Good for you");
                        }

                        loginController.changeLoginProgressStatus(false);
                      },
                      child: const Text("LOGIN"),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
