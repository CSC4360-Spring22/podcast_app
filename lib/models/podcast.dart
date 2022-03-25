class Podcast {
  final String images;
  final String podcastTitle;
  final String episodeTitle;
  final String episodeAudio;

  Podcast({
    required this.images,
    required this.podcastTitle,
    required this.episodeTitle,
    required this.episodeAudio,
  });

  factory Podcast.fromJson(dynamic json) {
    return Podcast(
      images: json['image'] as String,
      podcastTitle: json['podcast_title_original'] as String,
      episodeTitle: json['title_original'] as String,
      episodeAudio: json['audio'] as String,
    );
  }

  static List<Podcast> podcastFromSnapshot(List snapshot) {
    return snapshot.map((data) {
      return Podcast.fromJson(data);
    }).toList();
  }

  @override
  String toString() {
    return 'Podcast {image: $images, podcast_title_original: $podcastTitle, title_original: $episodeTitle, audio: $episodeAudio}';
  }
}
