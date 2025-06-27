import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Your screen imports
import 'package:travel_asst/screens/local_vehicle.dart';
import 'package:travel_asst/screens/police.dart';
import 'CountryListScreen.dart';
import 'destinations_details.dart';
import 'mountains_screen.dart';
import 'beaches_screen.dart';
import 'cities_screen.dart';
import 'adventures_screen.dart';
import 'country_screen.dart';
import 'food_screen.dart';
import 'hospital_screen.dart';
import 'hotel_screen.dart';

// Drawer option screens
import 'profile.dart';
import 'saved_destinations.dart';
import 'packing_checklist.dart';
import 'local_language.dart';
import 'local_guide.dart';
import 'sos.dart';
import 'insurance.dart';
import 'about.dart';
import 'login_screen.dart';

// NearbySearchMap screen import
import 'NearbySearchMap.dart';

Future<void> _logout(BuildContext context) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setBool('isLoggedIn', false);

  Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => LoginScreen()),
  );
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Travel Assistant"),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
        leading: Builder(
          builder: (context) {
            return GestureDetector(
              onTap: () => Scaffold.of(context).openDrawer(),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  "lib/assets/images/drawer/d2.png",
                  width: 30,
                  height: 30,
                ),
              ),
            );
          },
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(color: Colors.blueAccent),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage("lib/assets/images/drawer/profile.png"),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Welcome, Traveler!",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Image.asset("lib/assets/images/drawer/profile_logo.webp", width: 30, height: 30),
              title: const Text("My Profile"),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (_) => const ProfileScreen()));
              },
            ),
            ListTile(
              leading: Image.asset("lib/assets/images/drawer/saved2.jpg", width: 30, height: 30),
              title: const Text("Saved Destinations"),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (_) => const SavedDestinationsScreen()));
              },
            ),
            ListTile(
              leading: Image.asset("lib/assets/images/drawer/pack.jpg", width: 30, height: 30),
              title: const Text("Packing Checklist"),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (_) => const PackingChecklistScreen()));
              },
            ),
            ListTile(
              leading: Image.asset("lib/assets/images/drawer/lang.jpg", width: 30, height: 30),
              title: const Text("Local Language"),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (_) => const LocalLanguageScreen()));
              },
            ),
            ListTile(
              leading: Image.asset("lib/assets/images/drawer/guide.jpg", width: 30, height: 30),
              title: const Text("Local guide"),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (_) => const LocalGuideScreen()));
              },
            ),
            ListTile(
              leading: Image.asset("lib/assets/images/drawer/sos.jpg", width: 30, height: 30),
              title: const Text("SOS"),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (_) => const SosScreen()));
              },
            ),
            ListTile(
              leading: Image.asset("lib/assets/images/drawer/ins.jpg", width: 30, height: 30),
              title: const Text("Travel Insurance Info"),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (_) => const TravelInsuranceScreen()));
              },
            ),
            ListTile(
              leading: Image.asset("lib/assets/images/drawer/abt.png", width: 30, height: 30),
              title: const Text("About"),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (_) => const AboutScreen()));
              },
            ),
            ListTile(
              leading: Image.asset("lib/assets/images/drawer/logout.jpg", width: 30, height: 30),
              title: const Text("Logout", style: TextStyle(color: Colors.red)),
              onTap: () => _logout(context),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 200,
              width: double.infinity,
              child: Image.asset("lib/assets/images/travel_banner.webp", fit: BoxFit.cover),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: const Text(
                "Explore by Category",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildCategoryIcon(context, "lib/assets/images/mountains_logo.webp", "Mountains", const MountainsScreen()),
                  _buildCategoryIcon(context, "lib/assets/images/beaches_logo.webp", "Beaches", const BeachesScreen()),
                  _buildCategoryIcon(context, "lib/assets/images/cities_logo.jpg", "Cities", const CitiesScreen()),
                  _buildCategoryIcon(context, "lib/assets/images/adventures_logo.jpg", "Adventures", const AdventuresScreen()),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: const Text(
                "Popular Destinations",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 10),
            _buildDestinationList(context),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryIcon(BuildContext context, String imagePath, String label, Widget screen) {
    return GestureDetector(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => screen)),
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: Colors.blue.shade100,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Image.asset(imagePath, width: 50, height: 50, fit: BoxFit.cover),
            ),
          ),
          const SizedBox(height: 4),
          Text(label, style: const TextStyle(fontSize: 14)),
        ],
      ),
    );
  }

  Widget _buildDestinationList(BuildContext context) {
    final List<Map<String, String>> destinations = [
      {
        "name": "Bali, Indonesia",
        "image": "lib/assets/images/bali.webp",
        "description": "Bali is an Indonesian island known for its forested volcanic mountains, iconic rice paddies, beaches, and coral reefs.",
      },
      {
        "name": "Paris, France",
        "image": "lib/assets/images/paris.webp",
        "description": "Paris, the capital of France, is known for its art, gastronomy, and culture. Iconic landmarks include the Eiffel Tower and Notre-Dame Cathedral.",
      },
      {
        "name": "Tokyo, Japan",
        "image": "lib/assets/images/tokyo.jpg",
        "description": "Tokyo, the capital of Japan, is a bustling metropolis blending ultramodern and traditional architecture, with vibrant nightlife and rich culture.",
      },
      {
        "name": "Amazon, Brazil",
        "image": "lib/assets/images/amazon.webp",
        "description": "The Amazon Rainforest, known as 'the lungs of the Earth,' is home to diverse wildlife, breathtaking landscapes, and indigenous cultures.",
      },
      {
        "name": "Istanbul, Turkey",
        "image": "lib/assets/images/places/istanbul.jpg",
        "description": "Istanbul is a great place to visit, mix culture of Asia and Europe. Very rich culture and heritage.",
      },
      {
        "name": "Helsinki, Finland",
        "image": "lib/assets/images/places/helsinki.webp",
        "description": "Helsinki is a great place to visit, mix culture. Very rich culture and heritage.",
      },
      {
        "name": "Maldives",
        "image": "lib/assets/images/places/maldives.jpg",
        "description": "Sea beaches, coconut and many more.",
      },
      {
        "name": "Pompeii, Italy",
        "image": "lib/assets/images/places/pompei.jpg",
        "description": "Pompeii is a great place to visit, mix culture. Very rich culture and heritage.",
      },
      {
        "name": "Tajmahal, India",
        "image": "lib/assets/images/places/tajmahal.jpg",
        "description": "Taj Mahal is a great place to visit, mix culture. Very rich culture and heritage.",
      },
      {
        "name": "Venice, Italy",
        "image": "lib/assets/images/places/venice.jpg",
        "description": "Venice is a great place to visit, mix culture. Very rich culture and heritage.",
      },
    ];

    return Column(
      children: [
        SizedBox(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: destinations.length,
            itemBuilder: (context, index) {
              final destination = destinations[index];
              return GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => DestinationDetailScreen(
                      name: destination["name"]!,
                      imagePath: destination["image"]!,
                      description: destination["description"]!,
                    ),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(destination["image"]!, width: 150, height: 120, fit: BoxFit.cover),
                      ),
                      const SizedBox(height: 8),
                      Text(destination["name"]!, style: const TextStyle(fontSize: 16)),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: const Text(
            "More Options",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            children: [
              _buildOptionCard(context, "Destinations by Country", "lib/assets/images/options/country.webp", CountryListScreen()),
              _buildOptionCard(context, "Famous Foods", "lib/assets/images/options/food.webp", const FoodsScreen()),
              // NearbySearchMap for these options
              _buildOptionCard(context, "Nearest Hospital", "lib/assets/images/options/hospital.webp", NearbySearchMap(placeType: 'hospital')),
              _buildOptionCard(context, "Nearest Hotels", "lib/assets/images/options/hotel.jpg", NearbySearchMap(placeType: 'lodging')),
              _buildOptionCard(context, "Local Transport", "lib/assets/images/options/transport.webp", NearbySearchMap(placeType: 'transit_station')),
              _buildOptionCard(context, "Local Police", "lib/assets/images/options/police.webp", NearbySearchMap(placeType: 'police')),

            ],
          ),
        ),
      ],
    );
  }

  Widget _buildOptionCard(BuildContext context, String title, String imagePath, Widget screen) {
    return Card(
      elevation: 3,
      child: InkWell(
        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => screen)),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(imagePath, width: 50, height: 50, fit: BoxFit.cover),
              const SizedBox(height: 10),
              Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
            ],
          ),
        ),
      ),
    );
  }
}
