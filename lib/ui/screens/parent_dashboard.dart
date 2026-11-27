import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:school_companion/data/auth_provider.dart';
import 'package:school_companion/data/school_provider.dart';
import 'package:school_companion/models/app_exception.dart';

class ParentDashboardScreen extends ConsumerWidget {
  const ParentDashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // hardcoded Id becaaaaaause this is a demo
    const studentId = 'std_001';
    final attendanceData = ref.watch(studentAttendanceProvider(studentId));
    final gradesData = ref.watch(studentGradesProvider(studentId));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Parent Dashboard'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout_rounded),
            onPressed: () => ref.read(authNotifierProvider.notifier).logout(),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Student Header Card
            const Card(
              color: Colors.indigo,
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.white24,
                      child: Icon(Icons.person, color: Colors.white, size: 36),
                    ),
                    SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Alex Doe',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Grade 5A • St. Jude Academy',
                          style: TextStyle(color: Colors.white70),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Today\'s Attendance Status',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),

            // Attendance Section
            attendanceData.when(
              data: (att) => Card(
                elevation: 2,
                child: ListTile(
                  leading: const CircleAvatar(
                    backgroundColor: Colors.green,
                    child: Icon(Icons.check, color: Colors.white),
                  ),
                  title: Text(
                    'Status: ${att.status.name.toUpperCase()}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                  subtitle: Text('Marked at ${att.date}'),
                ),
              ),
              error: (err, stack) => _buildErrorCard(context, () {
                ref.refresh(studentAttendanceProvider(studentId));
              }, err),
              loading: () => const Center(child: CircularProgressIndicator()),
            ),

            const SizedBox(height: 24),
            const Text(
              'Academic Performance (Term 1)',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),

            // Grades Section
            gradesData.when(
              data: (grades) => Column(
                children: grades
                    .map(
                      (g) => Card(
                        elevation: 2,
                        child: ListTile(
                          title: Text(
                            g.subject,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text('Term: ${g.term}'),
                          trailing: Chip(
                            label: Text(
                              '${g.score.toInt()}% [Grade ${g.grade}]',
                            ),
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
              error: (err, stack) => _buildErrorCard(context, () {
                ref.refresh(studentGradesProvider(studentId));
              }, err),
              loading: () => const Center(child: CircularProgressIndicator()),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildErrorCard(
    BuildContext context,
    VoidCallback onRetry,
    Object err,
  ) {
    if (err is NetworkException) {
      return Card(
        color: Colors.red.shade50,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              const Icon(Icons.wifi_off, color: Colors.red),
              const SizedBox(width: 12),
              Expanded(child: Text(err.message)),
              ElevatedButton(
                onPressed: onRetry, // 🌟 Clean VoidCallback!
                child: const Text('Retry'),
              ),
            ],
          ),
        ),
      );
    }
    return Text(err.toString());
  }
}
