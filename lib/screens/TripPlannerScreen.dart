// import 'package:flutter/material.dart';
// //import 'package:cloud_firestore/cloud_firestore.dart';
//
// class TripPlannerScreen extends StatefulWidget {
//   const TripPlannerScreen({super.key});
//
//   @override
//   _TripPlannerScreenState createState() => _TripPlannerScreenState();
// }
//
// class _TripPlannerScreenState extends State<TripPlannerScreen> {
//   final TextEditingController _locationController = TextEditingController();
//   String? _savedLocation; // To display saved location
//
//   @override
//   void initState() {
//     super.initState();
//     _fetchSavedLocation(); // Fetch saved location on screen load
//   }
//
//   // ✅ Fetch saved location from Firestore
//   Future<void> _fetchSavedLocation() async {
//     QuerySnapshot query = await FirebaseFirestore.instance.collection('trips').limit(1).get();
//     if (query.docs.isNotEmpty) {
//       setState(() {
//         _savedLocation = query.docs.first['destination'];
//       });
//     }
//   }
//
//   // ✅ Save location to Firestore
//   Future<void> _saveTripLocation() async {
//     String location = _locationController.text.trim();
//
//     if (location.isEmpty) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text("Please enter a location")),
//       );
//       return;
//     }
//
//     await FirebaseFirestore.instance.collection('trips').add({
//       'destination': location,
//       'timestamp': FieldValue.serverTimestamp(),
//     });
//
//     setState(() {
//       _savedLocation = location;
//     });
//
//     ScaffoldMessenger.of(context).showSnackBar(
//       const SnackBar(content: Text("Location saved successfully!")),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("Trip Planner")),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const Text("Enter Trip Location:", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//             TextField(
//               controller: _locationController,
//               decoration: InputDecoration(
//                 hintText: "E.g., Bali, Indonesia",
//                 suffixIcon: IconButton(
//                   icon: const Icon(Icons.location_on),
//                   onPressed: _saveTripLocation,
//                 ),
//               ),
//             ),
//             const SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: _saveTripLocation,
//               child: const Text("Save Location"),
//             ),
//             const SizedBox(height: 20),
//             if (_savedLocation != null)
//               Text("Saved Location: $_savedLocation", style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
//           ],
//         ),
//       ),
//     );
//   }
// }
