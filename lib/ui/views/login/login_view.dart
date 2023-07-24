import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'login_view.form.dart';
import 'login_viewmodel.dart';
import 'package:my_first_app/ui/common/ui_helpers.dart';

@FormView(fields: [
  FormTextField(name: 'email'),
  FormTextField(name: 'password'),
])
class LoginView extends StackedView<LoginViewModel> with $LoginView {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    LoginViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Image.network(
              'https://i.pinimg.com/originals/37/b5/75/37b57509ff47f603e522df4fcb5c3b48.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Card(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 20,
                      bottom: 15,
                      right: 12,
                      left: 12,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextFieldApp(
                          label: 'Email',
                          controller: emailController,
                        ),
                        verticalSpaceSmall,
                        TextFieldApp(
                          label: 'Password',
                          controller: passwordController,
                          obscureText: true,
                        ),
                        Container(
                          padding: const EdgeInsets.only(top: 20),
                          width: MediaQuery.of(context).size.width,
                          child: ElevatedButton(
                            onPressed: () => {viewModel.login()},
                            child: const Text('Login'),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void onViewModelReady(LoginViewModel viewModel) {
    syncFormWithViewModel(viewModel);
  }

  @override
  LoginViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      LoginViewModel();
}

class TextFieldApp extends StatelessWidget {
  const TextFieldApp({
    super.key,
    required this.label,
    required this.controller,
    this.obscureText = false,
  });

  final String label;
  final TextEditingController controller;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Informe o $label corretamente';
        }
        return null;
      },
    );
  }
}
