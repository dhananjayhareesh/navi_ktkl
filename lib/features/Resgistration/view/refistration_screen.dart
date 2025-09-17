import 'package:flutter/material.dart';

class RefistrationScreen extends StatefulWidget {
  const RefistrationScreen({super.key});

  @override
  State<RefistrationScreen> createState() => _RefistrationScreenState();
}

class _RefistrationScreenState extends State<RefistrationScreen> {
  String? selectedLocation;
  String? selectedBranch;
  String? selectedHour;
  String? selectedMinute;
  String paymentOption = "Cash";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const Icon(Icons.arrow_back, color: Colors.black),
        title: const Text(
          "Register",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(Icons.notifications_none, color: Colors.black),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            inputField("Name", "Enter your full name"),
            inputField("Whatsapp Number", "Enter your Whatsapp number"),
            inputField("Address", "Enter your full address"),

            // 📍 Location Dropdown
            label("Location"),
            dropdownField(
              value: selectedLocation,
              hint: "Choose your location",
              items: ["Kochi", "Trivandrum", "Calicut"],
              onChanged: (val) => setState(() => selectedLocation = val),
            ),

            // 🏢 Branch Dropdown
            label("Branch"),
            dropdownField(
              value: selectedBranch,
              hint: "Select the branch",
              items: ["Branch 1", "Branch 2", "Branch 3"],
              onChanged: (val) => setState(() => selectedBranch = val),
            ),

            // 🧾 Treatments
            label("Treatments"),
            treatmentCard(),
            const SizedBox(height: 8),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 12),
              decoration: BoxDecoration(
                color: Colors.green.shade100,
                borderRadius: BorderRadius.circular(6),
              ),
              child: const Center(
                child: Text(
                  "+ Add Treatments",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),

            inputField("Total Amount", ""),
            inputField("Discount Amount", ""),

            // 💳 Payment Options
            label("Payment Option"),
            Row(
              children: [
                paymentRadio("Cash"),
                const SizedBox(width: 16),
                paymentRadio("Card"),
                const SizedBox(width: 16),
                paymentRadio("UPI"),
              ],
            ),
            const SizedBox(height: 16),

            inputField("Advance Amount", ""),
            inputField("Balance Amount", ""),

            // 📅 Date Picker
            label("Treatment Date"),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(""),
                  Icon(Icons.calendar_today, color: Colors.green),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // ⏰ Time Dropdown
            label("Treatment Time"),
            Row(
              children: [
                Expanded(
                  child: dropdownField(
                    value: selectedHour,
                    hint: "Hour",
                    items: List.generate(12, (i) => "${i + 1}"),
                    onChanged: (val) => setState(() => selectedHour = val),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: dropdownField(
                    value: selectedMinute,
                    hint: "Minutes",
                    items: ["00", "15", "30", "45"],
                    onChanged: (val) => setState(() => selectedMinute = val),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),

            // ✅ Save Button
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 14),
              decoration: BoxDecoration(
                color: const Color(0xFF006837),
                borderRadius: BorderRadius.circular(6),
              ),
              child: const Center(
                child: Text(
                  "Save",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  // 🔹 Input Field
  Widget inputField(String labelText, String hintText) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        label(labelText),
        TextField(
          decoration: InputDecoration(
            hintText: hintText,
            filled: true,
            fillColor: Colors.grey.shade200,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: BorderSide.none,
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 14,
            ),
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  // 🔹 Label
  Widget label(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Text(
        text,
        style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
      ),
    );
  }

  // 🔹 Dropdown
  Widget dropdownField({
    required String? value,
    required String hint,
    required List<String> items,
    required void Function(String?) onChanged,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        // color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(6),
      ),
      child: DropdownButtonFormField<String>(
        value: value,
        isExpanded: true,
        decoration: const InputDecoration(border: InputBorder.none),
        hint: Text(hint),
        items: items
            .map((e) => DropdownMenuItem(value: e, child: Text(e)))
            .toList(),
        onChanged: onChanged,
        icon: const Icon(Icons.arrow_drop_down, color: Colors.green),
      ),
    );
  }

  // 🔹 Treatment Card
  Widget treatmentCard() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Expanded(
                child: Text(
                  "1.  Couple Combo package i...",
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.close, color: Colors.red),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const Text("Male", style: TextStyle(color: Colors.green)),
              const SizedBox(width: 6),
              numberBox("2"),
              const SizedBox(width: 16),
              const Text("Female", style: TextStyle(color: Colors.green)),
              const SizedBox(width: 6),
              numberBox("2"),
              const Spacer(),
              const Icon(Icons.edit, color: Colors.green),
            ],
          ),
        ],
      ),
    );
  }

  // 🔹 Small Number Box
  Widget numberBox(String number) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(number, style: const TextStyle(fontWeight: FontWeight.w600)),
    );
  }

  // 🔹 Payment Radio
  Widget paymentRadio(String value) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Radio<String>(
          value: value,
          groupValue: paymentOption,
          onChanged: (val) => setState(() => paymentOption = val!),
          activeColor: const Color(0xFF006837),
        ),
        Text(
          value,
          style: TextStyle(
            fontWeight: value == paymentOption
                ? FontWeight.bold
                : FontWeight.normal,
          ),
        ),
      ],
    );
  }
}
