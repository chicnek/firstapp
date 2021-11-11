import 'package:firstapp/widgets/widgets.dart';
import 'package:firstapp/pages/samples/samples.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBarLayout(
      titie: "Home",
      child: ListView(
        children: [
          ListTileRoute(
            title: "Form samples",
            page: FormPage(),
          ),
        ],
      ),
    );
  }
}
