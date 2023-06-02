import 'package:equatable/equatable.dart';

class PaginationState<Error, T, Extra> extends Equatable {
  final int page;
  final bool hasReachedToEnd;
  final bool isSuccess;
  final bool isEmpty;
  final bool isInProgress;
  final bool isPaginationInProgress;
  final bool isFailure;
  final bool isInternetError;
  final T? success;
  final Error? error;
  final Extra? extra;
  final int? totalLength;

  const PaginationState({
    this.page = 1,
    this.hasReachedToEnd = false,
    this.isSuccess = false,
    this.isEmpty = false,
    this.isInProgress = false,
    this.isPaginationInProgress = false,
    this.isFailure = false,
    this.isInternetError = false,
    this.success,
    this.error,
    this.extra,
    this.totalLength,
  });

  PaginationState<Error, T, Extra> copyWith({
    final int? page,
    final bool? hasReachedToEnd,
    final bool? isSuccess,
    final bool? isEmpty,
    final bool? isInProgress,
    final bool? isPaginationInProgress,
    final bool? isFailure,
    final bool? isInternetError,
    final T? success,
    final Error? error,
    final Extra? extra,
    final int? totalLength,
  }) {
    return PaginationState(
      page: page ?? this.page,
      hasReachedToEnd: hasReachedToEnd ?? false,
      isSuccess: isSuccess ?? false,
      isEmpty: isEmpty ?? false,
      isPaginationInProgress: isPaginationInProgress ?? false,
      isInProgress: isInProgress ?? false,
      isFailure: isFailure ?? false,
      isInternetError: isInternetError ?? false,
      success: success ?? this.success,
      error: error,
      extra: extra,
      totalLength: totalLength,
    );
  }

  @override
  List<Object?> get props {
    return [
      page,
      hasReachedToEnd,
      isSuccess,
      isEmpty,
      isInProgress,
      isFailure,
      isInternetError,
      isPaginationInProgress,
      success,
      error,
      extra,
      totalLength,
    ];
  }
}
