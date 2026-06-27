import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/subject_provider.dart';

class SummaryScreen extends StatelessWidget {
  const SummaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SubjectProvider>(
      builder: (context, provider, child) {
        return Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _SummaryCard(
                label: 'Total subjects',
                value: '${provider.totalSubjects}',
              ),
              _SummaryCard(
                label: 'Average mark',
                value: provider.averageMark.toStringAsFixed(1),
              ),
              _SummaryCard(
                label: 'Overall grade',
                value: provider.overallGrade,
              ),
              _SummaryCard(
                label: 'Passing subjects',
                value: '${provider.passingSubjects.length}',
              ),
            ],
          ),
        );
      },
    );
  }
}

class _SummaryCard extends StatelessWidget {
  final String label;
  final String value;

  const _SummaryCard({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(label),
        trailing: Text(
          value,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
    );
  }
}
