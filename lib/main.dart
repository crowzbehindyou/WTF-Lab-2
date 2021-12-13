import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.deepOrangeAccent
      ),
      title: 'Startup Name Generator',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepOrangeAccent,
          title: const Text('Пробуем'),
          leading: IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {},
          ),
        ),
        body: ListOfChats(),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.deepOrangeAccent,
          child: Icon(Icons.add),
          onPressed: () {},
        ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              label: 'Home',
              icon: Icon(Icons.home)),
          BottomNavigationBarItem(
              label: 'Delete',
              icon: Icon(Icons.delete))
        ],
      ),
      )
    );
  }
}

class ListOfChats extends StatelessWidget {
  const ListOfChats({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
      return GestureDetector(
        onTap: () {print('$index');},
          child: Container(
            color: index % 2 == 0 ? Colors.green : Colors.red,
            child: Row(
              children: [
                CircleAvatar(
                  //backgroundImage: ,
                )
              ],
            ),
      )
      );
    });
  }
}
