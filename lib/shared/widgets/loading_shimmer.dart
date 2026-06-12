import 'package:flutter/material.dart';

class LoadingShimmer extends StatefulWidget {
  final double width;
  final double height;
  final ShapeBorder? shape;

  const LoadingShimmer({
    Key? key,
    this.width = double.infinity,
    this.height = 10,
    this.shape,
  }) : super(key: key);

  @override
  State<LoadingShimmer> createState() => _LoadingShimmerState();
}

class _LoadingShimmerState extends State<LoadingShimmer>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      decoration: ShapeDecoration(
        shape: widget.shape ?? const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(4)),
        ),
        color: Colors.grey[300],
      ),
    );
  }
}

class LoadingShimmerList extends StatelessWidget {
  final int itemCount;
  final double itemHeight;

  const LoadingShimmerList({
    Key? key,
    this.itemCount = 5,
    this.itemHeight = 80,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: itemCount,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: LoadingShimmer(height: itemHeight),
      ),
    );
  }
}
