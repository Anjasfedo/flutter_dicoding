import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const FirstScreen());
  }
}

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'lorem ipsum',
            style: TextStyle(color: Colors.white),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search, color: Colors.white),
            ),
          ],
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.menu,
              color: Colors.white,
            ),
          ),
          backgroundColor: Colors.blue,
        ),
        body: Expanded(
          child: ListView(
            children: [
              ElevatedButton(
                onPressed: () {},
                child: const Text('data'),
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  'data',
                ),
              ),
              OutlinedButton(
                child: const Text('Outlined Button'),
                onPressed: () {
                  // Aksi ketika button diklik
                },
              ),
              IconButton(
                icon: const Icon(Icons.volume_up),
                tooltip: 'Increase volume by 10',
                onPressed: () {
                  // Aksi ketika button diklik
                },
              ),
              const DropDownButton()
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () {},
            child: const Icon(
              Icons.add,
            )));
  }
}

class DropDownButton extends StatefulWidget {
  const DropDownButton({super.key});

  @override
  State<DropDownButton> createState() => DropDownStateButton();
}

class DropDownStateButton extends State<DropDownButton> {
  String? language;

  String _name = '';

  bool lightOn = false;

  bool agree = false;

  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(language ?? 'Select language'),
          DropdownButton(
              items: const [
                DropdownMenuItem(
                  value: 'kotlin',
                  child: Text('Kotlin'),
                ),
                DropdownMenuItem(
                  value: 'dart',
                  child: Text('Dart'),
                ),
                DropdownMenuItem(
                  value: 'java',
                  child: Text('Java'),
                ),
              ],
              value: language,
              hint: const Text('Choose Language'),
              onChanged: (String? value) {
                setState(() {
                  language = value;
                });
              }),
          Text(_name),
          TextField(
            onChanged: (String value) {
              setState(() {
                _name = value;
              });
            },
          ),
          TextField(
            onSubmitted: (String value) {
              setState(() {
                _name = value;
              });
            },
          ),
          TextField(
            controller: _controller,
            decoration: const InputDecoration(
              hintText: 'Write your name here...',
              labelText: 'Your Name',
            ),
            onChanged: (String value) {
              setState(() {
                _name = value;
              });
            },
          ),
          ElevatedButton(
            child: const Text('Submit'),
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      content: Text('Hello, $_name'),
                    );
                  });
            },
          ),
          Switch(
            value: lightOn,
            onChanged: (bool value) {
              setState(() {
                lightOn = value;
              });

              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(lightOn ? 'On' : 'Of'),
                  duration: const Duration(seconds: 1),
                ),
              );
            },
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: Radio(
                  value: 'kotlin',
                  groupValue: language,
                  onChanged: (String? value) {
                    setState(
                      () {
                        language = value;
                        showSnackBar();
                      },
                    );
                  },
                ),
                title: const Text('Kotlin'),
              ),
              ListTile(
                leading: Radio(
                  value: 'dart',
                  groupValue: language,
                  onChanged: (String? value) {
                    setState(
                      () {
                        language = value;
                        showSnackBar();
                      },
                    );
                  },
                ),
                title: const Text('Dart'),
              ),
              ListTile(
                leading: Radio(
                  value: 'java',
                  groupValue: language,
                  onChanged: (String? value) {
                    setState(
                      () {
                        language = value;
                        showSnackBar();
                      },
                    );
                  },
                ),
                title: const Text('Java'),
              ),
              ListTile(
                leading: Checkbox(
                    value: agree,
                    onChanged: (bool? value) {
                      setState(() {
                        agree = value!;
                      });
                    }),
                title: Text('Agree / Disagree ($agree)'),
              ),
              Image.network(
                'https://picsum.photos/200/300',
                width: 200,
                height: 200,
              ),
              Image.asset(
                'images/android.png',
                width: 200,
                height: 200,
              )
            ],
          )
        ],
      ),
    );
  }

  void showSnackBar() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$language selected'),
        duration: const Duration(seconds: 1),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
