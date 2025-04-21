import 'package:flutter/material.dart';

class CaliTrackerAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final String subtitle;
  final List<Widget> actions;
  final Widget? extraContent;
  final Widget? leading;
  final double? height;
  final Function()? onLeadingPressed;

  const CaliTrackerAppBar({
    Key? key,
    required this.title,
    this.subtitle = '',
    this.actions = const [],
    this.extraContent,
    this.leading,
    this.height,
    this.onLeadingPressed,
  }) : super(key: key);

  @override
  Size get preferredSize {
    // If a custom height is provided, use it
    if (height != null) return Size.fromHeight(height!);

    // Otherwise calculate based on content
    double baseHeight = 80; // Base height for app bar with title
    if (subtitle.isNotEmpty) baseHeight += 20;
    if (extraContent != null) baseHeight += 80; // Add more space for extra content

    return Size.fromHeight(baseHeight);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top + 10,
        left: 24,
        right: 24,
        bottom: 24,
      ),
      decoration: BoxDecoration(
        color: Colors.indigo
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Top row with title and actions
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  // Leading widget (like back button)
                  if (leading != null)
                    GestureDetector(
                      onTap: onLeadingPressed,
                      child: leading!,
                    ),

                  // Title
                  Text(
                    title,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),

              // Action buttons
              Row(children: actions),
            ],
          ),

          // Subtitle if provided
          if (subtitle.isNotEmpty) ...[
            SizedBox(height: 4),
            Text(
              subtitle,
              style: TextStyle(color: Colors.white.withOpacity(0.8)),
            ),
          ],

          // Extra content from page
          if (extraContent != null)
            extraContent!,
        ],
      ),
    );
  }
}