import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'connection_client.dart';
import 'firebase_client.dart';
import 'mapping_client.dart';
import 'user_client.dart';

final mappingProvider = Provider((ref) => MappingClient());
final fireStoreProvider = Provider((ref) => FireStoreClient());
final userProvider = Provider((ref) => UserClient());
final connectionProvider = NotifierProvider<ConnectionClient, bool>(ConnectionClient.new);