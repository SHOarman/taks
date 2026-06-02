import 'package:get/get.dart';
import '../data/models/product_model.dart';
import '../data/repositories/product_repository.dart';

class ProductController extends GetxController {
  final ProductRepository _repository;

  ProductController({ProductRepository? repository})
      : _repository = repository ?? ProductRepository();

 //======================================veribale-============================================
  var allProducts = <Product>[].obs;
  var filteredProducts = <Product>[].obs;
  var isLoading = false.obs;
  var isError = false.obs;
  var errorMessage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }
//====================================products==========================================================
  Future<void> fetchProducts() async {
    isLoading.value = true;
    isError.value = false;
    errorMessage.value = '';
    
    try {
      final products = await _repository.getProducts();
      allProducts.assignAll(products);
      filteredProducts.assignAll(products);
    } catch (e) {
      isError.value = true;
      errorMessage.value = e.toString().replaceAll('Exception: ', '');
    } finally {
      isLoading.value = false;
    }
  }


  void searchProducts(String query) {
    if (query.trim().isEmpty) {
      filteredProducts.assignAll(allProducts);
    } else {
      filteredProducts.assignAll(
        allProducts
            .where((product) =>
                (product.title ?? '')
                    .toLowerCase()
                    .contains(query.trim().toLowerCase()))
            .toList(),
      );
    }
  }
}
