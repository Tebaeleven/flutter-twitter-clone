import 'package:flutter_twitter_clone/core/failuer.dart';
import 'package:fpdart/fpdart.dart';

typedef FutureEither<T> = Future<Either<Failuer, T>>;
typedef FutureEitherVoid = FutureEither<void>;

