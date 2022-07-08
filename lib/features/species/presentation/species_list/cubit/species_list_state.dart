part of 'species_list_cubit.dart';

abstract class SpesciesListState extends Equatable {
  const SpesciesListState._();

  factory SpesciesListState.loading() => const Loading();
  factory SpesciesListState.error(String message) => Error(message);
  factory SpesciesListState.success(PagedResource<Species> speciesList) =>
      Success(speciesList);

  T returnWhen<T>(
      {required T Function() onLoading,
      required T Function(Error) onError,
      required T Function(Success) onSuccess}) {
    final currentState = this;
    if (currentState is Loading) return onLoading();
    if (currentState is Error) return onError(currentState);
    if (currentState is Success) return onSuccess(currentState);
    throw Exception("Unknown subtpe of SpesciesListState");
  }

  void doWhen(
      {  Function()? onLoading,
       Function(Error)? onError,
       Function(Success)? onSuccess}) {
    final currentState = this;
    if (currentState is Loading)  onLoading?.call();
    if (currentState is Error)  onError?.call(currentState);
    if (currentState is Success)  onSuccess?.call(currentState);
  }

  @override
  List<Object> get props => [];
}

class Loading extends SpesciesListState {
  const Loading() : super._();
}

class Error extends SpesciesListState {
  final String message;
  const Error(this.message) : super._();
  @override
  List<Object> get props => [message];
}

class Success extends SpesciesListState {
  final PagedResource<Species> speciesList;
  const Success(this.speciesList) : super._();

  @override
  List<Object> get props => [speciesList];
}
