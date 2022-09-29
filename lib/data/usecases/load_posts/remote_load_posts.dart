import 'package:social_media_front/domain/entities/post_entity.dart';
import 'package:meta/meta.dart';

import '../../../domain/helpers/helpers.dart';
import '../../../domain/usecases/usecases.dart';
import '../../http/http.dart';
import '../../models/models.dart';



class RemoteLoadPosts implements LoadPosts {
  RemoteLoadPosts({@required this.url, @required this.httpClient});


  final String url;
  final HttpClient httpClient;


  @override
  Future<List<PostEntity>> load() async {
    try {
      final httpResponse = await httpClient.request(url: url, method: 'get');

      return httpResponse
          .map<PostEntity>((json) => RemotePostModel.fromJson(json).toEntity())
          .toList();
    } on HttpError catch (error) {
      throw error == HttpError.forbidden
          ? DomainError.accessDenied
          : DomainError.unexpected;
    }
  }
}