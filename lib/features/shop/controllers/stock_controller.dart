import 'package:clothes/api/stocks/api_stocks.dart';
import 'package:clothes/api/stocks/stock_model.dart';
import 'package:clothes/data/models/cart_model.dart';
import 'package:clothes/features/shop/screens/product_details/product_detail.dart';
import 'package:clothes/util/constants/image_strings.dart';
import 'package:clothes/util/loaders/loaders.dart';
import 'package:clothes/util/popups/full_screen_loader.dart';
import 'package:get/get.dart';

class StockController extends GetxController{
  static StockController get instance => Get.find();

  var stock = Stock().obs;
  var selectedColor = 0.obs;
  var colorName = ''.obs;
  var selectedSize = 0.obs;
  var sizeName = ''.obs;
  var quantity = 0.obs;

  reset(){
    selectedColor = 0.obs;
    selectedSize = 0.obs;
    quantity = 0.obs;
  }

  fetchStockAPI(String idProduct) async{
    try {
      TFullScreenLoader.openLoadingDialog('Đang tải dữ liệu...', TImages.dockerAnimation);
      stock.value = await APIStocks.fetchStockByProductId(idProduct);
      TFullScreenLoader.stopLoading();
      Get.to(() => ProductDetailScreen(stock: stock.value));
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Hết hàng', message: 'Vui lòng quay lại sau');
      TFullScreenLoader.stopLoading();
    }
  }

  Cart? convertToCartItem(Stock stock){
    try{
      if(selectedSize.value == 0){
        TLoaders.customToast(message: 'Vui lòng chọn kích thước');
        return null;
      }
      if(selectedColor.value == 0){
        TLoaders.customToast(message: 'Vui lòng chọn màu');
        return null;
      }
      if(quantity.value == 0){
        TLoaders.customToast(message: 'Vui lòng chọn số lượng');
        return null;
      }
      return Cart(
          idProduct: stock.product!.id,
          idColor: selectedColor.value,
          idSize: selectedSize.value,
          productName: stock.product!.name,
          sizeName: sizeName.value,
          colorName: colorName.value,
          quantity: quantity.value,
          picture: stock.product!.picture,
          unitPrice: stock.product!.unitPrice,
          brand: stock.cateName
      );
    } catch (e){
      TLoaders.errorSnackBar(title: 'Lỗi');
      return null;
    }

  }

}