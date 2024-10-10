import 'package:dataprice/domain/model/request/login.request.model.dart';
import 'package:dataprice/presentation/auth/auth.provider.dart';
import 'package:dataprice/presentation/shared/Utils/validators.dart';
import 'package:dataprice/presentation/shared/custom.loading.dialog.dart';
import 'package:dataprice/presentation/shared/theme.user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class AuthScreen extends ConsumerWidget {
  AuthScreen({super.key});

  final formKey = GlobalKey<FormState>();
  final usuarioController = TextEditingController(text: 'a@a.com');
  final passController = TextEditingController();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Form(
            key: formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              children: [
                SizedBox(
                  height: size.height * 0.25,
                  width: double.infinity,
                  child: const Placeholder(),
                ),
                const SizedBox(height: 10.0),
                Text(
                  'Inicio de sesión',
                  textAlign: TextAlign.center,
                  style: textTheme.titleLarge!.copyWith(),
                ),
                const SizedBox(height: 10.0),
                SizedBox(
                  width: size.width * 0.9,
                  child: TextFormField(
                    controller: usuarioController,
                    validator: (value) =>
                        Validators.validarEmail(value.toString()),
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(),
                      ),
                      filled: true,
                      label: const Text('Correo electrónico'),
                      fillColor: Colors.white70,
                    ),
                  ),
                ),
                const SizedBox(height: 15.0),
                SizedBox(
                  width: size.width * 0.9,
                  child: TextFormField(
                    controller: passController,
                    validator: (value) => Validators.validarPassword(value),
                    keyboardType: TextInputType.text,
                    obscureText: ref.watch(showPasswordProvider),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(),
                      ),
                      suffixIcon: InkWell(
                        onTap: () {
                          ref
                              .read(showPasswordProvider.notifier)
                              .obscurePassword(
                                  !ref.watch(showPasswordProvider));
                        },
                        child: Icon(
                          ref.watch(showPasswordProvider)
                              ? Icons.visibility
                              : Icons.visibility_off,
                          size: 20.0,
                        ),
                      ),
                      filled: true,
                      label: const Text('Contraseña'),
                      fillColor: Colors.white70,
                    ),
                  ),
                ),
                const SizedBox(height: 15.0),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ThemeColors.primaryColor,
                    minimumSize:
                        Size(MediaQuery.of(context).size.width * 0.9, 50),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                  ),
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      showDialog(
                          context: context,
                          builder: (_) => const CustomLoadingDialog());
                      final obj = LoginRequestModel(
                          email: usuarioController.text,
                          password: passController.text);
                      final result =
                          await ref.read(authProvider.notifier).login(obj);

                      if (!context.mounted) {
                        return;
                      }
                      if (result) {
                        context.go('/home');
                      }
                    }
                    /*if (formKey.currentState!.validate()) {
                      showDialog(
                          context: context,
                          builder: (_) => const CustomLoadingDialog());
                      final obj = LoginRequestModel(
                          email: usuarioController.text,
                          password: passController.text);
                      final result = ref.watch(loginProvider(obj));

                      if (!context.mounted) {
                        return;
                      }

                      result.when(
                        data: (data) {
                          if (data) {
                            context.go('/home');
                          }
                        },
                        error: (_, __) => null,
                        loading: () => CircularProgressIndicator(),
                      );
                    }*/
                  },
                  child: const Text(
                    'Inicia sesión',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Arial',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
