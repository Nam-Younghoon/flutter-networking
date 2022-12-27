import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:my_app2/models/init_response.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Future<InitRes> futureInit;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    futureInit = fetchInit();
  }

  @override
  Widget build(BuildContext context) {
    Color color = Theme.of(context).primaryColor;

    Widget titleSection = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: const Text(
                    'Oeschinen Lake Campground',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  'Kandersteg, Switzerland',
                  style: TextStyle(
                    color: Colors.grey[500],
                  ),
                )
              ],
            ),
          ),
          Icon(
            Icons.star,
            color: Colors.red[500],
          ),
          const Text('41'),
        ],
      ),
    );

    Widget buttonSection = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildButtonColumn(color, Icons.call, 'CALL'),
          _buildButtonColumn(color, Icons.near_me, 'ROUTE'),
          _buildButtonColumn(color, Icons.share, 'SHARE'),
        ],
      ),
    );

    Widget textSection = Container(
      padding: const EdgeInsets.all(32),
      child: FutureBuilder<InitRes>(
        future: futureInit,
        builder: (context, snapshot) {
          if(snapshot.hasData) {
            return Text(snapshot.data!.more.init.webView.invite);
          } else if(snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          return const CircularProgressIndicator();
        },
      )
    );

    return MaterialApp(
      title: "Flutter layout Demo",
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Flutter layout Demo'),
          ),
          body: ListView(
            children: [
              Image.asset(
                'images/lake.jpeg',
                width: 600,
                height: 240,
                fit: BoxFit.cover,
              ),
              titleSection,
              buttonSection,
              textSection,
            ],
          )),
    );
  }

  InkWell _buildButtonColumn(Color color, IconData icon, String label) {
    return InkWell(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: color),
            Container(
              margin: const EdgeInsets.only(top: 8),
              child: Text(
                label,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: color,
                ),
              ),
            )
          ],
        ),
        onTap: () { print("Container is Tapped"); },
    );
  }

}

Future<InitRes> fetchInit() async {
  final response = await http.get(Uri.parse(''));

  if(response.statusCode == 200) {
    return InitRes.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Fail to get response from server');
  }
}
