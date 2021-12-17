import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/messages': (context) => const MessageScreen(),
      },
      theme: ThemeData(
        primaryColor: Colors.deepOrangeAccent
      ),
      title: 'Startup Name Generator',
      );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}


class _HomeScreenState extends State<HomeScreen> {
  PageController pageController = PageController(
  );
  int _selectedIndex = 0;
  void onTapped (int index) {
    setState(() {
      _selectedIndex = index;
    });
    pageController.jumpToPage(index);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepOrangeAccent,
          title: const Text('Пробуем'),
          leading: IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {},
          ),
        ),
        body: PageView(
          controller: pageController,
          children: [const ListOfChats(),
          const Events()],
        ),
        bottomNavigationBar: BottomNavigationBar(
          onTap: onTapped,
          currentIndex: _selectedIndex,
          items: [
            const BottomNavigationBarItem(
                label: 'Сообщения',
                icon: Icon(Icons.home)),
            const BottomNavigationBarItem(
                label: 'Список дел',
                icon: Icon(Icons.event))
          ],
        )
    );
  }
}

class ListOfChats extends StatelessWidget {
  const ListOfChats({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 2,
        itemBuilder: (context, index) {
      return GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed('/messages');
        },
          child: Container(
            color: Colors.grey,
            child: Row(
              children: [
                const CircleAvatar(
                  backgroundImage: AssetImage('assets/avatars/sizif.jpg')),
                const Text('Друг')

              ],
            ),
      )
      );
    });
  }
}


class Events extends StatefulWidget {
  const Events({Key? key}) : super(key: key);

  @override
  _EventsState createState() => _EventsState();
}

class _EventsState extends State<Events> {
  late String _userToDo;
  List<String> todoList = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
        itemCount: todoList.length,
        itemBuilder: (context, index) {
          return Dismissible(key: Key(todoList[index]),
          onDismissed: (direction) {
            setState(() {
          todoList.removeAt(index);
        });
          },
          child: Card(
            child: ListTile(
              title: Text(todoList[index]),
            ),
          )
      );
    }
    ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepOrangeAccent,
        child: const Icon(Icons.add),
        onPressed: () {
          showDialog(context: context, builder: (context) {
            return AlertDialog(
              title: const Text('Добавить событие'),
              content: TextField(
                onChanged: (value) {
                  _userToDo = value;
                },
              ),
              actions: [
                ElevatedButton(onPressed: () {
                  setState(() {
                    todoList.add(_userToDo);
                  });
                  Navigator.of(context).pop();
                }, child: const Text('ADD'))
              ],
            );
          });
        },
      ),
    );
  }
}

class MessageScreen extends StatefulWidget {
  const MessageScreen({Key? key}) : super(key: key);

  @override
  _MessageScreenState createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
    );
  }
}
