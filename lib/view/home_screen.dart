import 'package:cosume_api/controller/user_controller.dart';
import 'package:flutter/material.dart';

import '../model/user.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: UserController().getUser(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            return ListView.separated(
              separatorBuilder: (_, index) {
                return const SizedBox(height: 10);
              },
              itemBuilder: (_, index) {
                User user = snapshot.data![index];
                return Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        title: Text(user.name!),
                        subtitle: Text(user.email!),
                      ),
                      Text(
                        user.address!.street!,
                        textAlign: TextAlign.left,
                      )
                    ],
                  ),
                );
              },
              itemCount: snapshot.data!.length,
            );
          }),
    );
  }
}
