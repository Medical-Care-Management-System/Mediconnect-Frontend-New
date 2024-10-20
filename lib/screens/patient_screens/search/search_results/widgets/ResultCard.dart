import 'package:flutter/material.dart';
import 'package:mediconnect/screens/patient_screens/search/book_appointments/BookAppointments.dart'; // Adjust the path as needed

class ResultCard extends StatelessWidget {
  final Map<String, dynamic> result;
  final String hospital;

  const ResultCard({
    super.key,
    required this.result, required this.hospital,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.person, color: Colors.black),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'Doctor: ${result['doctor']['First_name']}',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 5),
            Text(
              'Specialty: ${result['doctor']['Specialization']}',
              style: const TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 5),
            Text(
              'Medical Center: $hospital',
              style: const TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 5),
            Text(
              'Availability: ${result['doctor']['Availability']== true ? "Available":"Not Available"}',
              style: const TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.star, color: Colors.yellow[700]),
                    const SizedBox(width: 4),
                    Text(
                      '0',
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AppointmentPage(
                          doctorName: result['doctor']['First_name'],
                        ),
                      ),
                    );
                  },
                  child: const Text(
                    'Make Appointment',
                    style: TextStyle(color: Colors.black),
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
