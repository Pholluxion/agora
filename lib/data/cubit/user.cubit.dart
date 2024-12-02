import 'package:hydrated_bloc/hydrated_bloc.dart';

import 'package:agora/data/models/models.dart';
import 'package:logger/logger.dart';

class UserCubit extends HydratedCubit<User> {
  UserCubit() : super(User.empty());

  static final logger = Logger(printer: PrettyPrinter());

  @override
  User? fromJson(Map<String, dynamic> json) {
    return User.fromJson(json);
  }

  @override
  Map<String, dynamic>? toJson(User state) {
    return state.toJson();
  }

  void updateName(String name) {
    emit(state.copyWith(name: name));
  }

  void updateAvatar(String avatar) {
    emit(state.copyWith(avatar: avatar));
  }

  void completeProfile() {
    emit(state.copyWith(isComplete: true));
  }

  void clearUserData() {
    emit(User.empty());
  }

  @override
  void onChange(Change<User> change) {
    logger.i(change);
    super.onChange(change);
  }
}
