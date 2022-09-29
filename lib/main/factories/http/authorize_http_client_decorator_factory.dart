import 'package:social_media_front/main/decorators/autorize_http_client_decorator.dart';
import 'package:social_media_front/main/factories/cache/local_storage_adapter_factory.dart';
import 'package:social_media_front/main/factories/http/http_client_factory.dart';

import '../../../data/http/http.dart';


HttpClient makeAuthorizeHttpClientDecorator() {


  return AuthorizeHttpClientDecorator(decoratee:makeHttpAdapter(), fetchSecureCacheStorage: makeLocalStorageAdapter());
}
