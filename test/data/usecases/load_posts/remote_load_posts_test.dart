import 'package:faker/faker.dart';
import 'package:mockito/mockito.dart';
import 'package:social_media_front/data/http/http.dart';
import 'package:social_media_front/data/models/models.dart';
import 'package:social_media_front/data/usecases/load_posts/load_posts.dart';
import 'package:social_media_front/domain/entities/entities.dart';
import 'package:social_media_front/domain/helpers/helpers.dart';
import 'package:social_media_front/domain/usecases/usecases.dart';

import 'package:test/test.dart';
import 'package:meta/meta.dart';


class HttpClientSpy extends Mock implements HttpClient {}

void main() {
  String url;
  List<Map> list;
  RemoteLoadPosts sut;
  HttpClientSpy httpClient;
  List<Map> mockValidData() => [
        {
          'id': faker.guid.guid(),
          'description': faker.randomGenerator.string(50),
          'likes': faker.randomGenerator.integer(90),
          'pics': [
            faker.image.image(),
            faker.image.image(),
          ],
          'created': faker.date.dateTime().toIso8601String(),
        },
        {
          'id': faker.guid.guid(),
          'description': faker.randomGenerator.string(50),
          'likes': faker.randomGenerator.integer(90),
          'pics': [
            faker.image.image(),
            faker.image.image(),
          ],
          'created': faker.date.dateTime().toIso8601String(),
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
    sut = RemoteLoadPosts(url: url, httpClient: httpClient);
    mockHttpData(mockValidData());
  });

  test('Should calll HttpClient with currect values', () async {
    await sut.load();

    verify(httpClient.request(url: url, method: 'get'));
  });

    test('Should return posts on 200', () async {
    final posts = await sut.load();

    expect(posts, [
      PostEntity(
        id: list[0]['id'],
        description: list[0]['description'],
        created: DateTime.parse(list[0]['created']),
        likes: list[0]['likes'],
        pics:  list[0]['pics'],
      ),
      PostEntity(
        id: list[1]['id'],
        description: list[1]['description'],
        created: DateTime.parse(list[1]['created']),
        likes: list[1]['likes'],
        pics:  list[1]['pics'],
      ),

    ]);
  });

  test('Should throw UnexpectedError if HttpClient returns 404', () {
    mockHttpError(HttpError.notFound);
    final future = sut.load();

    expect(future, throwsA(DomainError.unexpected));
  });

  test('Should throw AccessDeniedError if HttpClient returns 403', () {
    mockHttpError(HttpError.forbidden);
    final future = sut.load();

    expect(future, throwsA(DomainError.accessDenied));
  });


  test('Should throw UnexpectedError if HttpClient returns 500', () {
    mockHttpError(HttpError.serverError);
    final future = sut.load();

    expect(future, throwsA(DomainError.unexpected));
  });


}
