import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart' as model;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_twitter_clone/core/core.dart';
import 'package:fpdart/fpdart.dart';

// want to signup,want to get user account -> Account
// want to access user related data -> model.Account

abstract class IAtuthApi {
  FutureEither<model.User> signUp({
    required String email,
    required String password,
  });
}

class AuthAPI implements IAtuthApi {
  final Account _account;
  AuthAPI({required Account account}) : _account = account;

  @override
  FutureEither<model.User> signUp({
    required String email,
    required String password,
  }) async {
    try {
      final account = await _account.create(
        userId: ID.unique(),
        email: email,
        password: password,
      );
      return right(account);
    } on AppwriteException catch (e, stackTrace) {
      return left(
          Failuer(e.message ?? 'some unexpected error ocurred', stackTrace));
    } catch (e, stackTrace) {
      return left(Failuer(e.toString(), stackTrace));
    }
  }
}
