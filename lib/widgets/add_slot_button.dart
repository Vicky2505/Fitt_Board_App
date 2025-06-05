import 'package:flutter/material.dart';
import '../screens/add_slot_screen.dart';

class AddSlotButton extends StatelessWidget {
  const AddSlotButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton.icon(
        icon: const Icon(Icons.add),
        label: const Text('Add New Slot'),
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const AddSlotScreen()),
          );
        },
      ),
    );
  }
}
