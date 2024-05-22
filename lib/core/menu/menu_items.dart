import 'package:flutter/material.dart';

class MenuItem {
  final String title;
  final String subtitle;
  final IconData icon;
  final String link;

  const MenuItem({required this.title, required this.subtitle, required this.icon, required this.link});
}

const List<MenuItem> menuItems = [
  MenuItem(
    title: "agregarObraSocial", 
    subtitle: "agregar una nueva obra social", 
    icon: Icons.movie, 
    link: '/agregarObraSocial'
  ),
  MenuItem(
    title: "Register", 
    subtitle: "Registrar nuevo usuario", 
    icon: Icons.movie, 
    link: '/register'
  ),
    MenuItem(
    title: "Login", 
    subtitle: "Iniciar sesion", 
    icon: Icons.movie, 
    link: '/login'
  ),
  MenuItem(
    title: "Consultar especialista", 
    subtitle: "Ya tu sabes", 
    icon: Icons.movie, 
    link: '/especialista'
  ),

];