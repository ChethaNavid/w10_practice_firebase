import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../model/songs/song.dart';
import '../../dtos/song_dto.dart';
import 'song_repository.dart';

class SongRepositoryFirebase extends SongRepository {
  final Uri songsUri = Uri.https(
    'w9-database-f4f07-default-rtdb.asia-southeast1.firebasedatabase.app',
    '/songs.json',
  );

  List<Song>? _cachedSongs;

  @override
  Future<List<Song>> fetchSongs() async {
    if(_cachedSongs != null) {
      return _cachedSongs!;
    }

    final http.Response response = await http.get(songsUri);

    if (response.statusCode == 200) {
      final dynamic decodedBody = json.decode(response.body);

      // Handle null response (no songs exist yet)
      if (decodedBody == null) {
        return [];
      }

      final Map<String, dynamic> songsJson = decodedBody as Map<String, dynamic>;

      List<Song> result = [];
      for (final entry in songsJson.entries) {
        result.add(SongDto.fromJson(entry.key, entry.value));
      }
      _cachedSongs = result;
      return result;
    } else {
      throw Exception('Failed to load songs');
    }
  }

  @override
  void clearCache() {
    _cachedSongs = null;
  }

  @override
  Future<Song?> fetchSongById(String id) async {}

  @override
  Future<void> likeSong(String id, int currentLieks) async {
    final Uri url = Uri.https(
      'w9-database-f4f07-default-rtdb.asia-southeast1.firebasedatabase.app',
      '/songs/$id.json'
    );

    final http.Response response = await http.patch(
      url,
      body: json.encode({'likes': currentLieks + 1})
    );

    if (response.statusCode >= 400) {
      throw Exception('Failed to load posts');
    }
  }
}
