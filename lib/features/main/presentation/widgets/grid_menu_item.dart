import 'dart:ui';

class GridMenuItem {
  GridMenuItem({
    required this.title,
    required this.image,
    required this.onTap,
  });

  final String title;
  final String image;
  final VoidCallback onTap;
}
