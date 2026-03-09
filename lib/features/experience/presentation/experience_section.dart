import 'package:flutter/material.dart';

import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/app_text_styles.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/extensions/context_extensions.dart';
import '../data/experience_data.dart';
import 'widgets/timeline_entry.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    final accent = context.accent.accent;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppStrings.experienceSectionTitle,
          style: AppTextStyles.h2(context).copyWith(color: accent),
        ),
        const SizedBox(height: 8),
        Text(
          AppStrings.experienceSectionSubtitle,
          style: AppTextStyles.body(
            context,
          ).copyWith(color: AppColors.textSecondary),
        ),
        const SizedBox(height: 32),
        ...List.generate(ExperienceData.experiences.length, (index) {
          final exp = ExperienceData.experiences[index];
          final isLast = index == ExperienceData.experiences.length - 1;
          // Show "Education" divider before the first education entry
          final showEducationDivider =
              exp.isEducation &&
              (index == 0 ||
                  !ExperienceData.experiences[index - 1].isEducation);
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (showEducationDivider) ...[
                const SizedBox(height: 24),
                Padding(
                  padding: const EdgeInsets.only(left: 40, bottom: 16),
                  child: Row(
                    children: [
                      Icon(Icons.school_outlined, color: accent, size: 20),
                      const SizedBox(width: 8),
                      Text(
                        'EDUCATION',
                        style: AppTextStyles.caption(context).copyWith(
                          color: accent,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 2,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
              TimelineEntry(experience: exp, isLast: isLast),
            ],
          );
        }),
      ],
    );
  }
}
