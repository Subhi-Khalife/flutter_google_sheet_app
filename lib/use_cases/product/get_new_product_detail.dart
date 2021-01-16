import 'package:cyborgs/model/product_model.dart';
import 'package:cyborgs/provider/product_provider.dart';
import 'package:cyborgs/use_cases/product/product_operation.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class GetNewProductDetail {
  Product getNewProduct(BuildContext context) {
    ProductProvider productProvider = Provider.of<ProductProvider>(context, listen: false);
    String time = DateFormat('yyyy-MM-dd \n kk:mm').format(DateTime.now());
    Product product = Product(
      id: ProductOperation.getTheLastId(context),
      email: productProvider.emailController.text,
      mobile: productProvider.mobileController.text,
      modelNumber: productProvider.modelNumberController.text,
      purchaseDate: time,
      name: productProvider.nameController.text,
    );
    return product;
  }
}
