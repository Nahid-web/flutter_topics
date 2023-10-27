import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<DateTime> futureFn() async {
    await Future.delayed(
      const Duration(seconds: 2),
    );
    return DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Future Flutter'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                futureFn();
                setState(() {

                });
              },
              child: const Text('Refresh'),
            ),
            const SizedBox(height: 10,),
            FutureBuilder(
              future: futureFn(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else if (snapshot.connectionState == ConnectionState.done ||
                    snapshot.connectionState == ConnectionState.active) {
                  if (snapshot.hasError) {
                    return Text(snapshot.error.toString());
                  } else {
                    return Text(snapshot.data.toString());
                  }
                } else {
                  return const Text('Something wrong');
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
