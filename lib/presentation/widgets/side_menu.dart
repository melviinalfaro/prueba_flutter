import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:prueba/presentation/menu/side_menu.dart';
import 'package:prueba/presentation/providers/side_menu_provider.dart';

class SideMenu extends ConsumerWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const SideMenu({
    super.key,
    required this.scaffoldKey,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hasNotch = MediaQuery.of(context).viewPadding.top > 35;
    final drawerSelectedIndex = ref.watch(sideMenuProvider);

    return NavigationDrawer(
      selectedIndex: drawerSelectedIndex,
      onDestinationSelected: (value) {
        ref.read(sideMenuProvider.notifier).update((state) => value);

        final menuItem = sideMenu[value];
        context.push(menuItem.link);
        scaffoldKey.currentState?.closeDrawer();
      },
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(30, hasNotch ? 0 : 20, 20, 20),
          child: const Text("Menu"),
        ),
        ...sideMenu.sublist(0, 2).map(
              (item) => NavigationDrawerDestination(
                selectedIcon: Icon(item.selectedIcon),
                icon: Icon(item.icon),
                label: Text(item.label),
              ),
            ),
        const Padding(
          padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
          child: Divider(),
        ),
        const Padding(
          padding: EdgeInsets.fromLTRB(30, 0, 20, 10),
          child: Text("Administracion"),
        ),
        ...sideMenu.sublist(2).map(
              (item) => NavigationDrawerDestination(
                selectedIcon: Icon(item.selectedIcon),
                icon: Icon(item.icon),
                label: Text(item.label),
              ),
            ),
      ],
    );
  }
}
