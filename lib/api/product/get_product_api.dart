import 'package:cyborgs/model/product_model.dart';
import 'package:cyborgs/api/product/initial_product_api.dart';
class GetProductApi extends InitialProductApi{
  Future<List<Product>> getAllProduct() async {
    await init();
    final products = await productSheet.values.map.allRows();
    if (products == null) {
      List<Product> pr = List<Product>();
      return pr;
    }
    return products.map((json) => Product.fromGsheets(json)).toList();
  }

}