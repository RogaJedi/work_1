abstract class StatusTrackEvent {}

class InitializeTrackStatus extends StatusTrackEvent {}

class UpdateTrackStatus extends StatusTrackEvent {
  final int status;
  UpdateTrackStatus(this.status);
}