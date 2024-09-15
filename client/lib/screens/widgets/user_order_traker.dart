import 'package:flutter/material.dart';

class CustomOrderTracker extends StatefulWidget {
  final List<TrackerData> trackerData;

  const CustomOrderTracker({Key? key, required this.trackerData})
      : super(key: key);

  @override
  CustomOrderTrackerState createState() => CustomOrderTrackerState();
}

class CustomOrderTrackerState extends State<CustomOrderTracker>
    with TickerProviderStateMixin {
  late List<AnimationController> _controllers;
  late List<Animation<double>> _animations;
  late List<bool> _statusCompleted;

  @override
  void initState() {
    super.initState();

    _controllers = List.generate(widget.trackerData.length - 1, (index) {
      return AnimationController(
        duration: const Duration(seconds: 2),
        vsync: this,
      );
    });

    _animations = _controllers.map((controller) {
      return Tween<double>(begin: 0.0, end: 1.0).animate(controller);
    }).toList();

    _statusCompleted = List.generate(widget.trackerData.length, (index) => false);

    _startStaggeredAnimation(0);
  }

  Future<void> _startStaggeredAnimation(int index) async {
    if (index >= widget.trackerData.length) return;

    setState(() {
      _statusCompleted[index] = true;
    });

    if (index < _controllers.length) {
      // Start line animation
      await _controllers[index].forward();
      _startStaggeredAnimation(index + 1);
    }
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }


  double _calculateLineHeight(int index) {
    if (index < widget.trackerData.length - 1) {
      return 40.0;
    } else {
      return 0.0;
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: widget.trackerData.asMap().entries.map((entry) {
        int index = entry.key;
        TrackerData data = entry.value;

        return AnimatedBuilder(
          animation: index < _animations.length ? _animations[index] : const AlwaysStoppedAnimation(1.0),
          builder: (context, child) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: Stack(
                children: [
                  if (index != widget.trackerData.length - 1)
                    Positioned(
                      left: 12, 
                      top: 48,
                      child: Container(
                        height: (_calculateLineHeight(index) + 24) * _animations[index].value,
                        width: 2,
                        color: Colors.green,
                      ),
                    ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        _statusCompleted[index]
                            ? widget.trackerData[index].status == true ? Icons.check_circle : Icons.cancel
                            : Icons.radio_button_unchecked,
                        color:  _statusCompleted[index]
                            ? widget.trackerData[index].status == true ? Colors.green : Colors.red : null,
                        size: 24,
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              data.title,
                              style: const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(data.date ?? "",style: TextStyle(fontSize: size.width * 0.03),),
                            ...data.trackerDetails.map((detail) {
                              return Padding(
                                padding: const EdgeInsets.only(top: 4.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(width: 30),
                                    const Icon(Icons.circle, size: 8, color: Colors.grey),
                                    const SizedBox(width: 8),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            detail.title,
                                            style:  TextStyle(fontWeight: FontWeight.w600,fontSize: size.width * 0.03),
                                          ),
                                          Text(detail.datetime ?? "",style: TextStyle(fontSize: size.width * 0.03),),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }).toList(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        );
      }).toList(),
    );
  }
}

class TrackerData {
  final String title;
  final String? date;
  final List<TrackerDetails> trackerDetails;
  final bool status;

  TrackerData({
    required this.title,
    this.date,
    required this.trackerDetails,
    required this.status,
  });
}

class TrackerDetails {
  final String title;
  final String? datetime;

  TrackerDetails({
    required this.title,
    this.datetime,
  });
}
