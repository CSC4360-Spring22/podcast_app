import 'dart:convert';
import 'package:podcast_app/models/podcast.dart';
import 'package:http/http.dart' as http;

class PodcastApi {
  static Future<List<Podcast>> getPodcast() async {
    var uri = Uri.https('listennotes.p.rapidapi.com', '/api/v1/search', {
      "q": "star wars",
      //Only change this field for query parameter for user search button
      "type": "episode",
      "genre_ids": "68,82",
      "language": "English",
      "safe_mode": "1",
      "sort_by_date": "0",
      "offset": "0",
      "only_in": "title",
      "len_max": "10",
      "len_min": "2",
      "published_after": "1390190241000",
      "published_before": "1490190241000"
    });

    final response = await http.get(uri, headers: {
      "x-rapidapi-key": '',
      "x-rapidapi-host": '',
      "useQueryString": "true"
    });

    Map data = jsonDecode(response.body);
    List _temp = [];

    for (var i in data['results']) {
      _temp.add(i);
    }

    return Podcast.podcastFromSnapshot(_temp);
  }
}
