import 'package:cyborgs/model/product_model.dart';
import 'package:cyborgs/provider/product_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class ProductOperation {
  static String getTheLastId(BuildContext context) {
    ProductProvider productProvider =
        Provider.of<ProductProvider>(context, listen: false);
    print("the product List is :: ${productProvider.productList}");

    int lastIndex = (productProvider.productList.length==0)?0:productProvider.productList.length - 1;
    String lastId = (productProvider.productList.length == 0)
        ? "0"
        : productProvider.productList[lastIndex].id;
    String id = (int.parse(lastId) + 1).toString();
    print("the last id is :: $id");
    return id;
  }

  static List<Product> addNewItemToArray(
      BuildContext context, Product product) {
    ProductProvider productProvider =
        Provider.of<ProductProvider>(context, listen: false);
    List<Product> productList = productProvider.productList;
    productList.add(product);
    return productList;
  }
}
