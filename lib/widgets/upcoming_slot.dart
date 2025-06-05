import 'package:flutter/material.dart';

class UpcomingSlot extends StatelessWidget {
  final String time;

  const UpcomingSlot({super.key, required this.time});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.deepPurple.shade50,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            const Icon(Icons.schedule, size: 32, color: Colors.black),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                'Upcoming Slot: $time',
                style: const TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
