// ignore_for_file: sort_child_properties_last, non_constant_identifier_names

import 'package:flutter/material.dart';

class AuthBackground extends StatelessWidget {
  final Widget child;

  const AuthBackground({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Stack(children: [
        _FondoBox(),
        //contenedor para poner el widget del icono de login
        const _HeaderIcon(),
        //agregarmos el contenerdor del child
        child,
      ]),
    );
  }
}

class _HeaderIcon extends StatelessWidget {
  const _HeaderIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: double.infinity,
        height: 200,
        margin: const EdgeInsets.only(top: 50),
        child: const Icon(
          Icons.person_pin,
          size: 100,
          color: Colors.white,
        ),
      ),
    );
  }
}


class _FondoBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height * 0.4,
      //vamos agregarle un gradiente
      decoration: _FondoBackground(),
      child: Stack(children: const [
        Positioned(
          child: _Circle(),
          top: 90,
          left: 30,
        ),
        Positioned(
          child: _Circle(),
          top: -40,
          left: -30,
        ),
        Positioned(
          child: _Circle(),
          top: -50,
          right: -20,
        ),
        Positioned(
          child: _Circle(),
          bottom: -50,
          left: 10,
        ),
        Positioned(
          child: _Circle(),
          bottom: 120,
          right: 20,
        ),
      ]),
    );
  }

  BoxDecoration _FondoBackground() => const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromRGBO(63, 63, 156, 1),
            Color.fromRGBO(90, 70, 178, 1),
          ],
        ),
      );
}

//widget para los cirulos
class _Circle extends StatelessWidget {
  const _Circle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: const Color.fromRGBO(255, 255, 255, 0.05),
      ),
    );
  }
}
