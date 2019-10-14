import 'dart:convert';
import 'package:chopper/chopper.dart';

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import './utils/post_api_service.dart';
import 'single_post_page.dart';


class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text( "Chopper Blog" ) ,
      ) ,
      body: _buildBody( context ) ,

      floatingActionButton: FloatingActionButton(
        elevation: 7.0 ,
        child: Icon( Icons.add ) ,
        onPressed: ()async {
          var response = await Provider.of<PostApiService>( context )
              .postPost( {'key': 'value'} );
           print( response.body);
        } ,
      ) ,
    );
  }

  FutureBuilder<Response> _buildBody(BuildContext context){
    return FutureBuilder<Response>(


      future: Provider.of<PostApiService>( context ).getPosts(),
      builder: (context ,snapshot){
        if (snapshot.connectionState == ConnectionState.done){

        final List posts = json.decode(snapshot.data.bodyString);
        return _buildPosts(context, posts);

        }
        else{
        return Center(
        child: CircularProgressIndicator(),
        );
        }
      } ,
    );
  }

  ListView _buildPosts(BuildContext context ,List posts){
    return ListView.builder(
      itemCount: posts.length ,
      padding: EdgeInsets.all( 8 ) ,
      itemBuilder: (context ,index){
        return Card(
          elevation: 4.0 ,
          child: ListTile(
            title: Text(
              posts[index]['title'].toString() ,
              style: TextStyle( fontWeight: FontWeight.bold )
            ) ,
            subtitle: Text(posts[index]['body'].toString()) ,
            onTap: () => _navigateToPost( context ,posts[index]['id'] ) ,
          ) ,
        );
      } ,

    );
  }

  void _navigateToPost(BuildContext context , int id){

  Navigator.of(context).push(
  MaterialPageRoute(
  builder: (context) => SinglePostPage(postId: id),
  )
  );


  }
}

