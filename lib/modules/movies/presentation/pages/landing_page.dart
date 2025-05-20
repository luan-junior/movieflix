import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../components/button/primary_button.dart';
import '../../../../components/button/secondary_button.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Material(
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Positioned.fill(
            child: Image.asset(
              "assets/images/the_last_jedi.jpg",
              fit: BoxFit.cover,
            ),
          ),
          Container(
            height: size.height * .33,
            width: size.width,
            padding: const EdgeInsets.symmetric(vertical: 29, horizontal: 19),
            decoration: BoxDecoration(
              color: Colors.black.withValues(alpha: .9),

              /// With Opacity .9
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "Watch movies anytime anywhere",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                const Text(
                  "Explore a vast collection of blockbuster movies, timeless classics, and the latest releases.",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13),
                ),
                PrimaryButton(
                  onPressed: () => context.push('/signin'),
                  text: "Login",
                ),
                SecondaryButton(
                  onPressed: () => context.push('/signup'),
                  text: "Sign Up",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
