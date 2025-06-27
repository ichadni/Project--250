import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String name = "Altaf Hossain";
  String email = "altaf@mail.com";
  String mobile = "01712345678";
  String bloodGroup = "O+";

  void _editProfile() {
    final nameController = TextEditingController(text: name);
    final emailController = TextEditingController(text: email);
    final mobileController = TextEditingController(text: mobile);
    final bloodGroupController = TextEditingController(text: bloodGroup);

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Edit Profile"),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(labelText: "Name"),
              ),
              TextField(
                controller: emailController,
                decoration: const InputDecoration(labelText: "Email"),
              ),
              TextField(
                controller: mobileController,
                decoration: const InputDecoration(labelText: "Mobile Number"),
              ),
              TextField(
                controller: bloodGroupController,
                decoration: const InputDecoration(labelText: "Blood Group"),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                name = nameController.text;
                email = emailController.text;
                mobile = mobileController.text;
                bloodGroup = bloodGroupController.text;
              });
              Navigator.pop(context);
            },
            child: const Text("Save"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final String profileImage = "lib/assets/images/profile.jpeg";

    return Scaffold(
      appBar: AppBar(title: const Text("My Profile")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 20),
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage(profileImage),
            ),
            const SizedBox(height: 20),
            Text(
              name,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              email,
              style: const TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 20),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.phone),
              title: Text("Mobile: $mobile"),
            ),
            ListTile(
              leading: const Icon(Icons.bloodtype),
              title: Text("Blood Group: $bloodGroup"),
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.edit),
              title: const Text("Edit Profile"),
              onTap: _editProfile,
            ),
          ],
        ),
      ),
    );
  }
}
