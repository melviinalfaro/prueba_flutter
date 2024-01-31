import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prueba/presentation/providers/global_provider.dart';
import 'package:prueba/presentation/widgets/side_menu.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scaffoldKey = GlobalKey<ScaffoldState>();
    final titleApp = ref.watch(titleAppProvider);

    List<int> imagesIds = [1, 2, 3, 4, 5];

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
      body: ListView.builder(
        itemCount: imagesIds.length,
        itemBuilder: (BuildContext context, int index) {
          return FadeInImage(
            fit: BoxFit.cover,
            width: double.infinity,
            height: 300,
            placeholder: const AssetImage("assets/images/jar-loading.gif"),
            image: NetworkImage(
                'https://picsum.photos/id/${imagesIds[index]}/500/300'),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
