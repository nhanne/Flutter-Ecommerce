import 'package:clothes/api/products/api_products.dart';
import 'package:clothes/api/products/product_model.dart';
import 'package:clothes/util/loaders/loaders.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  static ProductController get instance => Get.find();

  final isLoading = false.obs;

  // API
  RxList<Product> products = <Product>[].obs;
  final RxString selectedSortOption = 'Name'.obs;

  @override
  Future<void> onInit() async {
    await fetchProductsAPI();
    super.onInit();
  }

  Future<void> fetchProductsAPI() async {
    await APIProducts.fetchProducts().then((dataFromServer) async {
      try {
        isLoading.value = true;
        products.assignAll(dataFromServer);
      } catch (e) {
        TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
      } finally {
        isLoading.value = false;
      }
    });
  }

  String getProductStockStatus(int stock) {
    return stock > 0 ? 'In Stock' : 'Out of Stock';
  }

  void sortProducts(String sortOption) {
    selectedSortOption.value = sortOption;
    switch (sortOption) {
      case 'Name':
        products.sort(
            (a, b) => a.infoProduct!.name!.compareTo(b.infoProduct!.name!));
        break;
      case 'Higher Price':
        products.sort((a, b) =>
            b.infoProduct!.unitPrice!.compareTo(a.infoProduct!.unitPrice!));
        break;
      case 'Lower Price':
        products.sort((a, b) =>
            a.infoProduct!.unitPrice!.compareTo(b.infoProduct!.unitPrice!));
        break;
      case 'Newest':
        products.sort((a, b) =>
            a.infoProduct!.stockInDate!.compareTo(b.infoProduct!.stockInDate!));
        break;
      case 'Sale':
        products.sort((a, b) {
          if (b.infoProduct!.sale! > 0) {
            return b.infoProduct!.sale!.compareTo(a.infoProduct!.sale!);
          } else if (a.infoProduct!.sale! > 0) {
            return -1;
          } else {
            return 1;
          }
        });
        break;
      default:
        products.sort(
            (a, b) => a.infoProduct!.name!.compareTo(b.infoProduct!.name!));
    }
  }
}
