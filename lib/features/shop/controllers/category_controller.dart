import 'package:clothes/api/categories/api_categories.dart';
import 'package:clothes/api/categories/category_model.dart';
import 'package:clothes/data/models/category_model.dart';
import 'package:clothes/data/repositories/categories/category_repository.dart';
import 'package:clothes/util/constants/image_strings.dart';
import 'package:clothes/util/loaders/loaders.dart';
import 'package:clothes/util/popups/full_screen_loader.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController{
  static CategoryController get instance => Get.find();

  final isLoading = false.obs;
  final _categoryRepository = Get.put(CategoryRepository());
  RxList<CategoryModel> allCategories = <CategoryModel>[].obs;
  RxList<CategoryModel> featuredCategories = <CategoryModel>[].obs;

  // API
  RxList<Category> categories = <Category>[].obs;

  @override
  void onInit(){
    // fetchCategories();
    fetchCategoriesAPI();
    super.onInit();
  }

  Future<void> fetchCategories() async{
    try{
      TFullScreenLoader.openLoadingDialog('Load Data...', TImages.dockerAnimation);

      isLoading.value = true;

      final categories = await _categoryRepository.getAllCategories();

      allCategories.assignAll(categories);

      featuredCategories.assignAll(allCategories.where((category) => category.isFeatured && category.parentId.isEmpty).take(8).toList());
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      isLoading.value = false;
      TFullScreenLoader.stopLoading();
    }
  }

  Future<void> fetchCategoriesAPI() async{
    APICategories.fetchCategories().then((dataFromServer) async {
      try{
        isLoading.value = true;
        categories.assignAll(dataFromServer);

      } catch (e) {
        TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
      } finally {
        isLoading.value = false;
      }
    });
  }
}