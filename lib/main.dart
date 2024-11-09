import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ComplaintTrackingPage(),
    );
  }
}

class ComplaintTrackingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Complaint Tracking"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "It usually takes about 4 hours to finish this job.",
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView(
                children: [
                  buildTimelineItem(
                    context,
                    icon: Icons.report_problem,
                    iconColor: Colors.blue,
                    title: "Complaint Raised",
                    time: "On Mon, 12 Mar At 2:32 pm",
                    content: "Preferred Date/Time:\n12 Mar, 2024 07:00 PM",
                  ),
                  buildComplaintDetails(
                    context,
                    title: "Air Conditioning",
                    subtitle: "Low Cooling",
                    images: [
                      'assets/ac1.jpg',
                      'assets/ac2.jpg',
                    ],
                  ),
                  buildTimelineItem(
                    context,
                    icon: Icons.assignment_turned_in,
                    iconColor: Colors.orange,
                    title: "Task Assigned",
                    time: "On Mon, 12 Mar At 3:15 pm",
                  ),
                  buildStaffInfo(
                    context,
                    name: "Ramesh Jadhav",
                    details: "On Mon, 12 Mar\nRamesh Jadhav will address your complaint at 6 pm.\nWe’ll try to resolve within the below preferred time:\n16 Mar, 2024 07:00 PM",
                  ),
                  buildTimelineItem(
                    context,
                    icon: Icons.location_on,
                    iconColor: Colors.blue,
                    title: "Staff On Site",
                    time: "On Mon, 12 Mar At 5:45 pm",
                    content: "Complaint is in progress",
                  ),
                  buildTimelineItem(
                    context,
                    icon: Icons.check_circle,
                    iconColor: Colors.green,
                    title: "Complaint Resolved",
                    time: "On Mon, 12 Mar At 6:30 pm",
                    content: "Issue successfully resolved",
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // Add feedback action
              },
              child: Text("Give Us Feedback"),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 16),
              ),
            ),
            SizedBox(height: 8),
            Text(
              "Your Feedback, Our Fuel for Improvement!",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTimelineItem(BuildContext context,
      {required IconData icon,
        required Color iconColor,
        required String title,
        required String time,
        String? content}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Icon(icon, color: iconColor),
            Container(
              width: 2,
              height: 60,
              color: Colors.green,
            ),
          ],
        ),
        SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              SizedBox(height: 4),
              Text(time, style: TextStyle(color: Colors.grey)),
              if (content != null) ...[
                SizedBox(height: 8),
                Text(content, style: TextStyle(color: Colors.black)),
              ],
            ],
          ),
        ),
      ],
    );
  }

  Widget buildComplaintDetails(BuildContext context,
      {required String title, required String subtitle, required List<String> images}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: TextStyle(fontSize: 16, color: Colors.blue)),
          Text(subtitle, style: TextStyle(color: Colors.grey)),
          SizedBox(height: 8),
          Row(
            children: images
                .map((image) => Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Image.asset(
                image,
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
            ))
                .toList(),
          ),
        ],
      ),
    );
  }

  Widget buildStaffInfo(BuildContext context, {required String name, required String details}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundColor: Colors.orange,
            child: Icon(Icons.person, color: Colors.white),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(height: 8),
                Text(details),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
