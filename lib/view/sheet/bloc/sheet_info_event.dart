part of 'sheet_info_bloc.dart';

@immutable
abstract class SheetInfoEvent {}

class LoadingDataFromGoogleSheet extends SheetInfoEvent {}


class DeleteDataFromGoogleSheet extends SheetInfoEvent {
  Product product;
  List<Product>productList;
  BuildContext context;
  DeleteDataFromGoogleSheet({this.product,this.productList,this.context});
}

class AddNewProductToGoogleSheet extends SheetInfoEvent{
  BuildContext context;
  AddNewProductToGoogleSheet({this.context});
}