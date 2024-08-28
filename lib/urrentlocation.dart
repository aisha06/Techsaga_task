import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:taskk/activitiesView.dart';
import 'package:taskk/controller/activittiesforyou.dart';

import 'package:taskk/locationService.dart';
import 'package:taskk/controller/fitnessImagesController.dart';
import 'package:taskk/mapView.dart';
import 'package:taskk/models/activitiesModel.dart';
import 'package:taskk/models/fitnessImageModel.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _currentAddress = "Fetching current address...";
  late Future<FitnesImages> _fitnessImages;
  late Future<ActivitiesForYou> _activities;

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
    _fitnessImages = ApiService().fetchFitnesImages(28.583745, 77.3155413);
    _activities = ApiactivititesService().fetchactivitesImages(1);
  }

  Future<void> _getCurrentLocation() async {
    LocationService locationService = LocationService();
    try {
      Position position = await locationService.getCurrentPosition();
      String address = await locationService.getAddressFromLatLng(position);
      setState(() {
        _currentAddress = address;
      });
    } catch (e) {
      setState(() {
        _currentAddress = "Could not fetch address.";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Icon(Icons.location_pin, color: Colors.grey[200]),
                      Expanded(
                        child: Text(
                          _currentAddress,
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.grey[200],
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(color: Colors.grey, width: 1.0),
                  color: Colors.transparent,
                ),
              ),
              SizedBox(height: 30.0),
              Text(
                "FITNESS LOCATIONS FOR YOU",
                style: TextStyle(fontSize: 18.0, color: Colors.white),
              ),
              SizedBox(height: 40.0),
              Container(
                height: 200.0,
                child: FutureBuilder<FitnesImages>(
                  future: _fitnessImages,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    } else if (snapshot.hasData) {
                      final fitnessImages = snapshot.data!;
                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: fitnessImages.data.length,
                        itemBuilder: (context, index) {
                          final datum = fitnessImages.data[index];
                          return Column(
                            children: [
                              Container(
                                child: CircleAvatar(
                                  backgroundImage: datum.gymImages.isNotEmpty
                                      ? NetworkImage(datum.gymImages[0])
                                      : AssetImage('assets/placeholder.png')
                                          as ImageProvider,
                                  backgroundColor: Colors.grey[400],
                                  radius: 50.0,
                                ),
                              ),
                              SizedBox(height: 20.0),
                              Container(
                                color: Colors.grey,
                                margin: EdgeInsets.only(right: 10.0),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 6, horizontal: 16),
                                  child: Row(
                                    children: [
                                      Container(
                                        color: Colors.pink,
                                        height: 40,
                                        width: 40,
                                      ),
                                      SizedBox(width: 20),
                                      Text(
                                        datum.gymName,
                                        style: TextStyle(
                                          fontSize: 12.0,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(width: 20),
                            ],
                          );
                        },
                      );
                    } else {
                      return Center(child: Text('No fitness images found.'));
                    }
                  },
                ),
              ),
              SizedBox(height: 20.0),
              Text(
                "ACTIVITIES FOR YOU",
                style: TextStyle(fontSize: 16.0, color: Colors.white),
              ),
              Container(
                height: 200.0,
                child: FutureBuilder<ActivitiesForYou>(
                  future: _activities,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    } else if (snapshot.hasData) {
                      final activities = snapshot.data!.data;
                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: activities.length,
                        itemBuilder: (context, index) {
                          final activity = activities[index];
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ActivitiesView(
                                    categoryId: activity.id,
                                    categoryNmae: activity.name.toString(),
                                  ),
                                ),
                              );
                            },
                            child: Column(
                              children: [
                                SizedBox(height: 20.0),
                                Container(
                                  margin: EdgeInsets.only(right: 20.0),
                                  child: CircleAvatar(
                                    backgroundImage: activity.icon != null
                                        ? NetworkImage(
                                            activity.icon!,
                                          )
                                        : AssetImage('assets/placeholder.png')
                                            as ImageProvider,
                                    backgroundColor: Colors.grey[700],
                                    radius: 35.0,
                                  ),
                                ),
                                SizedBox(height: 10.0),
                                Text(
                                  activity.name ?? '',
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    } else {
                      return Center(child: Text('No activities found.'));
                    }
                  },
                ),
              ),
              Text(
                "AROUND YOU",
                style: TextStyle(fontSize: 18.0, color: Colors.white),
              ),
              SizedBox(height: 20.0),
              Expanded(child: MapScreen()),
            ],
          ),
        ),
      ),
    );
  }
}
