import 'package:cyborgs/model/product_model.dart';
import 'package:flutter/cupertino.dart';

class ProductProvider extends ChangeNotifier {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController idController = TextEditingController();
  TextEditingController pursheDateController = TextEditingController();
  TextEditingController modelNumberController = TextEditingController();
  List<Product> productList = List<Product>();

  void initValue() {
    nameController = TextEditingController();
    emailController = TextEditingController();
    mobileController = TextEditingController();
    idController = TextEditingController();
    pursheDateController = TextEditingController();
    modelNumberController = TextEditingController();
  }

  void setNewProductListArray({List<Product> productList}) {
    this.productList = productList;
  }
}
