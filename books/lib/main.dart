import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;


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
                count();
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
