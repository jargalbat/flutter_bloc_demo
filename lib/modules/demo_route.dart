import 'package:flutter/material.dart';

class DemoRoute extends StatefulWidget {
  DemoRoute({Key key}) : super(key: key);

  @override
  _DemoRouteState createState() => _DemoRouteState();
}

class _DemoRouteState extends State<DemoRoute> {
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
        tooltip: 'onPressedBtn',
        child: Icon(Icons.add),
      ),
    );
  }

  void _onPressedBtn() async {
    //
  }
}
