import 'package:ecommerce_app/widgets/user_widgets.dart';
import 'package:flutter/material.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("All Users"),
      ),
      body: ListView.builder(
          itemCount: 6,
          itemBuilder: (context, index) {
            return const UserWidgets();
          }),
    );
  }
}
