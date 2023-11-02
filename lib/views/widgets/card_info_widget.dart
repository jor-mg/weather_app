import 'package:flutter/material.dart';

class CardInfoWidget extends StatelessWidget {
  final String title;
  final String value;
  final String pathIcon;
  final bool isVertical;

  const CardInfoWidget({
    super.key,
    required this.title,
    required this.value,
    required this.pathIcon,
    this.isVertical = true,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final sWidth = size.width;
    //final sHeight = size.height;

    return Container(
      width: sWidth * 0.4,
      //height: sHeight * 0.10,

      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(isVertical ? 20 : 10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: isVertical
                ? const Color.fromARGB(31, 194, 194, 194)
                : const Color.fromARGB(31, 175, 175, 175),
            blurRadius: 10,
          ),
        ],
      ),
      alignment: Alignment.center,
      child: isVertical
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(pathIcon, width: 40),
                const SizedBox(height: 5),
                Text(title),
                Text(value),
              ],
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(pathIcon, width: 40),
                const SizedBox(width: 5),
                Column(
                  children: [
                    Text(title),
                    Text(
                      value,
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.blue,
                      ),
                    ),
                  ],
                )
              ],
            ),
    );
  }
}
