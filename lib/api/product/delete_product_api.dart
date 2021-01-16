import 'package:cyborgs/model/product_model.dart';
import 'package:cyborgs/api/product/initial_product_api.dart';

class DeleteProductApi extends InitialProductApi {
  Future<bool> deleteProductById(String id) async {
    await init();
    final index = await productSheet.values.rowIndexOf(id);
    if (index > 0) {
      return productSheet.deleteRow(index);
    }
    return false;
  }
}
