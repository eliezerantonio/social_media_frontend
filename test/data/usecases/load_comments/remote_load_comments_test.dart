import 'package:faker/faker.dart';
import 'package:mockito/mockito.dart';
import 'package:social_media_front/data/http/http.dart';
import 'package:social_media_front/data/usecases/load_comments/remote_load_comments.dart';
import 'package:social_media_front/domain/entities/entities.dart';
import 'package:social_media_front/domain/helpers/helpers.dart';

import 'package:test/test.dart';


class HttpClientSpy extends Mock implements HttpClient {}

void main() {
  String url;
  List<Map> list;
  RemoteLoadComments sut;
  RemoteLoadCommentsParams params;

  HttpClientSpy httpClient;
  List<Map> mockValidData() => [
        {
          'id': faker.guid.guid(),
          'description': faker.randomGenerator.string(50),
          'postId': faker.guid.guid(),
         
          'userId': faker.guid.guid(),
        },
        {
          'id': faker.guid.guid(),
          'description': faker.randomGenerator.string(50),
          'postId': faker.guid.guid(),
         
          'userId': faker.guid.guid(),
        },
       
      ];

  PostExpectation mockRequest() => when(httpClient.request(
      url: anyNamed('url'),
      method: anyNamed('method'),
      body: anyNamed('body')));

  void mockHttpData(List<Map> data) {
    list = data;
    mockRequest().thenAnswer((_) async => data);
  }

  void mockHttpError(HttpError error) {
    mockRequest().thenThrow(error);
  }

  setUp(() {
    url = faker.internet.httpUrl();
    httpClient = HttpClientSpy();
    sut = RemoteLoadComments(url: url, httpClient: httpClient);
    params=RemoteLoadCommentsParams(faker.guid.guid());
    mockHttpData(mockValidData());
  });

  test('Should calll HttpClient with currect values', () async {
    await sut.load(params.postId);

    verify(httpClient.request(url: url, method: 'get',body:{'postId':params.postId}));
  });

    test('Should return posts on 200', () async {
    final posts = await sut.load(params.postId);

    expect(posts, [
      CommentEntity(
        id: list[0]['id'],
        description: list[0]['description'],
        postId: list[0]['postId'],
        userId: list[0]['userId'],
       
      ),
     CommentEntity(
        id: list[1]['id'],
        description: list[1]['description'],
        postId: list[1]['postId'],
        userId: list[1]['userId'],
       
      ),
    
    ]);
  });

  test('Should throw UnexpectedError if HttpClient returns 404', () {
    mockHttpError(HttpError.notFound);
    final future = sut.load(params.postId);

    expect(future, throwsA(DomainError.unexpected));
  });

  test('Should throw AccessDeniedError if HttpClient returns 403', () {
    mockHttpError(HttpError.forbidden);
    final future = sut.load(params.postId);

    expect(future, throwsA(DomainError.accessDenied));
  });


  test('Should throw UnexpectedError if HttpClient returns 500', () {
    mockHttpError(HttpError.serverError);
    final future = sut.load(params.postId);

    expect(future, throwsA(DomainError.unexpected));
  });


}
