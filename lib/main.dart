import 'package:flutter/material.dart';
import 'package:toonflix/widgets/button.dart';
import 'package:toonflix/widgets/currency_card.dart';

void main() {
  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});


  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  bool toggleText = true;

  @override
  Widget build(BuildContext context) {
    const fWhiteStyle = TextStyle(
        color: Colors.white, fontSize: 28, fontWeight: FontWeight.w600);

    void toggle(){
      setState(() {
        print(toggleText);
        toggleText = !toggleText;
        print(toggleText);
      });
    }

    return MaterialApp(
      //Theme
      theme: ThemeData(
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            color: Colors.amber,
            fontSize: 30,
          )
        ),
      ),
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
                  // 생명주기 sample
                  Row(
                    children: [
                      Column(
                        children: [
                          toggleText ? const MyNewWidget() : const Text('Nothing!', style: TextStyle(color: Colors.white,)),
                          IconButton(onPressed: toggle, icon: const Icon(Icons.remove_red_eye),color: Colors.white,),
                        ],
                      ),
                    ],
                  ),
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

class MyNewWidget extends StatefulWidget {
  const MyNewWidget({
    super.key,
  });

  @override
  State<MyNewWidget> createState() => _MyNewWidgetState();
}

class _MyNewWidgetState extends State<MyNewWidget> {
  @override
  void initState() {
    // 최초 initializing
    super.initState();
    print('1 - initState!');
  }

  @override
  void dispose() {
    // 이벤트 리스터 해제
    super.dispose();
    print('dispose!');
  }

  @override
  Widget build(BuildContext context) {
    print('2 - build!');
    return Text('BuildContext Example!', style: Theme.of(context).textTheme.titleLarge,);
  }
}
