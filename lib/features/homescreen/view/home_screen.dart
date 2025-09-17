import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const Icon(Icons.arrow_back, color: Colors.black),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(Icons.notifications_none, color: Colors.black),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Bar
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.grey[200],
                    ),
                    child: const TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.search, color: Colors.grey),
                        hintText: "Search for treatments",
                        hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  height: 45,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: const Center(
                    child: Text(
                      "Search",
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),

            // Sort By
            Row(
              children: [
                const Text(
                  "Sort by : ",
                  style: TextStyle(fontSize: 14, color: Colors.black),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade400),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Row(
                    children: const [
                      Text("Date", style: TextStyle(fontSize: 14)),
                      Icon(Icons.arrow_drop_down, size: 20),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),

            // List of bookings
            Expanded(
              child: ListView(
                children: [
                  bookingCard(
                    index: "1.",
                    name: "Vikram Singh",
                    package: "Couple Combo Package (Rejuven...",
                    date: "31/01/2024",
                    by: "Jithesh",
                  ),
                  bookingCard(
                    index: "2.",
                    name: "Vikram Singh",
                    package: "Couple Combo Package (Rejuven...",
                    date: "31/01/2024",
                    by: "Jithesh",
                  ),
                  bookingCard(
                    index: "3.",
                    name: "Vikram Singh",
                    package: "Couple Combo Package (Rejuven...",
                    date: "31/01/2024",
                    by: "Jithesh",
                    showRegister: true,
                  ),
                  lastBooking(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget bookingCard({
    required String index,
    required String name,
    required String package,
    required String date,
    required String by,
    bool showRegister = false,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.grey.shade100,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            index,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
          ),
          Text(
            name,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 2),
          Text(
            package,
            style: const TextStyle(
              color: Colors.green,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 6),
          Row(
            children: [
              const Icon(
                Icons.calendar_today,
                size: 16,
                color: Colors.redAccent,
              ),
              const SizedBox(width: 4),
              Text(date, style: const TextStyle(fontSize: 12)),
              const SizedBox(width: 12),
              const Icon(Icons.person, size: 16, color: Colors.brown),
              const SizedBox(width: 4),
              Text(by, style: const TextStyle(fontSize: 12)),
            ],
          ),
          const SizedBox(height: 6),
          if (showRegister)
            Container(
              width: double.infinity,
              height: 35,
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(6),
              ),
              child: const Center(
                child: Text(
                  "Register Now",
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
              ),
            )
          else
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  "View Booking details",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black54,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Icon(Icons.chevron_right, color: Colors.green),
              ],
            ),
        ],
      ),
    );
  }

  Widget lastBooking() {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.grey.shade100,
      ),
      child: Column(
        children: [
          Row(
            children: const [
              Icon(Icons.calendar_today, size: 16, color: Colors.redAccent),
              SizedBox(width: 4),
              Text("31/01/2024", style: TextStyle(fontSize: 12)),
              SizedBox(width: 12),
              Icon(Icons.person, size: 16, color: Colors.brown),
              SizedBox(width: 4),
              Text("Jithesh", style: TextStyle(fontSize: 12)),
            ],
          ),
          const SizedBox(height: 6),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                "View Booking details",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black54,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Icon(Icons.chevron_right, color: Colors.green),
            ],
          ),
        ],
      ),
    );
  }
}
