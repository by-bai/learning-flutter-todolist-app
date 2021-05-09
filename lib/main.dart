import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'To-do list'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<String> _todoList = <String>[];
  final List<String> _completedList = <String>[];
  final TextEditingController _textFieldController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Align(
                alignment: Alignment.topLeft,
                child: Text(
                    'Tasks to be done',
                    style: TextStyle(fontSize: 24,
                        color: Colors.black,
                        fontWeight: FontWeight.bold)
                )
            ),
            Flexible(child: ListView(children: _getItems())),
            Align(
                alignment: Alignment.topLeft,
                child: Text(
                    'Completed tasks',
                    style: TextStyle(fontSize: 24,
                        color: Colors.black,
                        fontWeight: FontWeight.bold)
                )
            ),
            Flexible(child: ListView(children: _getCompletedItems()))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showMyDialog,
        tooltip: 'AddTask',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget _buildItem(String title) {
    return Card(
        child: ListTile(
            title: Text(title),
            trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  IconButton(
                    icon: Icon(
                        Icons.delete,
                        color: Colors.black
                    ),
                    onPressed: () => removeItem(title, 'to-do list'),

                  ),
                  IconButton(
                      icon: Icon(
                          Icons.check_box_outline_blank,
                          color: Colors.black
                      ),
                    onPressed: () => completeItem(title),
                  )
                ]
            )
        )
    );
  }

  Widget _buildCompletedItem(String title) {
    return Card(
        child: ListTile(
            title: Text(title),
            trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  IconButton(
                    icon: Icon(
                        Icons.delete,
                        color: Colors.black
                    ),
                    onPressed: () => removeItem(title, 'completed list'),
                  ),
                  IconButton(
                      icon: Icon(
                          Icons.check_box,
                          color: Colors.black
                      ),
                    onPressed: () => uncheckedItem(title),
                  )
                ]
            )
        )
    );
  }

  List<Widget> _getItems() {
    //return widget list
    List<Widget> _todoWidgets = <Widget>[];
    for (String title in _todoList) {
      _todoWidgets.add(_buildItem(title));
    }
    return _todoWidgets;
  }

  List<Widget> _getCompletedItems() {
    //return widget list
    List<Widget> _completedWidgets = <Widget>[];
    for (String title in _completedList) {
      _completedWidgets.add(_buildCompletedItem(title));
    }
    return _completedWidgets;
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
        context: context, //context is the manager of the app
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
              title: Text('Enter new task'),
              content: TextField(
                  controller: _textFieldController,
                  decoration: const InputDecoration(hintText: 'Enter your task')
              ),
              actions: <Widget>[
                TextButton(
                    child: const Text('Add'),
                    onPressed: () {
                      Navigator.of(context).pop(); //removes alert dialog
                      addItem(_textFieldController
                          .text); //function adds user's input
                      // into the variable asynchronously
                      _textFieldController.clear(); //clear user's input
                    }
                ),
                TextButton(
                    child: const Text('Cancel'),
                    onPressed: () {
                      Navigator.of(context).pop(); //removes alert dialog
                      _textFieldController.clear(); //clear user's input
                    }
                ),
              ]
          );
        }
    );
  }

  void addItem(String title) async {
    setState(
            () {
          _todoList.add(title);
        }
    );
    return;
  }

  void completeItem(String title) async {
    setState(() {
      _todoList.removeWhere((element) => element == title);
      _completedList.add(title);
    });
  }

  void uncheckedItem(String title) async {
    setState(() {
      _completedList.removeWhere((element) => element == title);
      _todoList.add(title);
    });
  }

  void removeItem(String title, String list) async {
    if (list == 'to-do list') {
      setState(() {
        _todoList.removeWhere((element) => element == title);
      });
    }
    else if (list == 'completed list') {
      setState(() {
        _completedList.removeWhere((element) => element == title);
      });
      }

  }

}
