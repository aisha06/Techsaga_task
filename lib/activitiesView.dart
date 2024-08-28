import 'package:flutter/material.dart';
import 'package:taskk/controller/activitylistcontroller.dart';
import 'package:taskk/models/activitylistModel.dart';

class ActivitiesView extends StatefulWidget {
  final int categoryId;
  final String categoryNmae;

  ActivitiesView(
      {Key? key, required this.categoryId, required this.categoryNmae})
      : super(key: key);

  @override
  _ActivitiesViewState createState() => _ActivitiesViewState();
}

class _ActivitiesViewState extends State<ActivitiesView> {
  late Future<ActivitiesListModel> _gymactivities;

  @override
  void initState() {
    super.initState();
    _gymactivities =
        ActivitiesService().activittielistSerice(widget.categoryId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          widget.categoryNmae,
          style: TextStyle(color: Colors.red),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.red),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      backgroundColor: Colors.black,
      body: FutureBuilder<ActivitiesListModel>(
        future: _gymactivities,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final activities = snapshot.data!.data;
            return ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: activities.length,
              itemBuilder: (context, index) {
                final activity = activities[index];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      color: Colors.grey[700],
                      padding: EdgeInsets.all(12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            height: 80,
                            width: 80,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.network(
                                activity.gymLogo,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  return Icon(
                                    Icons.broken_image,
                                    size: 50,
                                    color: Colors.grey,
                                  );
                                },
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  activity.gymName,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16),
                                ),
                                SizedBox(height: 8.0),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.location_pin,
                                      color: Colors.grey[500],
                                      size: 30.0,
                                    ),
                                    SizedBox(width: 10.0),
                                    Expanded(
                                      child: Text(
                                        activity.address,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        maxLines: 1,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 8.0),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.alarm,
                                      color: Colors.grey[500],
                                      size: 14.0,
                                    ),
                                    SizedBox(width: 10.0),
                                    Text(
                                      activity.open,
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 16),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 8.0),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      color: Colors.grey[200],
                                      size: 16.0,
                                    ),
                                    SizedBox(width: 10.0),
                                    Text(
                                      "${activity.rating} ",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 16),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 8.0),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                  ],
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
