/// Représente le profil d'un des deux membres du couple.
class UserProfile {
  final String id;
  final String displayName;
  final String? avatarPath;
  final DateTime? birthDate;
  final String? nickname;

  const UserProfile({
    required this.id,
    required this.displayName,
    this.avatarPath,
    this.birthDate,
    this.nickname,
  });

  UserProfile copyWith({
    String? displayName,
    String? avatarPath,
    DateTime? birthDate,
    String? nickname,
  }) {
    return UserProfile(
      id: id,
      displayName: displayName ?? this.displayName,
      avatarPath: avatarPath ?? this.avatarPath,
      birthDate: birthDate ?? this.birthDate,
      nickname: nickname ?? this.nickname,
    );
  }
}
