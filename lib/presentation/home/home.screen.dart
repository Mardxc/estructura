import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Folios de chequeo de precios'),
        ),
        drawer: const Drawer(),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.separated(
            separatorBuilder: (context, index) => const Divider(),
            itemCount: 50,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: () => context.push('/products-capture'),
                child: const ListTile(
                  tileColor: Colors.white,
                  title: Text('308995 Walmart Cumbres'),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('45 artículos'),
                      Text('2 categorías'),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
