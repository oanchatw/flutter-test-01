import 'package:abc12/Repository.dart';
import 'package:abc12/widgets/text1.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:io';

class SpeedTest {
  static var imgUrls = [
    'https://i.imgur.com/zhfCcCc.jpeg',
    "https://i.imgur.com/59g233g.jpeg",
    "https://i.imgur.com/fUR65SN.png"
  ];

  static List<Map<String, dynamic>> result = [];

  static void testSpeed() {
    compute(Future.wait<int>, imgUrls.map((s) => downloadImg(s))).then((v) {
      debugPrint("result: $v");
      set(v);
    });
  }

  static void set(List<int> timeDiffs) {
    List<MapEntry<int, int>> indxWithTime = [];

    timeDiffs.forEach((t) {
      indxWithTime.add(MapEntry(indxWithTime.length, t));
    });

    indxWithTime.sort((v1, v2) => v1.value - v2.value);

    result = indxWithTime.map((a) => genObj(imgUrls[a.key], a.value)).toList();

    debugPrint("speed result : $result");
  }

  static List<Map<String, dynamic>> get() => result;

  static Map<String, dynamic> genObj(String domain, int timeElape) =>
      {"domain": domain, "time": timeElape};

  static Future<int> downloadImg(String domain) =>
      timeDiff(() => dlImg(domain));

  static Future<void> dlImg(String url) async {
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      debugPrint("img DL $url succeed ");
    } else {
      debugPrint("img DL $url failed: ${response.statusCode}");
    }
  }

  Future<void> downloadImage(String url, String savePath) async {
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      File file = File(savePath);
      await file.writeAsBytes(response.bodyBytes);
      print("Image downloaded to $savePath");
    } else {
      print("Failed to download image: ${response.statusCode}");
    }
  }

  static Future<int> timeDiff(Future<void> Function() execute) async {
    DateTime startTime = DateTime.now();

    await execute();

    DateTime endTime = DateTime.now();

    return endTime.difference(startTime).inMilliseconds;
  }
}

void main() {
  SpeedTest.testSpeed();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Fslutter Demo Home xxxx bb Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  @override
  void initState() {
    super.initState();
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: FutureBuilder(
            future: Repository.getCloths(),
            builder: (ctx, snapshot) =>
                snapshot.hasData && snapshot.data!.isNotEmpty
                    ? ListView.builder(
                        itemBuilder: (ctx, id) =>
                            ClothView(cloth: snapshot.data![id]),
                        itemCount: snapshot.data!.length,
                      )
                    : const CircularProgressIndicator()),
      );
}
