import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Textstyles.dart';

class HoverOptionTile extends StatefulWidget {
  final String label;
  final bool isSelected;

  const HoverOptionTile({super.key, required this.label, this.isSelected = false});

  @override
  State<HoverOptionTile> createState() => _HoverOptionTileState();
}

class _HoverOptionTileState extends State<HoverOptionTile> {
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    final backgroundColor = _isHovering ? Colors.white : Colors.black;
    final textColor = _isHovering ? Colors.black : Colors.white;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovering = true),
      onExit: (_) => setState(() => _isHovering = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        margin: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(50),
          border: Border.all(color: Colors.white),
        ),
        child: Center(
          child: Text(
            widget.label,
            style: AppTextStyles.FONT21FW600BLACK(context).copyWith(color: textColor),
          ),
        ),
      ),
    );
  }
}
