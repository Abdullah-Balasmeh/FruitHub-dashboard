import 'package:flutter/material.dart';
import 'package:fruti_hub_dashboard/features/add_product/presentation/views/add_product_view.dart';
import 'package:fruti_hub_dashboard/features/dashboard/presentation/widgets/custom_button.dart';

class DashboardViewBody extends StatelessWidget {
  const DashboardViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          const Text('Dashboard View Body'),
          CustomButton(
            text: 'Add Product',
            onPressed: () {
              Navigator.pushNamed(context, AddProductView.routeName);
            },
          ),
        ],
      ),
    );
  }
}
