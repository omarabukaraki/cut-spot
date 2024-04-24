import 'package:flutter/material.dart';

class BackGroundLRPage extends StatelessWidget {
  const BackGroundLRPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Stack(
        alignment: const Alignment(0, 1),
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 1.5,
                decoration: const BoxDecoration(boxShadow: []),
                child: Image.asset(
                  'assets/images/barberimage.png',
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment(0, -1),
                    end: Alignment(0, 1),
                    colors: [
                  Colors.white24,
                  Colors.white24,
                  Colors.white54,
                  Colors.white70,
                  Colors.white,
                  Colors.white,
                  Colors.white,
                ])),
          ),
        ],
      ),
    );
  }
}
