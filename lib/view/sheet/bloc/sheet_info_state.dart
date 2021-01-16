part of 'sheet_info_bloc.dart';

@immutable
abstract class SheetInfoState {}

class SheetInfoInitial extends SheetInfoState {}

class LoadingDataError extends SheetInfoState {}

class LoadingDataSuccess extends SheetInfoState {
  List<Product> productList;
  LoadingDataSuccess({this.productList});
}

class LoadingDataFromApi extends SheetInfoState {}

