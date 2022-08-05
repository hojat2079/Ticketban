import 'package:equatable/equatable.dart';

class UserInfoResponse extends Equatable {
  final String name;
  final String familyName;

  const UserInfoResponse(this.name, this.familyName);

  @override
  List<Object> get props => [name, familyName];

  UserInfoResponse.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        familyName = json['familyName'];

  @override
  String toString() {
    return '$name $familyName';
  }
}
