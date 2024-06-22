part of 'bottom_navigation_cubit.dart';

class BottomNavigationState extends Equatable {
  final int currentIndex;

  const BottomNavigationState({required this.currentIndex});

  factory BottomNavigationState.initial() {
    return const BottomNavigationState(currentIndex: 0);
  }

  BottomNavigationState copyWith({
    int? currentIndex,
  }) {
    return BottomNavigationState(
      currentIndex: currentIndex ?? this.currentIndex,
    );
  }

  @override
  List<Object> get props => [currentIndex];
}
