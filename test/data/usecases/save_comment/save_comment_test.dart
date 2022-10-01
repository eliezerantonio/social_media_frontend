import 'package:faker/faker.dart';
import 'package:mockito/mockito.dart';
import 'package:social_media_front/data/http/http.dart';
import 'package:social_media_front/data/models/remote_comment_model.dart';
import 'package:social_media_front/domain/entities/entities.dart';
import 'package:social_media_front/domain/helpers/helpers.dart';
import 'package:social_media_front/domain/usecases/save_comment.dart';
import 'package:test/test.dart';
import 'package:meta/meta.dart';

class HttpClientSpy extends Mock implements HttpClient {}

class RemoteSaveComment implements SaveComment {
  RemoteSaveComment({@required this.httpClient, @required this.url});

  HttpClient httpClient;
  String url;

  @override
  Future<CommentEntity> save(String postId) async {
   try{

  final httpResponse=   await httpClient.request(url: url, method: 'post', body: {'postId': postId});

   return RemoteCommentModel.fromJson(httpResponse).toEntity();
      
   }on HttpError catch (error) {

      throw error == HttpError.forbidden
          ? DomainError.accessDenied
          : DomainError.unexpected;
    }
  }
}

void main() {
  RemoteSaveComment sut;
  HttpClientSpy httpClient;
  String url;
  String postId;

  Map mockValidData() =>
    {
          'id': faker.guid.guid(),
          'description': faker.randomGenerator.string(50),
          'postId': faker.guid.guid(),
          'userId': faker.guid.guid(),
        };

 PostExpectation mockRequest() => when(httpClient.request(
      url: anyNamed('url'),
      method: anyNamed('method'),
      body: anyNamed('body')));

    void mockHttpError(HttpError error) {
    mockRequest().thenThrow(error);
  }
 void mockHttpData(Map data) {
    mockRequest().thenAnswer((_) async => data);
  }
  setUp(() {
    httpClient = HttpClientSpy();
    postId = faker.guid.guid();
    url = faker.internet.httpUrl();
    sut = RemoteSaveComment(httpClient: httpClient, url: url);


     mockHttpData(mockValidData());
  });



  test(' Should call HttpClient with correct values', () async {
    await sut.save(postId);

    verify(httpClient.request(url: url, method: 'post', body: {'postId': postId}));
  });


  test('Should throw UnexpectedError if HttpClient returns 400', () {
    mockHttpError(HttpError.badRequest);
    final future = sut.save(postId);

    expect(future, throwsA(DomainError.unexpected));
  });

   test('Should throw UnexpectedError if HttpClient returns 404', () {
    mockHttpError(HttpError.notFound);

    final future = sut.save(postId);

    expect(future, throwsA(DomainError.unexpected));
  });
  test('Should throw UnexpectedError if HttpClient returns 500', () {
    mockHttpError(HttpError.serverError);

    final future = sut.save(postId);

    expect(future, throwsA(DomainError.unexpected));
  });
  test('Should throw UnexpectedError if HttpClient returns 403', () {
    mockHttpError(HttpError.forbidden);

    final future = sut.save(postId);

    expect(future, throwsA(DomainError.accessDenied));
  });
  test('Should return an comment if HttpClient returns 200', () async {
    final validData = mockValidData();
    mockHttpData(validData);
    final comment = await sut.save(postId);

    expect(comment.description, validData['description']);
  });
  test('Should throw UnexpectedError if HttpClient returns 200 with invalid data ',() async {
    mockHttpData({'invalid_key': 'invalid_value'});
    final future = sut.save(postId);

    expect(future, throwsA(DomainError.unexpected));
  });

}
