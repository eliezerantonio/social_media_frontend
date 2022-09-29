import 'package:social_media_front/data/usecases/load_current_account/load_current_account.dart';

import '../../../domain/usecases/usecases.dart';
import '../cache/cache.dart';


LoadCurrentAccount makeLocalLoadCurrentAccount() => LocalLoadCurrentAccount(fechSecureCacheStorage: makeLocalStorageAdapter());
