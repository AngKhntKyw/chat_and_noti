import 'package:chat_and_noti/features/auth/datasource/auth_datasource.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authDatasourceProvider = Provider<AuthDatasource>((ref) {
  return AuthDatasource();
});
