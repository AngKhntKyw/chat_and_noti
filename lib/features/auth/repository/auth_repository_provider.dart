import 'package:chat_and_noti/features/auth/datasource/auth_datasource_provider.dart';
import 'package:chat_and_noti/features/auth/repository/auth_repository.dart';
import 'package:chat_and_noti/features/auth/repository/auth_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final authDatasource = ref.watch(authDatasourceProvider);
  return AuthRepositoryImpl(authDatasource);
});
