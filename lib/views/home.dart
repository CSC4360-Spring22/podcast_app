import 'package:flutter/material.dart';
import 'package:podcast_app/models/podcast.api.dart';
import 'package:podcast_app/models/podcast.dart';
import 'package:podcast_app/views/widgets/podcast_card.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<Podcast> _podcast;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    getPodcast();
  }

  Future<void> getPodcast() async {
    _podcast = await PodcastApi.getPodcast();
    setState(() {
      _isLoading = false;
    });
    print(_podcast[0].podcastTitle);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.podcasts),
              SizedBox(width: 10),
              Text('Podcast')
            ],
          ),
        ),
        body: _isLoading
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: _podcast.length,
                itemBuilder: (context, index) {
                  return PodcastCard(
                    thumbnailUrl: _podcast[index].images,
                    pTitle: _podcast[index].podcastTitle,
                    eTitle: _podcast[index].episodeTitle,
                    eAudio: _podcast[index].episodeAudio,
                  );
                },
              ));
  }
}
