import 'package:rest_api_prac/modal/user_dob.dart';
import 'package:rest_api_prac/modal/user_name.dart';
import 'package:rest_api_prac/modal/locations.dart';
import 'package:rest_api_prac/modal/user_images.dart';

class User{
  late String gender;
  late String phone;
  late String cell;
  late String email;
  late String nat;
  late UserName name;
  late UserDob dob;
  late Locations locations;
  late UserImages images;
  User({
    required this.gender,
    required this.phone,
    required this.cell,
    required this.email,
    required this.nat,
    required this.name,
    required this.dob,
    required this.locations,
    required this.images
  });
  String get fullName{
    return '${name.title} ${name.first} ${name.last}';
  }

  factory User.fromMap(Map<String, dynamic> e){
    final name = UserName.fromMap(e['name']);
    final dob = UserDob.fromMap(e['dob']);

    final location = Locations.fromMap(e['location']);

    final images = UserImages.fromMap(e['picture']);
    return User(
        gender: e['gender'],
        cell: e['cell'],
        email: e['email'],
        phone: e['phone'],
        nat: e['nat'],
        name: name,
        dob: dob,
        locations: location,
        images: images
    );
  }
}

