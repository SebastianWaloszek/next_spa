import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';

class AnimatedMapController {
  final controller = MapController();
  final TickerProvider _vsync;

  AnimatedMapController({
    @required TickerProvider vsync,
  })  : assert(vsync != null),
        _vsync = vsync;

  void animatedMapMove(LatLng destLocation, double destZoom) {
    final _latTween = Tween<double>(
      begin: controller.center.latitude,
      end: destLocation.latitude,
    );
    final _lngTween = Tween<double>(
      begin: controller.center.longitude,
      end: destLocation.longitude,
    );
    final _zoomTween = Tween<double>(
      begin: controller.zoom,
      end: destZoom,
    );
    final animatedController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: _vsync,
    );
    final animation = CurvedAnimation(
      parent: animatedController,
      curve: Curves.fastOutSlowIn,
    );
    animatedController.addListener(
      () {
        controller.move(
            LatLng(
              _latTween.evaluate(animation),
              _lngTween.evaluate(animation),
            ),
            _zoomTween.evaluate(animation));
      },
    );
    animation.addStatusListener(
      (status) {
        if (status == AnimationStatus.completed) {
          animatedController.dispose();
        } else if (status == AnimationStatus.dismissed) {
          animatedController.dispose();
        }
      },
    );
    animatedController.forward();
  }
}
