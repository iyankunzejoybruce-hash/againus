import '../../domain/entities/couple_info.dart';
import 'user_profile_model.dart';

/// Version "data" de [CoupleInfo] avec (de)sérialisation JSON.
class CoupleInfoModel extends CoupleInfo {
  const CoupleInfoModel({
    required super.togetherSince,
    required super.partnerA,
    required super.partnerB,
    super.coupleNickname,
  });

  factory CoupleInfoModel.fromJson(Map<String, dynamic> json) {
    return CoupleInfoModel(
      togetherSince: DateTime.parse(json['togetherSince'] as String),
      coupleNickname: json['coupleNickname'] as String?,
      partnerA: UserProfileModel.fromJson(
        json['partnerA'] as Map<String, dynamic>,
      ),
      partnerB: UserProfileModel.fromJson(
        json['partnerB'] as Map<String, dynamic>,
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'togetherSince': togetherSince.toIso8601String(),
      'coupleNickname': coupleNickname,
      'partnerA': UserProfileModel.fromEntity(partnerA).toJson(),
      'partnerB': UserProfileModel.fromEntity(partnerB).toJson(),
    };
  }
}
