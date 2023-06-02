import 'package:equatable/equatable.dart';

class DataState<Error, Success, Extra> extends Equatable {
  const DataState({
    this.isInProgress = false,
    this.isFailure = false,
    this.isSuccess = false,
    this.error,
    this.data,
    this.extra,
  });

  final bool isInProgress;
  final bool isFailure;
  final bool isSuccess;
  final Error? error;
  final Success? data;
  final Extra? extra;

  DataState<Error, Success, Extra> copyWith({
    bool? isInProgress,
    bool? isFailure,
    bool? isSuccess,
    Error? error,
    Success? data,
    Extra? extra,
  }) {
    return DataState<Error, Success, Extra>(
      isInProgress: isInProgress ?? false,
      isFailure: isFailure ?? false,
      isSuccess: isSuccess ?? false,
      error: error,
      data: data ?? this.data,
      extra: extra ?? this.extra,
    );
  }

  @override
  List<Object?> get props => [
        isInProgress,
        isFailure,
        isSuccess,
        error,
        data,
        extra,
      ];
}
