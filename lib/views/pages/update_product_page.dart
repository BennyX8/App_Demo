import 'dart:io';

import 'package:app_demo/models/model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/app_dialog.dart';
import '../../core/constants.dart';
import '../../core/enum.dart';
import '../../core/widgets/app_bar.dart';
import '../../core/widgets/app_button.dart';
import '../../core/widgets/app_state_view.dart';
import '../../core/widgets/app_text_field.dart';
import '../../models/stored_media.dart';
import '../widgets/single_selection_media_grid_view.dart';

class UpdateProductPage extends StatefulWidget {
  final Product product;
  const UpdateProductPage({super.key, required this.product});

  static const route = '/update_product';

  @override
  State<UpdateProductPage> createState() => _UpdateProductPageState();
}

class _UpdateProductPageState extends State<UpdateProductPage> {
  String? selectedMedia;
  final titleController = TextEditingController();
  final costController = TextEditingController();
  final priceController = TextEditingController();

  @override
  void initState() {
    super.initState();

    titleController.text = widget.product.name ?? '';
    priceController.text = '${widget.product.price ?? ''}';
    costController.text = '${widget.product.cost ?? ''}';
    selectedMedia = widget.product.image;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: KAppBar(
          titleText: 'Edit Product',
          onPop: () => Navigator.pop(context),
          actionButtons: [
            Align(
              child: AppButton(
                height: 38.0,
                onPressed: () => onUpdateProduct(),
                text: 'Edit Product',
              ),
            ),
            w20
          ],
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 8.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppTextField(
                controller: titleController,
                hint: 'Name this product...',
                inputType: TextInputType.name,
                capitalization: TextCapitalization.words,
                inputAction: TextInputAction.next,
              ),

              AppTextField(
                controller: costController,
                inputType: TextInputType.number,
                hint: 'Cost Price',
              ),
              AppTextField(
                controller: priceController,
                inputType: TextInputType.number,
                hint: 'Selling Price',
              ),

              //* Vertical Spacer
              const SizedBox(height: 15.0),

              //* Media attachment zone
              selectedMedia == null
                  ? Container(
                      margin: const EdgeInsets.fromLTRB(12, 0, 12, 12),
                      height: 60.0,
                      decoration: BoxDecoration(
                        // color: Colors.white,
                        borderRadius: BorderRadius.circular(24.0),
                      ),
                      child: Material(
                        type: MaterialType.transparency,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            AppButton(
                              text: 'Upload Image',
                              icon: Icons.image,
                              onPressed: () => selectMedia(context),
                            ),
                          ],
                        ),
                      ),
                    )
                  : ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: SizedBox.square(
                        child: Image.file(
                          File(selectedMedia!),
                        ),
                      ),
                    )
            ],
          ),
        ));
  }

  void onUpdateProduct() {
    if (titleController.text.isEmpty) {
      showAppDialog(
        context,
        AppStateView(
          state: AppState.failed,
          message: 'Product name is required',
          onOK: () => Navigator.pop(context),
        ),
      );
    } else if (costController.text.isEmpty) {
      showAppDialog(
        context,
        AppStateView(
          state: AppState.failed,
          message: 'Cost price is required',
          onOK: () => Navigator.pop(context),
        ),
      );
    } else if (priceController.text.isEmpty) {
      showAppDialog(
        context,
        AppStateView(
          state: AppState.failed,
          message: 'Selling Price is required',
          onOK: () => Navigator.pop(context),
        ),
      );
    } else if (selectedMedia == null) {
      showAppDialog(
        context,
        AppStateView(
          state: AppState.failed,
          message: 'You must provide a an image of this product',
          onOK: () => Navigator.pop(context),
        ),
      );
    } else {
      Get.back(
        result: Product(
          id: widget.product.id!,
          name: titleController.text,
          cost: int.parse(costController.text),
          price: int.parse(priceController.text),
          image: selectedMedia!,
        ),
      );
    }
  }

  void selectMedia(BuildContext context) async {
    final StoredMedia? media = await showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      constraints: const BoxConstraints(
        minHeight: 240,
        maxHeight: 360,
      ),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
        topLeft: Radius.circular(12),
        topRight: Radius.circular(12.0),
      )),
      builder: (context) => const SingleSelectionMediaGrid(),
    );

    await Future.delayed(const Duration(milliseconds: 300));

    if (media != null) {
      selectedMedia = media.filePath;
      setState(() {});
    }
  }
}
