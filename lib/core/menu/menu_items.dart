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

];