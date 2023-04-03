import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'firebase_client.dart';
import 'mapping_client.dart';

final mappingProvider = Provider((ref) => MappingClient());
final fireStoreProvider = Provider((ref) => FireStoreClient());