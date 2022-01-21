import 'package:flutter/material.dart';
import 'package:friendly_fire_web_app/src/routes/route_path.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Title(
      color: Colors.black,
      title: "Home",
      child: Scaffold(
        appBar: AppBar(),
        body: Center(
          child: ElevatedButton(
              onPressed: () {
                Router.of(context)
                    .routerDelegate
                    .setInitialRoutePath(ItemListPath());
              },
              child: const Text("Go to Items")),
        ),
      ),
    );
  }
}
