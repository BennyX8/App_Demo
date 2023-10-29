import 'dart:io';
import 'package:flutter/material.dart';
import 'package:app_demo/models/model.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductItemView extends StatelessWidget {
  final Product product;
  final Animation<double> animation;
  final void Function(Product)? onTap;

  const ProductItemView({
    Key? key,
    required this.product,
    required this.animation,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap!(product),
      child: FadeTransition(
        opacity: Tween<double>(
          begin: 0,
          end: 1,
        ).animate(animation),
        child: SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0, -0.1),
            end: Offset.zero,
          ).animate(animation),
          child: Container(
            margin: const EdgeInsets.all(5.0),
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
              border: Border.all(color: Colors.grey.shade300),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 20.0,
                  spreadRadius: 1,
                  offset: const Offset(1, 4),
                ),
              ],
            ),
            child: Column(
              children: [
                Expanded(
                  flex: 7,
                  child: SizedBox.square(
                    dimension: double.infinity,
                    child: Hero(
                      tag: product.image!,
                      child: Image.file(
                        File(product.image!),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                product.name ?? '',
                                softWrap: false,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: GoogleFonts.montserrat(
                                  fontSize: 12.0,
                                  color: Colors.grey.shade600,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),

                        //* Vertical Spacer
                        const SizedBox(height: 5.0),

                        SizedBox(
                          height: 30.0,
                          child: Row(
                            children: [
                              Expanded(
                                flex: 3,
                                child: Text(
                                  isPriceValid ? '\u20A6${product.price}' : '0',
                                  style: GoogleFonts.montserrat(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.orange,
                                  ),
                                ),
                              ),

                              SizedBox.square(
                                dimension: 35,
                                child: Material(
                                  borderRadius: BorderRadius.circular(30),
                                  clipBehavior: Clip.antiAlias,
                                  child: IconButton(
                                    style: FilledButton.styleFrom(
                                      backgroundColor: Colors.orange,
                                      foregroundColor: Colors.white,
                                    ),
                                    onPressed: () {
                                      //Add product to cart
                                    },
                                    icon: const Icon(
                                      Icons.add_shopping_cart_rounded,
                                      size: 18.0,
                                    ),
                                  ),
                                ),
                              ),
                              //* Horizontal Spacer
                              const SizedBox(width: 10),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  bool get isPriceValid {
    return double.tryParse('${product.price}') != null ? true : false;
  }
}
