import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:home4u/features/profile/data/models/get_projects_response_model.dart';

part 'profile_state.freezed.dart';

@freezed
class ProfileState<T> with _$ProfileState<T> {
  const factory ProfileState.initial() = ProfileInitial;


}
