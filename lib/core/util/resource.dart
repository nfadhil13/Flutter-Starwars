import 'base_exception.dart';

abstract class Resource<T> {
  Resource._();

  void whenWithResult({
    Function(T data)? success,
    Function(BaseException exception)? error,
  }) {
    if (this is Success<T>) {
      if (success != null) success((this as Success<T>).data);
    } else if (this is Error) {
      if (error != null) error((this as Error<T>).exception);
    }
  }

  factory Resource.success({required T data}) {
    return Success(data: data);
  }

  factory Resource.error({required BaseException exception}) {
    return Error<T>(exception: exception);
  }
}

class Success<T> extends Resource<T> {
  final T data;

  Success({required this.data}) : super._();
}

class Error<T> extends Resource<T> {
  final BaseException exception;

  Error({required this.exception}) : super._();
}

class PagedResource<T> {
  final List<T> data;
  final int currentPage;
  final bool hasNextPage;

  const PagedResource(
      {required this.data,
      required this.currentPage,
      required this.hasNextPage});

  factory PagedResource.start() {
    return const PagedResource(data: [], currentPage: 0, hasNextPage: true);
  }
}
