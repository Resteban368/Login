import 'package:flutter/material.dart';
//importar paquete diseños
import 'package:formulario_login/ui/input_decorations.dart';
//importar el servicio de notificaciones y widgets de autenticacion
import 'package:formulario_login/widgets/widgets.dart';
//importar paquete de providers
import 'package:provider/provider.dart';
import '../providers/login_form_provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AuthBackground(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 270),
            CardContainer(
                child: Column(
              children: [
                const SizedBox(height: 10),
                Text(
                  'Login',
                  style: Theme.of(context).textTheme.headline4,
                ),
                const SizedBox(height: 30),
                ChangeNotifierProvider(
                  create: (_) => LoginFormProvider(),
                  child: const _LoginForm(),
                ),
              ],
            )),
            const SizedBox(height: 30),
            TextButton(
              onPressed: () => Navigator.pushNamed(context, 'register'),
              style: ButtonStyle(
                overlayColor:
                    MaterialStateProperty.all(Colors.indigo.withOpacity(0.5)),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10))),
              ),
              child: const Text(
                'Create a new account',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87),
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    ));
  }
}

class _LoginForm extends StatelessWidget {
  const _LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formProvider = Provider.of<LoginFormProvider>(context);

    return Form(
        key: formProvider.formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
            TextFormField(
              autocorrect: false,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecorations.authInputDecoration(
                  hintText: 'jhon.doe@gmail.com',
                  labelText: 'Email',
                  prefixIcon: Icons.email),
              onChanged: (value) => formProvider.email = value,

              //validacon para el campo email
              validator: (value) {
                String pattern =
                    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                // ignore: unnecessary_new
                RegExp regExp = new RegExp(pattern);
                return regExp.hasMatch(value ?? '') ? null : 'Invalid email';
              },
            ),
            const SizedBox(height: 30),
            TextFormField(
              autocorrect: false,
              obscureText: true,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecorations.authInputDecoration(
                  hintText: '********',
                  labelText: 'Password',
                  prefixIcon: Icons.lock),
              onChanged: (value) => formProvider.password = value,
              validator: (value) {
                if (value != null && value.length >= 6) return null;
                return 'Invalid password minimum 6 characters';
              },
            ),
            const SizedBox(height: 30),
            MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                disabledColor: Colors.grey,
                elevation: 0,
                color: Colors.deepPurple,
                // ignore: sort_child_properties_last
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                  child: Text(formProvider.isloading ? 'Loading...' : 'Login',
                      style: const TextStyle(color: Colors.white)),
                ),
                onPressed: formProvider.isloading
                    ? null
                    : () async {
                        //quitar al hacer clik el teclado
                        FocusScope.of(context).unfocus();

                        //validar el formulario
                        if (!formProvider.isValidForm()) return;
                        formProvider.isloading = true;
                        //todo: validar si el login es correcto

                        Navigator.pushNamed(context, 'home');
                        //vamos a esperar un tiempo
                        // Future.delayed(const Duration(seconds: 2), () {a
                      }),
          ],
        ));
  }
}
