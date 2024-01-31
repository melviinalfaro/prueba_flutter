import 'package:flutter/material.dart';

class SideMenu {
  final String label;
  final String link;
  final IconData icon;
  final IconData selectedIcon;

  const SideMenu({
    required this.label,
    required this.link,
    required this.icon,
    required this.selectedIcon,
  });
}

const sideMenu = <SideMenu>[
  SideMenu(
    label: "Inicio",
    link: "/",
    icon: Icons.home_outlined,
    selectedIcon: Icons.home_rounded,
  ),
  SideMenu(
    label: "Favoritos",
    link: "/favoritos",
    icon: Icons.favorite_outline,
    selectedIcon: Icons.favorite_rounded,
  ),
  SideMenu(
    label: "Ajustes",
    link: "/ajustes",
    icon: Icons.settings_outlined,
    selectedIcon: Icons.settings_rounded,
  ),
];
