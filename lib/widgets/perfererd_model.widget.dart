import 'package:flutter/material.dart';

class PerfererdModelwidget extends StatelessWidget {
  const PerfererdModelwidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        itemCount: 6,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          var images = [
            "All",
            "assets/icons/vw-logo-3311.png",
            "assets/icons/5ec40989195c530004f93f05.png",
            "assets/icons/NicePng_toyota-logo-png-transparent_3770207.png",
            "assets/icons/vw-logo-3311.png",
            "assets/icons/vw-logo-3311.png",
          ];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Container(
              padding: const EdgeInsets.all(10.0),
              height: 65,
              width: 65,
              child: Center(
                child: index != 0
                    ? Image.asset(images[index])
                    : const Text(
                        'All',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
              ),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade200,
                    offset: const Offset(4.0, 4.0),
                    blurRadius: 5,
                    spreadRadius: 1.0,
                  ),
                  BoxShadow(
                    color: Colors.grey.shade200,
                    offset: const Offset(-4.0, -4.0),
                    blurRadius: 5,
                    spreadRadius: 1.0,
                  ),
                ],
                color: index != 0 ? Colors.white : const Color(0xff5A6EFD),
                shape: BoxShape.circle,
              ),
            ),
          );
        },
      ),
    );
  }
}
