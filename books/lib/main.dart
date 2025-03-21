import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:async/async.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Annisa Fitriani Rizky',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const FuturePage(),
    );
  }
}

class FuturePage extends StatefulWidget {
  const FuturePage({super.key});

  @override
  State<FuturePage> createState() => _FuturePageState();
}

class _FuturePageState extends State<FuturePage> {
  String result = '';
  bool isLoading = false;
  late Completer completer;

  void returnFG() {
    FutureGroup<int> futureGroup = FutureGroup<int>();
    futureGroup.add(returnOneAsync());
    futureGroup.add(returnTwoAsync());
    futureGroup.add(returnThreeAsync());
    futureGroup.close();  
    futureGroup.future.then((List<int> value) {
      int total = 0;
      for (var element in value) {
        total += element;
      }
      setState(() {
        result = value.toString();
      });
    });
  }
  
  Future getNumber() {
  completer = Completer<int>();
  calculate();
  return completer.future;
  }
  
  Future calculate() async {
  await Future.delayed(const Duration(seconds : 5));
  completer.complete(42);
  }

  Future<int> returnOneAsync() async {
  await Future.delayed(const Duration(seconds: 3));
  return 1;
  }
  
  Future<int> returnTwoAsync() async {
  await Future.delayed(const Duration(seconds: 3));
  return 2;
  }
  
  Future<int> returnThreeAsync() async {
  await Future.delayed(const Duration(seconds: 3));
  return 3;
  }

  Future count () async {
    int total = 0;
    total = await returnOneAsync();
    total += await returnTwoAsync();
    total += await returnThreeAsync();
    setState(() {
      result = total.toString();
    });
  }

  Future<Response> fetchData() async {
    const authority = 'www.googleapis.com';
    const path = '/books/v1/volumes/39B4zwEACAAJ';
    Uri url = Uri.https(authority, path);
    return http.get(url);
  }

  calculate2() async {
    try {
      await Future.delayed(const Duration(seconds: 5));
      completer.complete(42);
    } catch (e) {
      completer.completeError(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Back From Future'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                //(Prak 4)
                returnFG();

                //(Prak 3)
                //getNumber().then((value) {
                  //setState(() {
                    //result = value.toString();
                    //});
                  //}).catchError((e) {
                    //result = 'An error occurred';
                //});

                //(Prak 3)
                //getNumber().then((value) {
                  //setState(() {
                    //result = value.toString();
                  //});
                //});

                //(Prak 2)
                //count();

                //(Prak 1)
                //setState(() {
                  //isLoading = true;
                //}); 
                //fetchData().then((value) {
                  //setState(() {
                    //result = value.body.toString().substring(0, 450);
                    //isLoading = false;
                    //});
                    //}).catchError((_) {
                      //setState(() {
                        //result = 'An error occurred';
                        //isLoading = false;  
                      //});
                    //});
                  },
                  child: const Text('Go!'),
                ),
            const Spacer(),
            Text(result),
            const CircularProgressIndicator(),
            //isLoading ? const CircularProgressIndicator() : const SizedBox.shrink(),
            const Spacer(),
          ],
        ),
      ), 
    );
  }
}
