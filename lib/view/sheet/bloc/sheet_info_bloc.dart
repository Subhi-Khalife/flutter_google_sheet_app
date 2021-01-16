import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cyborgs/api/product/delete_product_api.dart';
import 'package:cyborgs/api/product/get_product_api.dart';
import 'package:cyborgs/api/product/insert_product_api.dart';
import 'package:cyborgs/model/product_model.dart';
import 'package:cyborgs/provider/product_provider.dart';
import 'package:cyborgs/widget/loading_dialog.dart';
import 'file:///D:/projects/cyborgs/lib/classes/product/product_operation.dart';
import 'package:cyborgs/widget/show_message.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:provider/provider.dart';
import 'file:///D:/projects/cyborgs/lib/classes/product/get_new_product_detail.dart';
part 'sheet_info_event.dart';
part 'sheet_info_state.dart';

class SheetInfoBloc extends Bloc<SheetInfoEvent, SheetInfoState> {
  SheetInfoBloc() : super(SheetInfoInitial());

  @override
  Stream<SheetInfoState> mapEventToState(SheetInfoEvent event) async* {
    if (event is LoadingDataFromGoogleSheet) {
      yield LoadingDataFromApi();
      GetProductApi productManager = GetProductApi();
      try {
        List<Product> items = await productManager.getAllProduct();
        yield LoadingDataSuccess(productList: items);
      } catch (e) {
        yield LoadingDataError();
      }
    }
    if (event is DeleteDataFromGoogleSheet) {
      DeleteProductApi deleteProductApi=DeleteProductApi();
      final GlobalKey<State> _keyLoader = new GlobalKey<State>();

      LoadingDialog.showLoadingDialog(event.context, _keyLoader);

      List<Product> items = event.productList;
      try {

        bool value = await deleteProductApi.deleteProductById(event.product.id);

        Navigator.of(_keyLoader.currentContext, rootNavigator: true).pop();

        if (value) {
          items.remove(event.product);
          showMessage("Delete Success");
        } else {
          showMessage("Delete Failed");
        }
        yield LoadingDataSuccess(productList: items);
      } catch (e) {
        Navigator.of(_keyLoader.currentContext, rootNavigator: true).pop();
        showMessage("Delete Failed");
        yield LoadingDataSuccess(productList: items);
      }
    }
    if (event is AddNewProductToGoogleSheet) {
      InsertProductApi insertProductApi=InsertProductApi();
      yield LoadingDataFromApi();

      GetNewProductDetail getNewProductDetail = GetNewProductDetail();

      ProductProvider productProvider = Provider.of<ProductProvider>(event.context, listen: false);

      Product newProduct = getNewProductDetail.getNewProduct(event.context);

      final GlobalKey<State> _keyLoader = new GlobalKey<State>();

      LoadingDialog.showLoadingDialog(event.context, _keyLoader);

      bool val = await insertProductApi.insertNewProduct(newProduct);

      Navigator.of(_keyLoader.currentContext, rootNavigator: true).pop();

      if (val) {
        showMessage("Added Success");

        List<Product> items =
            ProductOperation.addNewItemToArray(event.context, newProduct);

        yield LoadingDataSuccess(productList: items);
      } else {
        showMessage("Added Failed");

        yield LoadingDataSuccess(productList: productProvider.productList);
      }
    }
  }
}
