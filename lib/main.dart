
import 'package:counter/streams/stream_counter.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  StreamCounter counter = StreamCounter();

  @override
  Widget build(BuildContext context) {
    print("Build again");

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Counter"),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
              height: 200,
              child: Center(
                child: StreamBuilder<int>(
                  stream: counter.stream(),
                  builder: (context, snapshot){
                    if(snapshot.connectionState == ConnectionState.waiting){
                      return CircularProgressIndicator();
                    }
                    return Text(
                      snapshot.data.toString(),
                      style: TextStyle(fontSize: 54.0),
                    );
                  } ,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 15.0),
                  child: MaterialButton(
                    child: Text("+"),
                    color: Colors.blue,
                    textColor: Colors.white,
                    onPressed: () => counter.add()
                  ),
                ),
                MaterialButton(
                  child: Text("-"),
                  color: Colors.blue,
                  textColor: Colors.white,
                  onPressed: () => counter.remove()
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}


