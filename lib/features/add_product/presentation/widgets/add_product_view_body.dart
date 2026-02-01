import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fruti_hub_dashboard/features/add_product/domain/entities/product_entity.dart';
import 'package:fruti_hub_dashboard/features/add_product/presentation/widgets/app_text_field.dart';
import 'package:fruti_hub_dashboard/features/add_product/presentation/widgets/custom_check_box.dart';
import 'package:fruti_hub_dashboard/features/add_product/presentation/widgets/image_field.dart';
import 'package:fruti_hub_dashboard/features/dashboard/presentation/widgets/custom_button.dart';

class AddProductViewBody extends StatefulWidget {
  const AddProductViewBody({super.key});

  @override
  State<AddProductViewBody> createState() => _AddProductViewBodyState();
}

class _AddProductViewBodyState extends State<AddProductViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  late TextEditingController productNameController;
  late TextEditingController productPriceController;
  late TextEditingController productDescriptionController;
  late TextEditingController productCodeController;
  bool isFeatured = false;
  File? fileImage;
  @override
  void initState() {
    super.initState();
    productNameController = TextEditingController();
    productPriceController = TextEditingController();
    productDescriptionController = TextEditingController();
    productCodeController = TextEditingController();
  }

  @override
  void dispose() {
    productNameController.dispose();
    productPriceController.dispose();
    productDescriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: Form(
          key: formKey,
          autovalidateMode: autovalidateMode,
          child: Column(
            children: [
              AppTextField(
                hintText: 'Product Name',
                prefixIcon: const Icon(Icons.production_quantity_limits),
                keyboardType: TextInputType.text,
                controller: productNameController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter product name';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 16,
              ),
              AppTextField(
                hintText: 'Product Price',
                prefixIcon: const Icon(Icons.price_change),
                keyboardType: TextInputType.number,
                controller: productPriceController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter product price';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 16,
              ),
              AppTextField(
                hintText: 'Product Code',
                prefixIcon: const Icon(Icons.code),
                keyboardType: TextInputType.number,
                controller: productCodeController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter product code';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 16,
              ),
              AppTextField(
                hintText: 'Product Description',
                prefixIcon: const Icon(Icons.description),
                keyboardType: TextInputType.text,
                controller: productDescriptionController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter product description';
                  }
                  return null;
                },
                maxLines: 5,
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  CustomCheckBox(
                    isChecked: isFeatured,
                    onChecked: (value) {
                      setState(() {
                        isFeatured = value;
                      });
                    },
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  const Text(
                    'Featured Product',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              ImageField(
                onImagePicked: (image) {
                  setState(() {
                    fileImage = image;
                  });
                },
              ),
              const SizedBox(
                height: 16,
              ),

              CustomButton(
                text: 'Add Product',
                onPressed: () {
                  if (fileImage == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      showError(),
                    );
                    return;
                  }
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    ProductEntity(
                      name: productNameController.text,
                      description: productDescriptionController.text,
                      code: productCodeController.text.toLowerCase(),
                      price: double.parse(productPriceController.text),
                      isFeatured: isFeatured,
                      imageFile: fileImage!,
                      imageUrl: null,
                    );
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                  }
                },
              ),
              const SizedBox(
                height: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }

  SnackBar showError() {
    return SnackBar(
      backgroundColor: Colors.red,
      duration: const Duration(seconds: 2),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      content: const Text('Please pick an image'),
    );
  }
}
