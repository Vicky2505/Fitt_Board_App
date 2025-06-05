import 'package:flutter/material.dart';

class ProfileStatus extends StatelessWidget {
  final String status;

  const ProfileStatus({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    Color statusColor;

    switch (status.toLowerCase()) {
      case 'verified':
        statusColor = Colors.green;
        break;
      case 'pending':
        statusColor = Colors.orange;
        break;
      default:
        statusColor = Colors.grey;
    }

    return Row(
      children: [
        Text('Profile Status: ', style: Theme.of(context).textTheme.titleLarge),
        Text(
          status,
          style: TextStyle(
            color: statusColor,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}
