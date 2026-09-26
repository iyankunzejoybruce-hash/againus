import 'user_profile.dart';

/// Informations globales du couple : date de mise en couple,
/// surnom du couple, et les deux profils liés.
class CoupleInfo {
  final DateTime togetherSince;
  final String? coupleNickname;
  final UserProfile partnerA;
  final UserProfile partnerB;

  const CoupleInfo({
    required this.togetherSince,
    required this.partnerA,
    required this.partnerB,
    this.coupleNickname,
  });

  /// Nombre de jours écoulés depuis la mise en couple.
  int get daysTogether =>
      DateTime.now().difference(togetherSince).inDays;

  CoupleInfo copyWith({
    DateTime? togetherSince,
    String? coupleNickname,
    UserProfile? partnerA,
    UserProfile? partnerB,
  }) {
    return CoupleInfo(
      togetherSince: togetherSince ?? this.togetherSince,
      coupleNickname: coupleNickname ?? this.coupleNickname,
      partnerA: partnerA ?? this.partnerA,
      partnerB: partnerB ?? this.partnerB,
    );
  }
}
