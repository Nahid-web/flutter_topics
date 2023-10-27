import 'package:flutter/material.dart';
import 'package:future_expain/second_page.dart';
import 'package:http/http.dart' as http;

class ExplainFuture extends StatefulWidget {
  const ExplainFuture({super.key});

  @override
  State<ExplainFuture> createState() => _ExplainFutureState();
}

class _ExplainFutureState extends State<ExplainFuture> {
  @override
  void initState() {
    myFuturePackage();
    // delayTrans();
    // getUserDetails();
    super.initState();
  }
  //my future package
  myFuturePackage() async{
    //creating my own future
    Future future = Future(() {
      print('Whats up');
      return 'Nahid Amin';
    });
    // future.then((value) => debugPrint(value)).catchError((err)=> debugPrint(err));
    try{
     await Future.error(throw Exception('Some internal error '));
    } catch(err){
      print(err);
    }

    Future.value(future);

  }

  //Future delay
 /* delayTrans() {
    //delay 2 seconds
    Future.delayed(
      const Duration(seconds: 2),
      () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const  SecondPage()),
        );
      },
    );
  }*/

  //async....await
  /* getUserDetails() async{
    const url = "https://jsonplaceholder.typicode.com/users";
    late http.Response res;
    try{
      res = await http.get(Uri.parse(url));
      print(res.body);
    } catch(err){
      print(err);
    }

    return res.body;

  }*/

  //then ....catch error
  /*getUserDetails(){
    const url = "https://jsonplaceholder.typicode.com/users";
    //get value using then
    http.get(Uri.parse(url)).then((value) => print(value.body)).catchError((err) => print(err));
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Explain Future'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text('Home Page'),
      ),
    );
  }
}
