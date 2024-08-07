import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:rest_api_prac/modal/User.dart';
import 'package:rest_api_prac/modal/locations.dart';
import 'package:rest_api_prac/modal/user_dob.dart';
import 'package:rest_api_prac/modal/user_images.dart';
import 'package:rest_api_prac/modal/user_name.dart';

class FetchUsers{
  static Future fetchData() async {
    try {
      const url = 'https://randomuser.me/api/?results=100';
      final uri = Uri.parse(url);
      final response =await http.get(uri);
      final body = response.body;
      final result = jsonDecode(body);
      final usersList = result['results'] as List<dynamic>;
      final users = usersList.map((e){
          final name = UserName(
              title: e['name']['title'],
              first: e['name']['first'],
              last: e['name']['last']
          );
          final date = e['dob']['date'];
          final dob = UserDob(
              date: DateTime.parse(date),
              age: e['dob']['age']
          );

          final street = LocationStreet(
              number: e['location']['street']['number'],
              name: e['location']['street']['name']
          );
          final coordinate = LocationCoordinates(
              latitude: e['location']['coordinates']['latitude'],
              longitude: e['location']['coordinates']['longitude']
          );
          final timezone = LocationTimezone(
              offset: e['location']['timezone']['offset'],
              description: e['location']['timezone']['description']
          );
          final location = Locations(
              city: e['location']['city'],
              state: e['location']['state'],
              country: e['location']['country'],
              postcode: e['location']['postcode'].toString(),
              street: street,
              coordinates: coordinate,
              timezone: timezone
          );

          final images = UserImages(
              large: e['picture']['large'].toString(),
              medium: e['picture']['medium'].toString(),
              thumbnail: e['picture']['thumbnail'].toString()
          );
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
        }).toList();
      return users;
    } catch (err) {
      print(err);
    }
  }
}