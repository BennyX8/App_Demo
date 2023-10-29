import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:app_demo/models/model.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class ProductController extends GetxController {
  List<Product> products = <Product>[].obs;
  bool loading = false;

  Future<void> getProducts() async {
    loading = true;
    update();

    final list = await Product().select().toList();
    for (final product in list) {
      if (!products.contains(product)) {
        products.add(product);
      }
    }
    loading = false;
    update();
  }

  Future<void> addProduct({
    required String name,
    required String cost,
    required String price,
    required String imagePath,
  }) async {
    final product = Product();
    product.name = name;
    product.cost = int.tryParse(cost) ?? 0;
    product.price = int.tryParse(price) ?? 0;
    product.image = imagePath;

    await product.save().then((id) async {
      final newProduct = await Product().getById(id);
      products.add(newProduct!);

      await Future.delayed(600.ms);
      update();
    });
  }

  void updateProduct(Product p) async {
    final product = Product();
    product.id = p.id;
    product.name = p.name;
    product.cost = p.cost ?? 0;
    product.price = p.price ?? 0;
    product.image = p.image;

    await product.upsert().then((id) async {
      final updated = await Product().getById(id);
      products.removeWhere((e) => e.id == id);
      products.add(updated!);

      await Future.delayed(600.ms);
      update();
    });
  }

  void deleteProduct(int id) async {
    await Product(id: id).delete().then((value) async {
      if (value.success) {
        products.removeWhere((e) => e.id == id);

        await Future.delayed(600.ms);
        update();
      }
    });
  }
}
