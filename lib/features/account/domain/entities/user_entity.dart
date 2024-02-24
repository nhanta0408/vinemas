// ignore_for_file: public_member_api_docs, sort_constructors_first
import '../../../../core/common/enums/gender.dart';

class UserEntity {
  String? id;
  String? fullName;
  String? avatarUrl;
  String? phoneNumber;
  String? email;
  Gender? gender;
  String? city;
  DateTime? dateOfBirth;
  UserEntity({
    this.id,
    this.fullName,
    this.avatarUrl,
    this.phoneNumber,
    this.email,
    this.gender,
    this.city,
    this.dateOfBirth,
  });

  UserEntity copyWith({
    String? id,
    String? fullName,
    String? avatarUrl,
    String? phoneNumber,
    String? email,
    Gender? gender,
    String? city,
    DateTime? dateOfBirth,
  }) {
    return UserEntity(
      fullName: fullName ?? this.fullName,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      email: email ?? this.email,
      gender: gender ?? this.gender,
      city: city ?? this.city,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
    );
  }

  @override
  bool operator ==(covariant UserEntity other) {
    if (identical(this, other)) {
      return true;
    }

    return other.id == id &&
        other.fullName == fullName &&
        other.avatarUrl == avatarUrl &&
        other.phoneNumber == phoneNumber &&
        other.email == email &&
        other.gender == gender &&
        other.city == city &&
        other.dateOfBirth == dateOfBirth;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        fullName.hashCode ^
        avatarUrl.hashCode ^
        phoneNumber.hashCode ^
        email.hashCode ^
        gender.hashCode ^
        city.hashCode ^
        dateOfBirth.hashCode;
  }

  @override
  String toString() {
    return '''UserEntity(id: $id, fullName: $fullName, avatarUrl: $avatarUrl, phoneNumber: $phoneNumber, email: $email, gender: $gender, city: $city, dateOfBirth: $dateOfBirth)''';
  }
}
