class StatusTrackState {
  final int currentStatus;

  StatusTrackState({
    this.currentStatus = 0,
  });

  StatusTrackState copyWith({
    int? currentStatus,
  }) {
    return StatusTrackState(
      currentStatus: currentStatus ?? this.currentStatus,
    );
  }
}