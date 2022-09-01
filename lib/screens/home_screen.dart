import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //llamamos al servicio de autenticacion

    //llamamos el servicio de autenticacion de google AuthenticatorGoogle

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        //bton de cerrar sesion
        actions: [
          IconButton(
              icon: const Icon(Icons.exit_to_app),
              onPressed: () {
                Navigator.pushReplacementNamed(context, 'login');
              }),
        ],
      ),
      body: Center(
        child: Column(
          children: const [
            SizedBox(height: 50),
            //llamar el metodo de getUser
            Text(
              'hola bienvenido ',
              style: TextStyle(fontSize: 25, color: Colors.indigo),
            )
          ],
        ),
      ),
    );
  }
}
