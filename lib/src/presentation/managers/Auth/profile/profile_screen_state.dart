import 'package:tracking_app/src/domain/entities/DriverData.dart';

sealed class ProfileScreenState {
  const ProfileScreenState();
}

class ProfileScreenLoading extends ProfileScreenState {
  const ProfileScreenLoading();
}

class ProfileScreenLoaded extends ProfileScreenState {
  final DriverEntity? user;
  const ProfileScreenLoaded({required this.user});
}

class ProfileScreenError extends ProfileScreenState {
  final Exception message;
  const ProfileScreenError(this.message);
}
