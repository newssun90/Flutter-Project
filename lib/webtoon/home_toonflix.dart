import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toonflix/models/webtoon_model.dart';
import 'package:toonflix/services/api_service.dart';
import 'package:toonflix/widgets/webtoon_widget.dart';

class ToonFlixWidget extends StatefulWidget {
  const ToonFlixWidget({super.key});

  @override
  State<ToonFlixWidget> createState() => _ToonFlixWidgetState();
}

class _ToonFlixWidgetState extends State<ToonFlixWidget> {
  final Future<List<WebtoonModel>> webtoons = ApiService.getTodaysToons();
  late SharedPreferences preferences;
  late List<String> likedToonId;
  List<WebtoonModel> likedToonInfo = [];

  bool isFavorit = false;

  @override
  void initState() {
    super.initState();
    initPrefs();
  }

  Future initPrefs() async {
    preferences = await SharedPreferences.getInstance();
    var likedToons = preferences.getStringList('likedToons');
    if (likedToons != null) {
      setState(() {});
      likedToonId = likedToons;
    } else {
      likedToons = [];
    }
  }

  void testfunc() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "오늘의 웹툰",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w500,
          ),
        ),
        foregroundColor: Colors.green,
        backgroundColor: Colors.white,
        elevation: 1,
      ),
      body: FutureBuilder(
        // FutureBuilder
        future: webtoons,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  flex: 1,
                  child: makeList(snapshot, false),
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '즐겨찾는 웹툰',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
                FutureBuilder(
                  future: webtoons,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      likedToonInfo = [];
                      for (var webtoonData in snapshot.data!) {
                        //webtoonData.id
                        if (likedToonId.contains(webtoonData.id)) {
                          likedToonInfo.add(webtoonData);
                        }
                      }
                    }

                    if (likedToonInfo.isEmpty) {
                      return Expanded(
                        flex: 1,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '즐겨찾는 웹툰이 없습니다.',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.amber.shade800,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      );
                    } else {
                      return Expanded(
                        flex: 1,
                        child: makeList(
                            AsyncSnapshot.withData(
                                ConnectionState.done, likedToonInfo),
                            true),
                      );
                    }
                  },
                ),
              ],
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  ListView makeList(AsyncSnapshot<List<WebtoonModel>> snapshot, isLikeToon) {
    return ListView.separated(
      // ListView.builder OR ListView.separated
      scrollDirection: Axis.horizontal,
      itemCount: snapshot.data!.length,
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 20,
      ),
      itemBuilder: (context, index) {
        var webtoon = snapshot.data![index];
        return WebtoonWidget(
          title: webtoon.title,
          thumb: webtoon.thumb,
          id: webtoon.id,
          likeToon: isLikeToon,
          callFunc: initPrefs,
        );
      },
      separatorBuilder: (context, index) => const SizedBox(
        width: 40,
      ),
    );
  }
}
