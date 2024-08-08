import 'dart:io';

class UserImages{
  final String large;
  final String medium;
  final String thumbnail;

  UserImages({
    required this.large,
    required this.medium,
    required this.thumbnail
  });

  factory UserImages.fromMap(Map<String, dynamic> json){
    return UserImages(
        large: json['large'].toString(),
        medium: json['medium'].toString(),
        thumbnail:json['thumbnail'].toString()
    );
  }
}