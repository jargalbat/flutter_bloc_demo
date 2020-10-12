import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CubitRoute extends StatefulWidget {
  CubitRoute({Key key}) : super(key: key);

  @override
  _CubitRouteState createState() => _CubitRouteState();
}

class _CubitRouteState extends State<CubitRoute> {
  final _counterCubit = CounterCubit(0);
  var _testNum = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _counterCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cubit demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '${_counterCubit.state}',
              style: Theme.of(context).textTheme.headline4,
            ),
            Text(
              '$_testNum',
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
    final subscription = _counterCubit.listen(print);

    _counterCubit.increment();
    _testNum++;

    setState(() {
      //
    });

    await Future.delayed(Duration.zero);
    await subscription.cancel();
  }
}

/// CUBIT

class CounterCubit extends Cubit<int> {
  CounterCubit(int initialState) : super(initialState);

  void increment() {
    addError(Exception('increment error!'), StackTrace.current);
    emit(state + 1);
  }

  @override
  void onChange(Change<int> change) {
    print(change);
    super.onChange(change);
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    print('$error, $stackTrace');
    super.onError(error, stackTrace);
  }
}
