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
    subtitle: "Agregar una nueva obra social", 
    icon: Icons.movie, 
    link: '/Admin'
  ),
  MenuItem(
    title: "Obtener Turno medico",
    subtitle: "Obtener Turno medico",
    icon: Icons.home, 
    link: "/sacarTurno"
  ),
   MenuItem(
    title: "Mis turnos",
    subtitle: "Mis turnos",
    icon: Icons.home, 
    link: "/misTurnosUser"
  ),
];