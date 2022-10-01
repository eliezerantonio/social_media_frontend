import 'package:faker/faker.dart';
import 'package:mockito/mockito.dart';
import 'package:social_media_front/data/http/http.dart';
import 'package:social_media_front/domain/usecases/save_comment.dart';
import 'package:test/test.dart';
import 'package:meta/meta.dart';

class HttpClientSpy extends Mock implements HttpClient {}

class RemoteSaveComment implements SaveComment {
  RemoteSaveComment({@required this.httpClient, @required this.url});

  HttpClient httpClient;
  String url;

  @override
  Future<void> save(String postId) async {
    await httpClient
        .request(url: url, method: 'post', body: {'postId': postId});
  }
}

void main() {
  RemoteSaveComment sut;
  HttpClientSpy httpClient;
  String url;
  String postId;

  setUp(() {
    httpClient = HttpClientSpy();
    postId = faker.guid.guid();
    url = faker.internet.httpUrl();
    sut = RemoteSaveComment(httpClient: httpClient, url: url);
  });

  test(' Should call HttpClient with correct values', () async {
    await sut.save(postId);

    verify(httpClient.request(url: url, method: 'post', body: {'postId': postId}));
  });
}
