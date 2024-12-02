import 'package:agora/core/core.dart';
import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String name;
  final String avatar;
  final bool isComplete;

  const User({
    required this.name,
    required this.avatar,
    this.isComplete = false,
  });

  factory User.empty() {
    return User(
      name: '',
      avatar: Assets.images.avatar1.path,
      isComplete: false,
    );
  }

  User copyWith({
    String? name,
    String? avatar,
    bool? isComplete,
  }) {
    return User(
      name: name ?? this.name,
      avatar: avatar ?? this.avatar,
      isComplete: isComplete ?? this.isComplete,
    );
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'] as String,
      avatar: json['avatar'] as String,
      isComplete: json['isComplete'] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'avatar': avatar,
      'isComplete': isComplete,
    };
  }

  @override
  List<Object?> get props => [
        name,
        avatar,
        isComplete,
      ];
}

extension ImageFromPath on String {
  AssetGenImage get image {
    return AssetGenImage(this);
  }
}
