import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/favorites_controller.dart';
import '../../../data/models/product_model.dart';
import '../../product_details/product_details_screen.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final FavoritesController favController = Get.find<FavoritesController>();

  ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return GestureDetector(
      onTap: () => Get.to(() => ProductDetailsScreen(product: product)),
      child: Container(
        decoration: BoxDecoration(
          color: theme.colorScheme.surface,
          borderRadius: BorderRadius.circular(20.0),
          boxShadow: [
            BoxShadow(
              color: theme.shadowColor.withOpacity(0.04),
              blurRadius: 15,
              offset: const Offset(0, 8),
            ),
          ],
          border: Border.all(
            color: theme.colorScheme.outlineVariant.withOpacity(0.4),
            width: 1,
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Product Image
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(12),
                  color: theme.colorScheme.surfaceVariant.withOpacity(0.2),
                  width: double.infinity,
                  child: Image.network(
                    product.image ?? '',
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: theme.colorScheme.surfaceVariant,
                        child: Icon(
                          Icons.image_not_supported_rounded,
                          color: theme.colorScheme.onSurfaceVariant,
                          size: 32,
                        ),
                      );
                    },
                  ),
                ),
              ),
              // Title and Price
              Padding(
                padding: const EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 4.0),
                child: Text(
                  product.title ?? '',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    height: 1.2,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Text(
                  '\$${product.price?.toStringAsFixed(2) ?? '0.00'}',
                  style: theme.textTheme.titleMedium?.copyWith(
                    color: theme.colorScheme.primary,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              // Rating and Favorite Button
              Padding(
                padding: const EdgeInsets.fromLTRB(12.0, 4.0, 6.0, 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.star_rounded,
                          color: Colors.amber,
                          size: 18,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '${product.rating?.rate ?? 0.0}',
                          style: theme.textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    // Favorite Icon (Reactive via Obx)
                    Obx(() {
                      bool isFav = favController.isFavorite(product.id!);
                      return Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () => favController.toggleFavorite(product.id!),
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            padding: const EdgeInsets.all(6),
                            child: Icon(
                              isFav ? Icons.favorite_rounded : Icons.favorite_border_rounded,
                              color: isFav ? Colors.redAccent : theme.colorScheme.onSurfaceVariant.withOpacity(0.6),
                              size: 22,
                            ),
                          ),
                        ),
                      );
                    }),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
