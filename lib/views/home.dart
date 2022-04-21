import 'package:flutter/material.dart';
import 'package:podcast_app/models/podcast.api.dart';
import 'package:podcast_app/models/podcast.dart';
import 'package:podcast_app/views/widgets/podcast_card.dart';

import '../screens/favorites.dart';
import '../screens/homeScreen.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<Podcast> _podcast;
  bool _isLoading = true;
  int index = 0;
  final screens = [
    HomePage2(),
    favorite(),
    Center(child: Text('play', style: TextStyle(fontSize: 30)))
  ];

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
      body: screens[index],
      bottomNavigationBar: NavigationBarTheme(
          data: NavigationBarThemeData(
            indicatorColor: Color.fromARGB(255, 57, 221, 213),
            labelTextStyle: MaterialStateProperty.all(
              TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
          ),
          child: NavigationBar(
            backgroundColor: Color.fromARGB(255, 98, 120, 125),
            selectedIndex: index,
            onDestinationSelected: (index) =>
                setState(() => this.index = index),
            destinations: [
              NavigationDestination(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              NavigationDestination(
                icon: Icon(Icons.favorite),
                label: 'Favorites',
              ),
              NavigationDestination(
                icon: Icon(Icons.person),
                label: 'User',
              ),
            ],
          )),
    );
  }
}
