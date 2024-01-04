import 'dart:async';

// ignore: one_member_abstracts
abstract class UseCase<Type, Params> {
  FutureOr<Type> call(Params params);
}
