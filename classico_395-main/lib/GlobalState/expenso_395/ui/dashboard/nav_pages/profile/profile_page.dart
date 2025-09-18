import 'package:flutter/material.dart';

import '../../../../utils/app_routes.dart';



class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              // Row with logo
              Row(
                children: [
                  Image.asset(
                    "assets/app_image/logo.png",
                    height: 50,
                    width: 50,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(width: 8), // optional spacing
                  const Text(
                    "Profile",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontFamily: "Bold",
                      fontWeight: FontWeight.w900,
                      letterSpacing: 1.2,
                    ),
                  ),
                  const Spacer(),
                  InkWell(
                      onTap: () {
                        String nextPageName = AppRoutes.login;
                        Navigator.pushReplacementNamed(context, nextPageName);
                      }, child: const Icon(Icons.logout, size: 35)),
                ],
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
