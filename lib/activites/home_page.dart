import 'package:flutter/material.dart';
import 'package:rest_api_prac/modal/User.dart';
import 'package:rest_api_prac/services/fetch_users.dart';
import 'package:rest_api_prac/widgets/list_tile.dart';

class HomePage extends StatefulWidget{
  @override
  HomePageState createState()=> HomePageState();
}

class HomePageState extends State<HomePage>{
  late List<User> users = [];

  @override
  void initState(){
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rest API', style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white
        ),),
        backgroundColor: Colors.blue
      ),
      body: SafeArea(
        child: Center(
          child: ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index){
              var user = users[index];
              return ListTileWidget(name: user.fullName, email: user.locations.country, image: user.images.medium,);
            }
          )
        )
      ),
      floatingActionButton: FloatingActionButton(
        child:const Text('Press',style: TextStyle(fontSize: 22, color: Colors.black)),
        onPressed: (){
        }
      )
    );
  }

  Future<void> fetchData()async {
    final response = await FetchUsers.fetchData();
    setState((){
      users = response;
    });
  }

}