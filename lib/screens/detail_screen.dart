import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toonflix/models/webtoon_detail_model.dart';
import 'package:toonflix/models/webtoon_episode_model.dart';
import 'package:toonflix/services/api_service.dart';
import 'package:toonflix/widgets/webtoon_episode_widget.dart';

class DetailScreenWidget extends StatefulWidget {
  final String title, thumb, id;
  final bool isFavorite;

  const DetailScreenWidget({
    super.key,
    required this.title,
    required this.thumb,
    required this.id,
    required this.isFavorite,
  });

  @override
  State<DetailScreenWidget> createState() => _DetailScreenWidgetState();
}

class _DetailScreenWidgetState extends State<DetailScreenWidget> {
  late Future<WebtoonDetailModel> webtoon;
  late Future<List<WebtoonEpisodeModel>> episodes;
  late SharedPreferences preferences;
  bool isLiked = false;

  @override
  void initState() {
    // initState는 build 전에 호출된다. initState를 사용하기 위해 StatefulWidget을 사용함.
    super.initState();
    webtoon = ApiService.getToonById(widget.id);
    episodes = ApiService.getLatestEpisodesById(widget.id);
    initPrefs();
  }

  Future initPrefs() async {
    preferences = await SharedPreferences.getInstance();
    final likedToons = preferences.getStringList('likedToons');
    if (likedToons != null) {
      if (likedToons.contains(widget.id)) {
        setState(() {
          isLiked = true;
        });
      }
    } else {
      await preferences.setStringList('likedToons', []);
    }
  }

  onFavoritTap() async {
    final likedToons = preferences.getStringList('likedToons');
    if (likedToons != null) {
      if (isLiked) {
        likedToons.remove(widget.id);
      } else {
        likedToons.add(widget.id);
      }
      await preferences.setStringList('likedToons', likedToons);
    }
    setState(() {
      isLiked = !isLiked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: onFavoritTap,
              icon: isLiked
                  ? const Icon(Icons.favorite)
                  : const Icon(
                      Icons.favorite_outline_outlined,
                    )),
        ],
        title: Text(
          widget.title,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w500,
          ),
        ),
        foregroundColor: Colors.green,
        backgroundColor: Colors.white,
        elevation: 1,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(children: [
            const SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Hero(
                  // Hero
                  tag: widget.isFavorite ? 'favorite_${widget.id}' : widget.id,
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
                    child: Image.network(
                      widget.thumb,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            FutureBuilder(
                future: webtoon,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${snapshot.data!.genre} / ${snapshot.data!.age}',
                          style: const TextStyle(
                            fontSize: 15,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          snapshot.data!.about,
                          style: const TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      ],
                    );
                  }
                  return const Text('...');
                }),
            const SizedBox(
              height: 20,
            ),
            FutureBuilder(
              future: episodes,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Column(
                    children: [
                      for (var episode in snapshot.data!)
                        EpisodeWidget(episode: episode, webtoonId: widget.id)
                    ],
                  );
                }
                return Container();
              },
            ),
          ]),
        ),
      ),
    );
  }
}
