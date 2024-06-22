import 'package:bloc_test/bloc_test.dart';
import 'package:coffee_app/business_logic/cubits/cubit/bottom_navigation_cubit.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('BottomNavigationCubit', () {
    late BottomNavigationCubit bottomNavigationCubit;

    setUp(() {
      bottomNavigationCubit = BottomNavigationCubit();
    });

    tearDown(() {
      bottomNavigationCubit.close();
    });

    test('initial state is BottomNavigationState.initial()', () {
      expect(bottomNavigationCubit.state, BottomNavigationState.initial());
    });

    blocTest<BottomNavigationCubit, BottomNavigationState>(
      'emits [BottomNavigationState(currentIndex: 1)] when changeIndex(1) is called',
      build: () => bottomNavigationCubit,
      act: (cubit) => cubit.changeIndex(1),
      expect: () => [const BottomNavigationState(currentIndex: 1)],
    );

    blocTest<BottomNavigationCubit, BottomNavigationState>(
      'emits [BottomNavigationState(currentIndex: 1), BottomNavigationState(currentIndex: 2)] when changeIndex is called multiple times',
      build: () => bottomNavigationCubit,
      act: (cubit) {
        cubit.changeIndex(1);
        cubit.changeIndex(2);
      },
      expect: () => [
        const BottomNavigationState(currentIndex: 1),
        const BottomNavigationState(currentIndex: 2),
      ],
    );

    blocTest<BottomNavigationCubit, BottomNavigationState>(
      'emits [BottomNavigationState(currentIndex: 0)] when changeIndex(0) is called after other indices',
      build: () => bottomNavigationCubit,
      act: (cubit) {
        cubit.changeIndex(1);
        cubit.changeIndex(2);
        cubit.changeIndex(0);
      },
      expect: () => [
        const BottomNavigationState(currentIndex: 1),
        const BottomNavigationState(currentIndex: 2),
        const BottomNavigationState(currentIndex: 0),
      ],
    );
  });
}
