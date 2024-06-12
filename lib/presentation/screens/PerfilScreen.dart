import 'package:autoguard/core/User/UserRepository.dart';
import 'package:flutter/material.dart';

class PerfilScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body:FutureBuilder(
        future: getActiveUser(),
        builder:(context, snapshot) {
          if (snapshot.hasData) {
            final user = snapshot.data;
            return Column(
        children: [
          Container(
            width: double.infinity,
            height: 200,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage('assets/profile_image.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 20),
          Text(
            user!.nombre ?? "Sin nombre",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Text(
            user.email ?? "Sin email",
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Birth Date: January 1, 1990',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
        ],
      );
          } else {
            return Center(child: CircularProgressIndicator()) ;
          }
        },
        ) 
      
      
    );
  }
}