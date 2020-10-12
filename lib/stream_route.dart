import 'package:flutter/material.dart';

class StreamRoute extends StatefulWidget {
  StreamRoute({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _StreamRouteState createState() => _StreamRouteState();
}

class _StreamRouteState extends State<StreamRoute> {
  int _sum = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stream demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'sum $_sum',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _onPressedBtn,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }

  void _onPressedBtn() async {
    print('started');
    var val = 0;

    /// Option 1
//    Stream<int> stream = countStream(10);
//    int sum = await sumStream(stream);

    /// Option 2
    val = await sumStream(countStream(10));
    setState(() {
      _sum = val;
    });

    print('sum $_sum');
    print('ended');
  }

  Stream<int> countStream(int max) async* {
    print('countStream started');
    for (int i = 0; i < max; i++) {
      print('countStream $i');
      yield i;
    }
    print('countStream finished');
  }

  Future<int> sumStream(Stream<int> stream) async {
    print('sumStream started');
    int sum = 0;
    await for (int value in stream) {
      print('sumStream $value');
      sum += value;
    }
    print('sumStream finished');
    return sum;
  }
}
