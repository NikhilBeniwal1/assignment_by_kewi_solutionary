import 'package:flutter/material.dart';
import 'package:flutter_dash/flutter_dash.dart';

class ComplaintTrackingPage extends StatefulWidget {
  @override
  State<ComplaintTrackingPage> createState() => _ComplaintTrackingPageState();
}

class _ComplaintTrackingPageState extends State<ComplaintTrackingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back),
        title: Text("Complaint Tracking", style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(

          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              decoration: BoxDecoration(color: Color.fromRGBO(245, 245, 245, 1)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Text(
                      "It usually takes about 4 hours to finish this job.",
                      style: TextStyle(fontSize: 18, color: Color.fromRGBO(126, 126, 126, 1)),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView(
                children: [
                  Stack(
                    children: [
                      // Continuous dotted line with a fixed height
                      Positioned(
                        left: 28, // Aligns with icons
                        top: 20,
                        bottom: 0,
                        child: DottedLine(
                          color: Colors.green,
                          height: 280, // Adjust height as needed
                        ),
                      ),
                      // Timeline items
                      Column(
                        children: [
                          buildTimelineItem(
                            iconUrl: "assets/images/complaint_raised.png",
                            iconColor: Color.fromRGBO(4, 195, 224, 1),
                            title: "Complaint Raised",
                            time: "On Mon, 12 Mar\nAt 2:32 pm",
                            content: "Preferred Date/Time:\n12 Mar, 2024 07:00 PM",
                          ),
                          buildComplaintDetails(
                            title: "Air Conditioning",
                            subtitle: "Low Cooling",
                            images: [
                              'assets/images/ac1.png',
                              'assets/images/ac1.png',
                              'assets/images/ac1.png',
                              'assets/images/ac1.png',
                              'assets/images/ac1.png',
                              'assets/images/ac1.png',
                            ],
                          ),
                          buildTimelineItem(
                            iconUrl: "assets/images/task_assigned.png",
                            iconColor: Color.fromRGBO(235, 106, 2, 1),
                            title: "Task Assigned",
                            time: "On Mon, 12 Mar\nAt 3:15 pm",
                          ),
                          buildStaffInfo(
                            name: "Ramesh Jadhav",
                            date: "On Mon, 12 Mar",
                          address_person: "Ramesh Jadhav will address your complaint at 6 pm.",
                            try_to_resolve: "We’ll try to resolve within the below preferred time:\n16 Mar, 2024 07:00 PM",

                          ),
                          buildTimelineItem(
                            iconUrl: "assets/images/staff.png",
                            iconColor: Colors.blue,
                            title: "Staff On Site",
                            time: "On Mon, 12 Mar\nAt 5:45 pm",
                            content: "Complaint is in progress",
                          ),
                          buildTimelineItem(
                            iconUrl: "assets/images/complaint_resolve.png",
                            iconColor: Colors.green,
                            title: "Complaint Resolved",
                            time: "On Mon, 12 Mar\nAt 6:30 pm",
                            content: "Issue successfully resolved",
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Image.asset("assets/images/feedback.png"),
                  Text(
                    "Your Feedback, Our Fuel for Improvement!",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.black),
                  ),
                  SizedBox(height: 16),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTimelineItem({
    required String iconUrl,
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
              CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.transparent,
                  child: Image.asset(iconUrl)),
            ],
          ),
          SizedBox(width: 16),
          Flexible(
            child: Container(
              decoration: BoxDecoration(
                color: Color.fromRGBO(245, 245, 245, 1),
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
              padding: EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(fontWeight: FontWeight.w100, fontSize: 16, color: iconColor),
                  ),
                  SizedBox(height: 4),
                  Text(time, style: TextStyle(color: Colors.black, fontSize: 12)),
                  if (content != null) ...[
                    SizedBox(height: 8),
                    Text(content, style: TextStyle(color: Colors.black)),
                  ],
                ],
              ),
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
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: Colors.transparent,
          ),
          SizedBox(width: 16),
          Flexible(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Color.fromRGBO(245, 245, 245, 1),
              ),
              padding: EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 16,
                      color: Color.fromRGBO(4, 195, 224, 1),
                      fontWeight: FontWeight.w100,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    subtitle,
                    style: TextStyle(color: Colors.black),
                  ),
                  SizedBox(height: 8),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: images.map((image) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Image.asset(
                              image,
                              width: 100,
                              height: 100,
                             // fit: BoxFit.cover,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }


  Widget buildStaffInfo({
    required String name,
    required String date,
    required String try_to_resolve,
    required String address_person ,

  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: Colors.transparent,
          ),
          SizedBox(width: 16),
          Flexible(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(12),
              ),
              padding: EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SizedBox(width: 5),
                      Image.asset("assets/images/profile_icon.png", height: 50, width: 50),
                      SizedBox(width: 5),
                      Text(name, style: TextStyle(fontWeight: FontWeight.w100, fontSize: 16)),
                      Spacer(),
                      Image.asset("assets/images/call_icon.png", height: 50, width: 50),
                      SizedBox(width: 5),
                    ],
                  ),
                  Dash(
                    direction: Axis.horizontal,
                    length: MediaQuery.of(context).size.width * 0.75,
                    dashColor: Colors.grey,
                    dashLength: 4.0,
                    dashGap: 3.0,
                    dashThickness: 1.0,
                  ),
                  SizedBox(height: 8),
                  Text(date,style: TextStyle(fontSize: 20)),
                  SizedBox(height: 8),

                  Text(address_person,style: TextStyle(fontSize: 20)),
                  SizedBox(height: 8),

                  Text(try_to_resolve,style: TextStyle(fontSize: 14,color: Colors.grey)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DottedLine extends StatelessWidget {
  final Color color;
  final double height;

  const DottedLine({required this.color, required this.height});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: SingleChildScrollView(
        child: Column(
          children: List.generate((height / 4).floor(), (index) {
            return Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),
                color: color,

              ),
              width: 2.5,
              height: 9,
              margin: EdgeInsets.symmetric(vertical: 2),
            );
          }),
        ),
      ),
    );
  }
}
