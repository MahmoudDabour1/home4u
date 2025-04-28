import 'package:flutter/material.dart';

class UserFavoriteScreen extends StatelessWidget {
  const UserFavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Favorite'),
      ),
      body: Center(
        child: Text('User Favorite Screen'),
      ),
    );
  }
}
