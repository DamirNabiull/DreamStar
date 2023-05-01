import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'connection_client.dart';
import 'firestore_client.dart';
import 'mapping_client.dart';
import 'user_client.dart';

final mappingProvider = Provider((ref) => MappingClient());
final fireStoreProvider = Provider((ref) => FireStoreClient());
final connectionProvider =
    NotifierProvider<ConnectionClient, bool>(ConnectionClient.new);
final userProvider = Provider((ref) => UserClient());
