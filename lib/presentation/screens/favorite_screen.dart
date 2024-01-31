import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prueba/presentation/providers/counter_provider.dart';
import 'package:prueba/presentation/providers/global_provider.dart';
import 'package:prueba/presentation/widgets/side_menu.dart';

class FavoriteScreen extends ConsumerWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final clickCounter = ref.watch(counterProvider);
    final scaffoldKey = GlobalKey<ScaffoldState>();
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Contando $clickCounter",
              style: Theme.of(context).textTheme.titleLarge,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(counterProvider.notifier).state++;
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
