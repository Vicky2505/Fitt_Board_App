import 'package:flutter/material.dart';

class EarningsCard extends StatelessWidget {
  final String amount;

  const EarningsCard({super.key, required this.amount});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.deepPurple[100],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            const Icon(Icons.attach_money, size: 33, color: Colors.deepPurple),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Earnings This Week',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: Colors.deepPurple[800],
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  amount,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple[800],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
