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
    title: "Admin panel", 
    subtitle: "agregar una nueva obra social", 
    icon: Icons.movie, 
    link: '/Admin'
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
  MenuItem(
    title: "Asociar obra social", 
    subtitle:  "Asociá tu obra social", 
    icon: Icons.youtube_searched_for_outlined, 
    link: "/asociarObraSocial"
  ),
  MenuItem(
    title: "Home",
    subtitle: "Home",
    icon: Icons.home, 
    link: "/home"
    ),
];