import '../models/product_model.dart';
import '../providers/api_provider.dart';

class ProductRepository {
  final ApiProvider _apiProvider;

  ProductRepository({ApiProvider? apiProvider})
      : _apiProvider = apiProvider ?? ApiProvider();

  Future<List<Product>> getProducts() {
    return _apiProvider.fetchProducts();
  }

  Future<List<Product>> getProductsByCategory(String category) {
    return _apiProvider.fetchProductsByCategory(category);
  }

  Future<List<String>> getCategories() {
    return _apiProvider.fetchCategories();
  }
}
