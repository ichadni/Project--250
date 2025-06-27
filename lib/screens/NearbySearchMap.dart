import 'dart:convert';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

class NearbySearchMap extends StatefulWidget {
  final String placeType;

  const NearbySearchMap({super.key, required this.placeType});

  @override
  State<NearbySearchMap> createState() => _NearbySearchMapState();
}

class _NearbySearchMapState extends State<NearbySearchMap> {
  GoogleMapController? _mapController;
  Position? _currentPosition;
  List<Marker> _markers = [];

  // ✅ Replace with your actual API key
  final String _apiKey = 'AIzaSyDAAlBhbrd61My2s_u6nppknvJwlfjLTYA';

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    LocationPermission permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied || permission == LocationPermission.deniedForever) {
      return;
    }

    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    setState(() {
      _currentPosition = position;
    });

    _fetchNearbyPlaces();
  }

  Future<void> _fetchNearbyPlaces() async {
    if (_currentPosition == null) return;

    final url =
        'https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=${_currentPosition!.latitude},${_currentPosition!.longitude}&radius=5000&type=${Uri.encodeComponent(widget.placeType)}&key=$_apiKey';

    final response = await http.get(Uri.parse(url));
    final data = json.decode(response.body);

    if (data['status'] == 'OK') {
      List<Marker> markers = [];

      // Current location marker
      final currentMarker = Marker(
        markerId: const MarkerId('current-location'),
        position: LatLng(_currentPosition!.latitude, _currentPosition!.longitude),
        infoWindow: const InfoWindow(title: 'Your Location'),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
      );
      markers.add(currentMarker);

      for (var place in data['results']) {
        final marker = Marker(
          markerId: MarkerId(place['place_id']),
          position: LatLng(
            place['geometry']['location']['lat'],
            place['geometry']['location']['lng'],
          ),
          infoWindow: InfoWindow(
            title: place['name'],
            snippet: place['vicinity'],
          ),
        );
        markers.add(marker);
      }

      setState(() {
        _markers = markers;
      });
    } else {
      debugPrint("Places API error: ${data['status']}");
    }
  }

  @override
  Widget build(BuildContext context) {
    final formattedTitle = widget.placeType[0].toUpperCase() + widget.placeType.substring(1);

    return Scaffold(
      appBar: AppBar(
        title: Text("Nearby $formattedTitle"),
        backgroundColor: Colors.blueAccent,
      ),
      body: _currentPosition == null
          ? const Center(child: CircularProgressIndicator())
          : kIsWeb
          ? _buildWebMap()
          : _buildMobileMap(),
    );
  }

  Widget _buildMobileMap() {
    return GoogleMap(
      onMapCreated: (controller) => _mapController = controller,
      initialCameraPosition: CameraPosition(
        target: LatLng(_currentPosition!.latitude, _currentPosition!.longitude),
        zoom: 14,
      ),
      myLocationEnabled: true,
      myLocationButtonEnabled: true,
      markers: Set<Marker>.of(_markers),
    );
  }

  Widget _buildWebMap() {
    return GoogleMap(
      onMapCreated: (controller) => _mapController = controller,
      initialCameraPosition: CameraPosition(
        target: LatLng(_currentPosition!.latitude, _currentPosition!.longitude),
        zoom: 14,
      ),
      myLocationEnabled: false, // not supported on web
      myLocationButtonEnabled: false,
      markers: Set<Marker>.of(_markers),
    );
  }
}
