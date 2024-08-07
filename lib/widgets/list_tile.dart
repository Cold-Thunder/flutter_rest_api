import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListTileWidget extends StatelessWidget{
  late String name;
  late String email;
  late String image;

  ListTileWidget({
    required this.name,
    required this.email,
    required this.image
});
  @override
  Widget build(BuildContext context){
    return Container(
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(40),
          child: Image.network('$image')
        ),
        title: Text('$name'),
        subtitle: Text('$email'),
      )
    );
  }
}