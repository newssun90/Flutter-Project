import 'package:flutter/material.dart';

class CurrencyCard extends StatelessWidget {
  final String cardText, currencyText, currencyCode;
  final IconData icon;
  final int order;
  final bool isInvert;

  final Color _blackColor = const Color.fromRGBO(31, 33, 35, 1);
  final Color _whiteColor = const Color(0xFFFFFFFF);

  const CurrencyCard({
    super.key,
    required this.cardText,
    required this.icon,
    required this.currencyText,
    required this.currencyCode,
    required this.isInvert,
    required this.order,
  });

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(0, order * -32),
      child: Container(
          clipBehavior: Clip.hardEdge, // icon overflow hidden
          decoration: BoxDecoration(
            color: isInvert ? _whiteColor : _blackColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      cardText,
                      style: TextStyle(
                        color: isInvert ? _blackColor : _whiteColor,
                        fontSize: 28,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          currencyText,
                          style: TextStyle(
                            color: isInvert ? _blackColor : _whiteColor,
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Text(
                          currencyCode,
                          style: TextStyle(
                            color: isInvert
                                ? _blackColor.withOpacity(0.8)
                                : _whiteColor.withOpacity(0.8),
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Transform.scale(
                  scale: 2.2,
                  child: Transform.translate(
                    offset: const Offset(-5, 20),
                    child: Icon(
                      icon,
                      color: isInvert ? _blackColor : _whiteColor,
                      size: 98,
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
