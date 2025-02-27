import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'counter_model.dart';

class EvenOddDisplay extends StatelessWidget {
  const EvenOddDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    // 값이 바뀔때만 그려주는 것이 셀렉터
    return Selector<CounterModel, bool>(
      // 셀렉터의 값이 변경될 때만 EvenOddDisplay 위젯이 리빌드 됩니다.
      selector: (context, model) => model.counter % 2 == 0,
      builder: (context, isEven, child) {
        return Text(
          isEven ? '짝수' : '홀수',
          style: Theme.of(context).textTheme.headlineMedium,
        );
      },
    );
  }
}
