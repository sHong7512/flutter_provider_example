import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ref : https://terry1213.github.io/flutter/flutter-provider/
class ProviderScreen extends StatelessWidget {
  const ProviderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /// Counter에 대한 Provider 생성
    return ChangeNotifierProvider<Counter>(
      create: (_) => Counter(),
      child: Scaffold(
        body: Center(
          /*
          child: ElevatedButton(
            child: Text(
              '현재 숫자: ${Provider.of<Counter>(context).count}',
              //'현재 숫자: ${context.watch<Counter>().count}', /// watch 사용. Provider.of<Counter>(context)와 동일
            ),
            onPressed: () {
              Provider.of<Counter>(context, listen: false).increment();
              //context.read<Counter>().increment(); /// read 사용. Provider.of<Counter>(context, listen: false)와 동일
            },
          ),
           */
          /// 한 클래스에서 provider를 생성, 소비 둘다 하게되면 에러 발생. Consumer를 사용해야 한다.
          child: Consumer<Counter>(
            builder: (_, counter, __) => ElevatedButton(
              child: Text(
                '현재 숫자: ${counter.count}',
              ),
              onPressed: () {
                counter.increment();
              },
            ),
          ),
        ),
      ),
    );
  }
}

class Counter extends ChangeNotifier {
  int _count = 0;

  int get count => _count;

  void increment() {
    _count++;
    notifyListeners();
  }
}