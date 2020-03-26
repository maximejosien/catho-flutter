import 'package:catho_app/data/models/cat.dart';
import 'package:catho_app/data/repositories/catRepository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CatsPage extends StatefulWidget {

  State<StatefulWidget> createState() => _CatsPageState();
}

class _CatsPageState extends State<CatsPage> {

  final _catsRepository = CatsRepository.instance;

  @override
  Widget build(BuildContext context) {
  _catsRepository.firstCat();
    return Scaffold(
      appBar: AppBar(
        title: Text("Mes chats"),
      ),
      body: FutureBuilder(
        future: _catsRepository.firstCat(),
        builder: (BuildContext context, AsyncSnapshot<List<Cat>> cat) {
          if (cat.hasData) {
            return ListView.builder(
                itemCount: cat.data.length,
                itemBuilder: (context, position) {
                  return Image.network(cat.data[position].url);
                }
            );
          } else {
            return CircularProgressIndicator();
          }
        }
      )
    );
  }
}