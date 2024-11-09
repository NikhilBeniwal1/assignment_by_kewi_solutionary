import 'package:flutter/material.dart';

class ComplaintTrackingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back),
        title: Text("Complaint Tracking", style: TextStyle(fontWeight: FontWeight.bold)),
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
              child: Stack(
                children: [
                  // Continuous dotted line from top to bottom
                  Positioned(
                    left: 12, // Aligns with icons
                    top: 0,
                    bottom: 0,
                    child: DottedLine(
                      color: Colors.green,
                    ),
                  ),
                  // Timeline items
                  ListView(
                    children: [
                      buildTimelineItem(
                        icon: Icons.report_problem,
                        iconColor: Colors.blue,
                        title: "Complaint Raised",
                        time: "On Mon, 12 Mar At 2:32 pm",
                        content: "Preferred Date/Time:\n12 Mar, 2024 07:00 PM",
                      ),
                      buildComplaintDetails(
                        title: "Air Conditioning",
                        subtitle: "Low Cooling",
                        images: [
                          'assets/images/ac1.png',
                          'assets/images/ac1.png',
                        ],
                      ),
                      buildTimelineItem(
                        icon: Icons.assignment_turned_in,
                        iconColor: Colors.orange,
                        title: "Task Assigned",
                        time: "On Mon, 12 Mar At 3:15 pm",
                      ),
                      buildStaffInfo(
                        name: "Ramesh Jadhav",
                        details: "On Mon, 12 Mar\nRamesh Jadhav will address your complaint at 6 pm.\nWe’ll try to resolve within the below preferred time:\n16 Mar, 2024 07:00 PM",
                      ),
                      buildTimelineItem(
                        icon: Icons.location_on,
                        iconColor: Colors.blue,
                        title: "Staff On Site",
                        time: "On Mon, 12 Mar At 5:45 pm",
                        content: "Complaint is in progress",
                      ),
                      buildTimelineItem(
                        icon: Icons.check_circle,
                        iconColor: Colors.green,
                        title: "Complaint Resolved",
                        time: "On Mon, 12 Mar At 6:30 pm",
                        content: "Issue successfully resolved",
                      ),
                    ],
                  ),

                ],
              ),
            ),
            InkWell(
              onTap: (){// Add feedback action
                },
              child: Image.asset("assets/images/feedback.png"),
            ),

            SizedBox(height: 8),
            Text(
              "Your Feedback, Our Fuel for Improvement!",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTimelineItem({
    required IconData icon,
    required Color iconColor,
    required String title,
    required String time,
    String? content,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Icon(icon, color: iconColor),
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
      ),
    );
  }

  Widget buildComplaintDetails({
    required String title,
    required String subtitle,
    required List<String> images,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        //crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
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
            ],),
          ),

        ],
      ),
    );
  }

  Widget buildStaffInfo({required String name, required String details}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundColor: Colors.orange,
            child: Image.asset("assets/images/staff.png"),
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

class DottedLine extends StatelessWidget {
  final Color color;

  const DottedLine({required this.color});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Column(
          children: List.generate((constraints.maxHeight / 4).floor(), (index) {
            return Container(
              width: 2,
              height: 4,
              color: index % 2 == 0 ? color : Colors.transparent,
            );
          }),
        );
      },
    );
  }
}
