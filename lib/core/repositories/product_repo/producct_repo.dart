import 'package:fruti_hub_dashboard/features/add_product/domain/entities/product_entity.dart';

abstract class ProductRepo {
  Future<void> addProduct(ProductEntity product);
}
