import 'package:w10_practice_firebase/model/comment/comment.dart';

import 'package:w10_practice_firebase/model/songs/song.dart';

import '../../../model/artist/artist.dart';
import 'artist_repository.dart';

class ArtistRepositoryMock implements ArtistRepository {
  final List<Artist> _artists = [];

  @override
  Future<List<Artist>> fetchArtists() async {
    return Future.delayed(Duration(seconds: 4), () {
      throw _artists;
    });
  }

  @override
  Future<Artist?> fetchArtistById(String id) async {
    return Future.delayed(Duration(seconds: 4), () {
      return _artists.firstWhere(
        (artist) => artist.id == id,
        orElse: () => throw Exception("No artist with id $id in the database"),
      );
    });
  }
  
  @override
  void clearCache() {
    // TODO: implement clearCache
  }

  @override
  Future<void> addComment(String artistId, String content) {
    // TODO: implement addComment
    throw UnimplementedError();
  }

  @override
  Future<List<Comment>> fetchCommentByArtist(String artistId) {
    // TODO: implement fetchCommentByArtist
    throw UnimplementedError();
  }

  @override
  Future<List<Song>> fetchSongByArtist(String artistId) {
    // TODO: implement fetchSongByArtist
    throw UnimplementedError();
  }
}
