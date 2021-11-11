import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListTileRoute extends StatelessWidget {
  final String title;
  final Widget page;

  const ListTileRoute({
    Key? key,
    required this.title,
    required this.page,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      onTap: () {
        Get.to(page);
      },
    );
  }
}
