import 'package:faker/faker.dart';

import 'package:social_media_front/data/cache/chache.dart';
import 'package:social_media_front/data/usecases/usecases.dart';

import 'package:social_media_front/domain/entities/entities.dart';
import 'package:social_media_front/domain/helpers/helpers.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';



class SaveSecureCacheStorageSpy extends Mock implements SaveSecureCacheStorage {
}

void main() {
  LocalSaveCurrentAccount sut;
  SaveSecureCacheStorageSpy saveSecureCacheStorage;
  AccountEntity account;

  setUp(() {
    saveSecureCacheStorage = SaveSecureCacheStorageSpy();
    sut =
        LocalSaveCurrentAccount(saveSecureCacheStorage: saveSecureCacheStorage);
    account = AccountEntity(faker.guid.guid());
  });

  void mockError() {
    when(saveSecureCacheStorage.saveSecure(
            key: anyNamed('key'), value: anyNamed('value')))
        .thenThrow(Exception());
  }

  test('Should call SaveSecureCacheStorage with currect values', () async {
    await sut.save(account);

    verify(
        saveSecureCacheStorage.saveSecure(key: 'token', value: account.token));
  });

  test(
      'Should throw UnexpectedError if SaveSecureCacheStorage with correct values',
      () async {
    mockError();
    print(account);
    final future = sut.save(account);

    expect(future, throwsA(DomainError.unexpected));
  });
}
