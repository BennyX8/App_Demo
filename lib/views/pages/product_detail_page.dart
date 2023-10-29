
import 'dart:io';
import 'package:app_demo/models/model.dart';
import 'package:app_demo/views/pages/update_product_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/constants.dart';
import '../../core/widgets/app_bar.dart';

class ProductDetailPage extends StatefulWidget {
  final Product product;
  const ProductDetailPage({Key? key, required this.product}) : super(key: key);

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage>
    with TickerProviderStateMixin {
  AnimationController? _animationController;

  bool loading = false;
  bool loadingCart = false;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      appBar: KAppBar(
        titleText: '',
        uiOverlayStyle: SystemUiOverlayStyle.light,
        elevatePop: true,
        popColor: Colors.white,
        onPop: () => Navigator.pop(context),
        actionButtons: [
          CircleAvatar(
            backgroundColor: Colors.black.withOpacity(0.7),
            child: IconButton(
              onPressed: () async {
                Get.back(result: widget.product.id);
              },
              icon: const Icon(
                Icons.delete,
                color: Colors.white,
              ),
            ),
          ),
          w10,
          CircleAvatar(
            backgroundColor: Colors.black.withOpacity(0.7),
            child: IconButton(
              onPressed: () async {
                final data = await Get.to(
                  () => UpdateProductPage(product: widget.product),
                );

                if (data != null) {
                  Get.back(result: data!);
                }
              },
              icon: const Icon(
                FontAwesomeIcons.penToSquare,
                size: 18.0,
                color: Colors.white,
              ),
            ),
          ),
          w10,
        ],
      ),
      body: Column(
        children: [
          SizedBox.square(
            dimension: MediaQuery.of(context).size.width,
            child: Hero(
              tag: widget.product.image ?? '',
              child: Image.file(
                File(widget.product.image ?? ''),
                fit: BoxFit.cover,
              ),
            ),
          ),

          //* Vertical Spacer
          // const SizedBox(height: 15.0),

          // Product Title
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                Expanded(
                  flex: 5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              widget.product.name ?? '',
                              style: GoogleFonts.montserrat(
                                color: Colors.grey.shade700,
                                fontSize: 22.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),

                      // //* Vertical Spacer
                      // const SizedBox(height: 8.0),
                    ],
                  ),
                ),

                //* Horizontal Spacer
                const SizedBox(width: 10.0),

                // Text(widget.product??'')
              ],
            ),
          ),

          //* Vertical Spacer
          const SizedBox(height: 10.0),

          //* Price and Action Button
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //* Product Price
                Expanded(
                  child: SizedBox(
                    child: Text(
                      '\u20A6${widget.product.price}',
                      style: GoogleFonts.montserrat(
                        fontSize: 28.0,
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                //* Horizontal Spacer
                const SizedBox(width: 20.0),

                //* Add To Card Button
                SizedBox(
                  width: 120,
                  height: 48.0,
                  child: MaterialButton(
                    elevation: 8.0,
                    color: Theme.of(context).primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    child: const Text(
                      'Add to Cart',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: () {},
                  ),
                )
              ],
            ),
          ),

          h10,
          const Divider(),

          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                children: [
                  //* Vertical Spacer
                  const SizedBox(height: 35.0),

                  //* Product Description
                  ExpansionTile(
                    initiallyExpanded: true,
                    expandedAlignment: Alignment.topLeft,
                    backgroundColor: Colors.transparent,
                    title: Text(
                      'Description',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.grey.shade600,
                      ),
                    ),
                    children: const [
                      Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 10.0,
                          horizontal: 20.0,
                        ),
                        child: Text(
                          'Description',
                          // textAlign: TextAlign.justify,
                        ),
                      )
                    ],
                  ),

                  //* Vertical Spacer
                  const SizedBox(height: 80.0),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  String getInventory(String count) {
    double.tryParse(count) ?? 0.0;

    return 'Product available';
  }

  @override
  void dispose() {
    _animationController!.dispose();
    super.dispose();
  }
}
