import 'package:flutter/material.dart';


class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  final Color lightPink = const Color(0xFFFFF5F7);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightPink,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Dashboard Overview",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 20),
              Wrap(
                spacing: 12,
                runSpacing: 12,
                children: [
                  dashboardCard(
                    "Total Appointments",
                    "128",
                    "+14% from last month",
                    Icons.calendar_today,
                  ),
                  dashboardCard(
                    "Total Service Avail",
                    "18",
                    "+3 new this month",
                    Icons.assignment_turned_in,
                  ),
                  dashboardCard(
                    "Upcoming Schedule",
                    "7",
                    "+2 for this week",
                    Icons.schedule,
                  ),
                  dashboardCard(
                    "Total Discount Points",
                    "600",
                    "+8% from last month",
                    Icons.attach_money,
                  ),
                ],
              ),
              const SizedBox(height: 30),
              appointmentsCard(),
            ],
          ),
        ),
      ),
    );
  }

  static Widget dashboardCard(
      String title, String value, String subtitle, IconData icon) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 5, offset: Offset(0, 3)),
        ],
      ),
      child: Row(
        children: [
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: const TextStyle(fontSize: 12, color: Colors.black)),
                Text(value,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold)),
                Text(subtitle,
                    style: const TextStyle(fontSize: 10, color: Colors.green)),
              ],
            ),
          ),
          CircleAvatar(
            radius: 18,
            backgroundColor: Colors.pink.shade50,
            child: Icon(icon, color: Colors.pink),
          ),
        ],
      ),
    );
  }
  static Widget appointmentsCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Upcoming Appointments',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          appointmentCard(
            imageUrl: 'assets/staff2.jpg',
            name: 'George Adiz',
            service: 'Cleansing Facial',
            time: '10:00 AM',
            duration: '60 min',
          ),
          appointmentCard(
            imageUrl: 'assets/staff1.jpg',
            name: 'Daniel De Asis',
            service: "Glutathione IV Drip",
            time: '11:00 AM',
            duration: '30 min',
          ),
        ],
      ),
    );
  }

  // 📅 Appointment Card Design
  static Widget appointmentCard({
    required String imageUrl,
    required String name,
    required String service,
    required String time,
    required String duration,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.pink.shade50,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: AssetImage(imageUrl),
            radius: 24,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Text(
                  service,
                  style: const TextStyle(
                    color: Colors.black54,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.access_time_rounded,
                    color: Colors.pink,
                    size: 16,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    time,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Text(
                duration,
                style: const TextStyle(fontSize: 12),
              ),
            ],
          ),
        ],
      ),
    );
  }
}


