class CustomNotificationState {
  final bool isVisible;

  CustomNotificationState({this.isVisible = false});

  CustomNotificationState copyWith({bool? isVisible}) {
    return CustomNotificationState(
      isVisible: isVisible ?? this.isVisible,
    );
  }
}