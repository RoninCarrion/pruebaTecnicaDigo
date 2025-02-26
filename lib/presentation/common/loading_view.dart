import 'package:flutter/material.dart';

class LoadingView extends StatelessWidget {
  const LoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ListView(
      children: List.filled(12, customListTileItem(size)),
    );
  }

  Widget customListTileItem(Size size) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.grey.shade300,
      ),
      title: Container(
        height: size.height * 0.04,
        width: size.width * 0.7,
        decoration: BoxDecoration(color: Colors.grey.shade300),
      ),
      subtitle: Container(
          height: size.height * 0.02,
          width: size.width * 0.7,
          decoration: BoxDecoration(color: Colors.grey.shade300)),
    );
  }
}