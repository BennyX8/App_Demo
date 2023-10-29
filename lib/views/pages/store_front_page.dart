import 'package:app_demo/controller/product_controller.dart';
import 'package:app_demo/core/widgets/app_bar.dart';
import 'package:app_demo/models/model.dart';
import 'package:auto_animated/auto_animated.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../core/route_builder.dart';
import '../widgets/product_item_card.dart';
import 'add_product_page.dart';
import 'product_detail_page.dart';

class StoreFrontPage extends StatelessWidget {
  StoreFrontPage({super.key});

  final ProductController productController =
      Get.put(ProductController()..getProducts());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: KAppBar(
        titleText: 'DemoStore',
        spacing: 0.0,
        leadingView: const Icon(
          FontAwesomeIcons.store,
          color: Colors.orange,
        ),
      ),
      body: GetX<ProductController>(
        init: productController,
        builder: (controller) {
          return LiveGrid.options(
            options: options,
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.7,
            ),
            itemCount: controller.products.length,
            itemBuilder: (context, index, animation) {
              return ProductItemView(
                product: controller.products[index],
                animation: animation,
                onTap: (p0) async {
                  final data = await Get.to(
                    () => ProductDetailPage(
                      product: p0,
                    ),
                  );

                  if (data is Product) {
                    controller.updateProduct(data);
                  } else if (data is int) {
                    controller.deleteProduct(data);
                  }
                },
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () async {
          final data = await Navigator.push(
              context,
              KRoute(
                child: const AddProductPage(),
              ));

          await productController.addProduct(
            name: data.$1,
            cost: data.$2,
            price: data.$3,
            imagePath: data.$4,
          );
        },
      ),
    );
  }

  final refreshController = RefreshController();

  final options = const LiveOptions(
    // Start animation after (default zero)
    delay: Duration(milliseconds: 100),

    // Show each item through (default 250)
    showItemInterval: Duration(milliseconds: 200),

    // Animation duration (default 250)
    showItemDuration: Duration(milliseconds: 300),

    // Animations starts at 0.05 visible
    // item fraction in sight (default 0.025)
    visibleFraction: 0.05,

    // Repeat the animation of the appearance
    // when scrolling in the opposite direction (default false)
    // To get the effect as in a showcase for ListView, set true
    reAnimateOnVisibility: false,
  );
}
