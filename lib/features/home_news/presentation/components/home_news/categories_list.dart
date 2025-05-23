import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:digital_news/core/constants/app_colors.dart';
import 'category_chip.dart';

class CategoriesList extends StatelessWidget {
  final List<String> categories;
  final ValueNotifier<String> selectedCategoryNotifier;
  final Function(String) onCategorySelected;

  const CategoriesList({
    Key? key,
    required this.categories,
    required this.selectedCategoryNotifier,
    required this.onCategorySelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          return ValueListenableBuilder<String>(
            valueListenable: selectedCategoryNotifier,
            builder: (context, selectedCategory, _) {
              final isSelected = category == selectedCategory;
              return CategoryChip(
                category: category,
                isSelected: isSelected,
                onTap: () => onCategorySelected(category),
              );
            },
          );
        },
      ),
    );
  }
}
