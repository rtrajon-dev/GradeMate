import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/subject_provider.dart';

class SubjectListScreen extends StatelessWidget {
  const SubjectListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SubjectProvider>(
      builder: (context, provider, child) {
        final subjects = provider.subjects;

        if (subjects.isEmpty) {
          return Center(
            child: Text(
              'No subjects yet. Add one!',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          );
        }

        return ListView.builder(
          itemCount: subjects.length,
          itemBuilder: (context, index) {
            final subject = subjects[index];
            return Dismissible(
              key: ValueKey(subject.id),
              direction: DismissDirection.endToStart,
              onDismissed: (_) =>
                  context.read<SubjectProvider>().removeSubject(subject.id),
              background: Container(
                color: Theme.of(context).colorScheme.errorContainer,
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Icon(
                  Icons.delete,
                  color: Theme.of(context).colorScheme.onErrorContainer,
                ),
              ),
              child: ListTile(
                title: Text(subject.name),
                subtitle: Text('Mark: ${subject.mark}'),
                trailing: Text(
                  subject.grade,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
            );
          },
        );
      },
    );
  }
}
