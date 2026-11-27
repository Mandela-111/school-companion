import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:school_companion/data/auth_provider.dart';

class TeacherDashboardScreen extends ConsumerWidget {
  const TeacherDashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final students = ['Alex Doe', 'Sarah Jenkins', 'Michael Smith', 'Emma Watson'];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Teacher Attendance'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout_rounded),
            onPressed: () => ref.read(authNotifierProvider.notifier).logout(),
          ),
        ],
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Card(
              child: ListTile(
                title: Text('Grade 5A: Daily Checklist', style: TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Text('Tap to mark student status for today'),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: students.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                  child: ListTile(
                    leading: CircleAvatar(child: Text('#${index + 1}')),
                    title: Text(students[index]),
                    trailing: Switch(value: true, onChanged: (val) {}),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: FilledButton.icon(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Attendance Submitted Successfully!')),
                );
              },
              icon: const Icon(Icons.check_circle_outline),
              label: const Text('Submit Attendance'),
            ),
          ),
        ],
      ),
    );
  }
}