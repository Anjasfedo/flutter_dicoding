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

// class Heading extends StatelessWidget {
//   final String text;

//   const Heading({super.key, required this.text});

//   @override
//   Widget build(BuildContext context) {
//     return Text(
//       text,
//       style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//     );
//   }
// }

// class BiggerText extends StatefulWidget {
//   final String text;

//   const BiggerText({super.key, required this.text});

//   @override
//   State<BiggerText> createState() => _BiggerTextState();
// }

// class _BiggerTextState extends State<BiggerText> {
//   double _textSize = 16.0;

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Text(widget.text, style: TextStyle(fontSize: _textSize)),
//         ElevatedButton(
//           onPressed: () {
//             setState(() {
//               _textSize = _textSize == 16.0 ? 32.0 : 16.0;
//             });
//           },
//           child: const Text('Toggle text sizess'),
//         )
//       ],
//     );
//   }
// }

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
        body: Center(
          child: Column(
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

  @override
  Widget build(BuildContext context) {
    return Container(
      child: DropdownButton(
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
    );
  }
}
