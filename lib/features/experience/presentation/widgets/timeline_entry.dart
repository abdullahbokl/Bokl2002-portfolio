import 'package:flutter/material.dart';

import '../../../../core/extensions/context_extensions.dart';
import '../../domain/experience_model.dart';
import 'timeline_card.dart';
import 'timeline_dot.dart';

class TimelineEntry extends StatefulWidget {
  const TimelineEntry({
    required this.experience,
    required this.isLast,
    super.key,
  });

  final ExperienceModel experience;
  final bool isLast;

  @override
  State<TimelineEntry> createState() => _TimelineEntryState();
}

class _TimelineEntryState extends State<TimelineEntry> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final accent = context.accent.accent;
    final isMobile = context.isMobile;
    final exp = widget.experience;

    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Timeline rail
            SizedBox(
              width: isMobile ? 40 : 56,
              child: TimelineDot(
                isHovered: _hovered,
                isLeadership: exp.isLeadership,
                accent: accent,
                isLast: widget.isLast,
              ),
            ),
            // Content card
            Expanded(
              child: TimelineCard(
                experience: exp,
                isHovered: _hovered,
                accent: accent,
                isMobile: isMobile,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
