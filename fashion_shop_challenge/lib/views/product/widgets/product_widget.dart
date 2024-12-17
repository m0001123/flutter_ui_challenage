import 'package:fashion_shop_challenge/models/product_model.dart';
import 'package:flutter/material.dart';

class ProductWidget extends StatefulWidget {
  const ProductWidget({
    super.key,
    required this.product,
  });
  final Product product;

  @override
  State<ProductWidget> createState() => _ProductWidgetState();
}

class _ProductWidgetState extends State<ProductWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
    if (mounted) _controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
              color: Theme.of(context).colorScheme.onSurface, width: 0.5)),
      child: Column(
        children: [
          //商品圖片
          Expanded(
              flex: 5,
              child: SizedBox(
                width: double.infinity,
                child: FadeTransition(
                    opacity: _animation,
                    child: Image.asset(widget.product.imglist[0],
                        fit: BoxFit.cover)),
              )),
          //商品資訊
          Expanded(
              flex: 1,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Text(
                            overflow: TextOverflow.ellipsis,
                            widget.product.name,
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.onSurface,
                                fontSize: 14),
                          ),
                        ),
                        GestureDetector(
                            onTap: () {},
                            child: Icon(
                              widget.product.isfavorite
                                  ? Icons.bookmark_sharp
                                  : Icons.bookmark_outline,
                              size: 18,
                            )),
                      ],
                    ),
                    Text('NT\$ ${widget.product.price}'),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
