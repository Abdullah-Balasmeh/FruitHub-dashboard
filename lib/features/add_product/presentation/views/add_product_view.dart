import 'package:flutter/material.dart';
import 'package:fruti_hub_dashboard/core/utils/build_app_bar.dart';
import 'package:fruti_hub_dashboard/features/add_product/presentation/widgets/add_product_view_body.dart';

class AddProductView extends StatelessWidget {
  const AddProductView({super.key});
  static const String routeName = 'add_product_view';
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: buildAppBar(context: context, title: 'Add Product'),
        body: const SafeArea(
          child: AddProductViewBody(),
        ),
      ),
    );
  }
}
