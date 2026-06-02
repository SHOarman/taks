import 'package:get/get.dart';
import '../utils/local_storage.dart';

class FavoritesController extends GetxController {
  var favoriteIds = <String>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadFavorites();
  }

 //-==============================================load favorites==========================
  void loadFavorites() async {
    List<String> savedFavs = await LocalStorageService.getFavorites();
    favoriteIds.assignAll(savedFavs);
  }

  // Toggle favorite status of a product
  void toggleFavorite(int productId) async {
    String id = productId.toString();
    if (favoriteIds.contains(id)) {
      favoriteIds.remove(id);
    } else {
      favoriteIds.add(id);
    }
   //==============================chnge add local storage==============================
    await LocalStorageService.saveFavorites(favoriteIds);
  }

 //=======================================favorite secation=====================================
  bool isFavorite(int productId) {
    return favoriteIds.contains(productId.toString());
  }
}
