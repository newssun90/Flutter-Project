import 'package:flutter/material.dart';
import 'package:toonflix/widgets/button.dart';
import 'package:toonflix/widgets/currency_card.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    const fWhiteStyle = TextStyle(
        color: Colors.white, fontSize: 28, fontWeight: FontWeight.w600);
    return MaterialApp(
      home: Scaffold(
          backgroundColor: const Color.fromARGB(20, 151, 151, 151),
          body: SingleChildScrollView(
            // 세로 scroll 처리
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 80,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const Text(
                            'Hey, Selena',
                            style: fWhiteStyle,
                          ),
                          Text(
                            'Welcome back',
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.8),
                              fontSize: 18,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  Text(
                    'Total Balance',
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.8),
                      fontSize: 22,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    '\$5 194 482',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 44,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Button(
                        text: 'Transfer',
                        bgColor: const Color(0xFFF1B33B),
                        textColor: Colors.black.withOpacity(0.7),
                      ),
                      Button(
                        text: 'Request',
                        bgColor: const Color(0xFF1F2123),
                        textColor: Colors.white.withOpacity(0.7),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 80,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Text(
                        'Wallets',
                        style: TextStyle(
                          fontSize: 36,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'View All',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.8),
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const CurrencyCard(
                    cardText: 'Euro',
                    icon: Icons.euro_rounded,
                    currencyText: '6 428',
                    currencyCode: 'EUR',
                    isInvert: false,
                    order: 0,
                  ),
                  const CurrencyCard(
                    cardText: 'Dollar',
                    icon: Icons.monetization_on_outlined,
                    currencyText: '55 622',
                    currencyCode: 'USD',
                    isInvert: true,
                    order: 1,
                  ),
                  const CurrencyCard(
                    cardText: 'Bitcoin',
                    icon: Icons.currency_bitcoin,
                    currencyText: '9 785',
                    currencyCode: 'BTC',
                    isInvert: false,
                    order: 2,
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
