import '../../domain/entities/user_profile.dart';

/// Version "data" de [UserProfile], avec (de)sérialisation JSON
/// pour le stockage local (fichier, Hive, SharedPreferences...).
class UserProfileModel extends UserProfile {
  const UserProfileModel({
    required super.id,
    required super.displayName,
    super.avatarPath,
    super.birthDate,
    super.nickname,
  });

  factory UserProfileModel.fromJson(Map<String, dynamic> json) {
    return UserProfileModel(
      id: json['id'] as String,
      displayName: json['displayName'] as String,
      avatarPath: json['avatarPath'] as String?,
      birthDate: json['birthDate'] != null
          ? DateTime.tryParse(json['birthDate'] as String)
          : null,
      nickname: json['nickname'] as String?,
    );
  }

  factory UserProfileModel.fromEntity(UserProfile entity) {
    return UserProfileModel(
      id: entity.id,
      displayName: entity.displayName,
      avatarPath: entity.avatarPath,
      birthDate: entity.birthDate,
      nickname: entity.nickname,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'displayName': displayName,
      'avatarPath': avatarPath,
      'birthDate': birthDate?.toIso8601String(),
      'nickname': nickname,
    };
  }
}
