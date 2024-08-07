class Locations{
  final String city;
  final String state;
  final String country;
  final String postcode;

  final LocationStreet street;
  final LocationTimezone timezone;
  final LocationCoordinates coordinates;

  Locations({
   required this.city,
   required this.state,
   required this.country,
   required this.postcode,
    required this.street,
    required this.timezone,
    required this.coordinates
  });
}

class LocationStreet{
  final int number;
  final String name;
  LocationStreet({
    required this.number,
    required this.name
  });
}
class LocationTimezone{
  final String offset;
  final String description;
  LocationTimezone({
    required this.offset,
    required this.description
  });
}

class LocationCoordinates{
  final String latitude;
  final String longitude;
  LocationCoordinates({
    required this.latitude,
    required this.longitude
});
}