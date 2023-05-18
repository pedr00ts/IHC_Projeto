import 'package:flutter/material.dart';
import 'package:evaccine/customprofilepage.dart';

class ProfileDetailsPage extends StatelessWidget {
  final CustomProfilePage page;

  ProfileDetailsPage(this.page);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(page.name),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(page.name),
      ),
    );
  }
}