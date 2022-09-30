import 'package:faker/faker.dart';

import 'package:mockito/mockito.dart';
import 'package:social_media_front/domain/entities/entities.dart';
import 'package:social_media_front/domain/helpers/helpers.dart';
import 'package:social_media_front/domain/usecases/usecases.dart';
import 'package:social_media_front/presentation/presenters/getx_posts_presenter.dart';
import 'package:social_media_front/ui/helpers/errors/errors.dart';
import 'package:social_media_front/ui/pages/posts/post_view_model.dart';
import 'package:test/test.dart';

class LoadPostsSpy extends Mock implements LoadPosts {}

void main() {
  LoadPostsSpy loadPosts;
  GetxPostsPresenter sut;
  List<PostEntity> posts;

  List<PostEntity> mockValidData() => [
        PostEntity(
          id: faker.guid.guid(),
          description: faker.randomGenerator.string(8),
          created: DateTime(2022, 08, 23),
          likes: faker.randomGenerator.integer(8),
          comments: faker.randomGenerator.integer(8),
          pics: [
            faker.randomGenerator.string(5),
            faker.randomGenerator.string(5),
          ],
        ),
        PostEntity(
          id: faker.guid.guid(),
          description: faker.randomGenerator.string(8),
          created: DateTime(2022, 10, 13),
          likes: faker.randomGenerator.integer(8),
          comments: faker.randomGenerator.integer(8),
          pics: [
            faker.randomGenerator.string(5),
            faker.randomGenerator.string(5),
          ],
        ),
      ];

  PostExpectation mockLoadPostsCall() => when(loadPosts.load());
  void mockLoadPosts(List<PostEntity> data) {
    posts = data;
    mockLoadPostsCall().thenAnswer((_) async => data);
  }

  void mockLoadPostsError() =>
      mockLoadPostsCall().thenThrow(DomainError.unexpected);

  setUp(() {
    loadPosts = LoadPostsSpy();

    sut = GetxPostsPresenter(loadPosts: loadPosts);
    mockLoadPosts(mockValidData());
  });
  test('Should calll LoadPosts on loadData', () async {
    await sut.loadData();
    verify(loadPosts.load()).called(1);
  });

  test('Should emit correct events on success', () async {
    sut.loadPostsStream.listen(
      expectAsync1(
        (posts) => expect(posts, [
          PostViewModel(
            created: '23 Ago 2022',
            description: posts[0].description,
            id: posts[0].id,
            likes: posts[0].likes,
            comments: posts[0].comments,
            pics: posts[0].pics,
          ), PostViewModel(
            created: '13 Out 2021',
            description: posts[1].description,
            id: posts[1].id,
            likes: posts[1].likes,
            comments: posts[1].comments,
            pics: posts[1].pics,
          ),
        ]),
      ),
    );

    await sut.loadData();
  });

  test('Should emit correct events on failure', () async {
    mockLoadPostsError();
    sut.loadPostsStream.listen(
      null,
      onError: expectAsync1(
        (error) => expect(error, UIError.unexpected.description),
      ),
    );

    await sut.loadData();
  });
}
