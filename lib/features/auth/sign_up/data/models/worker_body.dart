import 'package:freezed_annotation/freezed_annotation.dart';

part 'worker_body.g.dart';

@JsonSerializable()
class TechnicalWorkerRequest {
  final WorkerTypeRequest type;
  final int yearsOfExperience;
  final List<WorkerServiceRequest> workerServs;

  TechnicalWorkerRequest({
    required this.type,
    required this.yearsOfExperience,
    required this.workerServs,
  });

  factory TechnicalWorkerRequest.fromJson(Map<String, dynamic> json) => _$TechnicalWorkerRequestFromJson(json);
  Map<String, dynamic> toJson() => _$TechnicalWorkerRequestToJson(this);
}

@JsonSerializable()
class WorkerTypeRequest {
  final int id;

  WorkerTypeRequest({
    required this.id,
  });

  factory WorkerTypeRequest.fromJson(Map<String, dynamic> json) => _$WorkerTypeRequestFromJson(json);
  Map<String, dynamic> toJson() => _$WorkerTypeRequestToJson(this);
}

@JsonSerializable()
class WorkerServiceRequest {
  final int id;

  WorkerServiceRequest({
    required this.id,
  });

  factory WorkerServiceRequest.fromJson(Map<String, dynamic> json) => _$WorkerServiceRequestFromJson(json);
  Map<String, dynamic> toJson() => _$WorkerServiceRequestToJson(this);
}