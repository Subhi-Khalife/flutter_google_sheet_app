import 'package:cyborgs/model/product_model.dart';
import 'package:cyborgs/api/product/initial_product_api.dart';

class InsertProductApi extends InitialProductApi {
  Future<bool> insertNewProduct(Product product) async {
    await init();
    return productSheet.values.map.insertRowByKey(
      product.id,
      product.toGsheets(),
      appendMissing: true,
    );
  }
}
