class Song {
  final String id;
  final String title;
  final String artistId;
  final int likes;
  final Duration duration;
  final Uri imageUrl;

  Song({
    required this.id,
    required this.title,
    required this.artistId,
    required this.likes,
    required this.duration,
    required this.imageUrl,
  });

  @override
  String toString() {
    return 'Song(id: $id, title: $title, artist id: $artistId, duration: $duration, likes: $likes)';
  }

  Song copyWith({
    String? id,
    String? title,
    String? artistId,
    int? likes,
    Duration? duration,
    Uri? imageUrl,
  }) {
    return Song(
      id: id ?? this.id,
      title: title ?? this.title,
      artistId: artistId ?? this.artistId,
      likes: likes ?? this.likes,
      duration: duration ?? this.duration,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }
}
