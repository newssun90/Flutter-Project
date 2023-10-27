import 'package:flutter/material.dart';

class DetailScreenWidget extends StatelessWidget {
  final String title, thumb, id;

  const DetailScreenWidget({
    super.key,
    required this.title,
    required this.thumb,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w500,
          ),
        ),
        foregroundColor: Colors.green,
        backgroundColor: Colors.white,
        elevation: 1,
      ),
      body: Column(children: [
        const SizedBox(
          height: 50,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Hero(
              // Hero
              tag: id,
              child: Container(
                width: 280,
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
          ],
        ),
      ]),
    );
  }
}
