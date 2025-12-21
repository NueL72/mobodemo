import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CustomerPage extends StatefulWidget {
  const CustomerPage({super.key});

  @override
  State<CustomerPage> createState() => _CustomerPageState();
}

class _CustomerPageState extends State<CustomerPage> {
  late GoogleMapController mapController;

  // Example user location (replace with Geolocator later)
  final LatLng userLocation = LatLng(-6.7924, 39.2083); // Dar es Salaam

  // Mock list of technicians
  final List<Map<String, dynamic>> technicians = [
    {
      "name": "Mobowiza Tech",
      "lat": -6.7930,
      "lng": 39.2090,
      "distance": "0.5 km",
      "type": "Phone Repair"
    },
    {
      "name": "SmartFix Center",
      "lat": -6.7900,
      "lng": 39.2060,
      "distance": "1.2 km",
      "type": "Laptop Repair"
    },
    {
      "name": "QuickFix Ltd",
      "lat": -6.7915,
      "lng": 39.2070,
      "distance": "0.8 km",
      "type": "Phone & Laptop"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Nearby Technicians")),
      body: Column(
        children: [
          // GOOGLE MAP
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.45,
            child: GoogleMap(
              initialCameraPosition: CameraPosition(
                target: userLocation,
                zoom: 14,
              ),
              markers: _buildMarkers(),
              onMapCreated: (controller) {
                mapController = controller;
              },
              myLocationEnabled: true,
              myLocationButtonEnabled: true,
            ),
          ),

          // TECHNICIANS LIST
          Expanded(
            child: ListView.builder(
              itemCount: technicians.length,
              itemBuilder: (context, index) {
                final tech = technicians[index];
                return Card(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  child: ListTile(
                    leading: const Icon(Icons.build),
                    title: Text(tech["name"]),
                    subtitle: Text(
                        "${tech["type"]} • Distance: ${tech["distance"]}"),
                    trailing: const Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      // TODO: Navigate to technician details page
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  // Build markers from technicians list
  Set<Marker> _buildMarkers() {
    return technicians.map((tech) {
      return Marker(
        markerId: MarkerId(tech["name"]),
        position: LatLng(tech["lat"], tech["lng"]),
        infoWindow: InfoWindow(title: tech["name"], snippet: tech["type"]),
      );
    }).toSet();
  }
}
