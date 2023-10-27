import 'package:flutter/material.dart';
import 'package:toonflix/screens/detail_screen.dart';

class WebtoonWidget extends StatelessWidget {
  final String title, thumb, id;

  const WebtoonWidget({
    super.key,
    required this.title,
    required this.thumb,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // GestureDetector
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailScreenWidget(
                title: title,
                thumb: thumb,
                id: id,
              ),
              //fullscreenDialog: true,
            ));
      },
      child: Column(
        children: [
          Hero(
            // Hero
            tag: id,
            child: Container(
              width: 180,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 5,
                      offset: const Offset(5, 3),
                      color: Colors.black.withOpacity(0.5),
                    )
                  ]),
              child: Image.network(
                thumb,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}
