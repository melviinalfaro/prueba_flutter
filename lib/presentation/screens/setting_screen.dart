import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prueba/config/theme/provider/app_theme_provider.dart';
import 'package:prueba/presentation/providers/global_provider.dart';
import 'package:prueba/presentation/widgets/side_menu.dart';

class SettingScreen extends ConsumerWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scaffoldKey = GlobalKey<ScaffoldState>();
    final isDarkMode = ref.watch(isDarkModeProvider);
    final titleApp = ref.watch(titleAppProvider);

    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text(titleApp),
        leading: Builder(
          builder: (context) {
            return IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: const Icon(Icons.menu_outlined),
            );
          },
        ),
      ),
      drawer: SideMenu(scaffoldKey: scaffoldKey),
      body: ListView(
        children: [
          SwitchListTile(
            title: const Text("Modo oscuro"),
            subtitle: const Text("Activa el modo para usar de noche"),
            value: isDarkMode,
            onChanged: (value) {
              ref.read(isDarkModeProvider.notifier).update((state) => !state);
            },
          ),
        ],
      ),
    );
  }
}
