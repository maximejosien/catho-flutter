import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DetailsPage extends StatelessWidget {
  static const String routeName = "/details";

  List _list = [1,2,3,4,5,6];

  @override
  Widget build(BuildContext context) {
    final Map arguments = ModalRoute.of(context).settings.arguments as Map;
    String text = "J'ai pas de titre";
    if (arguments != null) text = arguments['text'];

    return Scaffold(
      appBar: AppBar(
        title: Text(text),
      ),
      body: ListView.separated(
          itemBuilder: (context, position) {
            var item = _list[position];
            return Text("$item");
          },
          separatorBuilder: (context, position) {
            return Divider();
          },
          itemCount: _list.length
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.add_shopping_cart),
            title: Text("Shopping cart")
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_to_photos),
              title: Text("Add photos")
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_shopping_cart),
              title: Text("Shopping cart")
          ),
        ],
        backgroundColor: Colors.deepOrangeAccent,
      ),
    );
  }

}