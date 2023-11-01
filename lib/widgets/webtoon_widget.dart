import 'package:flutter/material.dart';
import 'package:toonflix/screens/detail_screen.dart';

class WebtoonWidget extends StatelessWidget {
  final String title, thumb, id;
  final bool likeToon;
  final Function callFunc;

  const WebtoonWidget({
    super.key,
    required this.title,
    required this.thumb,
    required this.id,
    required this.likeToon,
    required this.callFunc,
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
                isFavorite: likeToon,
              ),
              //fullscreenDialog: true,
            )).then((value) => callFunc());
      },
      child: Column(
        children: [
          Hero(
            // Hero
            tag: likeToon ? 'favorite_$id' : id,
            child: Container(
              width: 150,
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
              child: Stack(children: [
                Image.network(
                  thumb,
                ),
                likeToon
                    ? const Positioned(
                        top: 5,
                        right: 5,
                        child: Icon(
                          Icons.favorite,
                          color: Colors.green,
                        ),
                      )
                    : Container(),
              ]),
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
