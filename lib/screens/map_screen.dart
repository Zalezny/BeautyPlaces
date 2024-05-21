import 'package:beauty_places/bloc/cubit/map_cubit.dart';
import 'package:beauty_places/data/models/place_model.dart';
import 'package:beauty_places/screens/widgets/zoom_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

import 'widgets/place_details_window.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final double _initialZoom = 16;
  final double _minZoom = 4;
  double _currentZoom = 7;
  final _mapController = MapController();
  LatLng _currentLatLng = const LatLng(50.1545, 19.0118);
  PlaceModel? showDetailsPlace;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FlutterMap(
          mapController: _mapController,
          options: MapOptions(
            initialCenter: _currentLatLng,
            initialZoom: 6.2,
            onTap: (tapPosition, point) {
              setState(() {
                showDetailsPlace = null;
              });
            },
            onPositionChanged: (mapPosition, hasGesture) {
              if (mapPosition.zoom != null && mapPosition.zoom != _currentZoom) {
                setState(() {
                  _currentZoom = mapPosition.zoom!;
                });
              }
              if (mapPosition.center != null) {
                setState(() {
                  _currentLatLng = mapPosition.center!;
                });
              }
            },
          ),
          children: [
            TileLayer(
              urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
              userAgentPackageName: 'com.example.app',
            ),
            BlocBuilder<MapCubit, MapState>(
              builder: (context, state) {
                if (state.models != null) {
                  return MarkerLayer(
                      markers: state.models!
                          .map(
                            (model) => Marker(
                              alignment: Alignment.topCenter,
                              point: LatLng(model.location.latitude, model.location.longitude),
                              child: Stack(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        showDetailsPlace = model;
                                      });
                                    },
                                    child: const Icon(
                                      Icons.location_on,
                                      size: 48,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                          .toList());
                }
                return const SizedBox();
              },
            ),
            RichAttributionWidget(
              attributions: [
                TextSourceAttribution(
                  'OpenStreetMap contributors',
                  onTap: () {},
                ),
              ],
            ),
            if (showDetailsPlace != null)
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: MediaQuery.of(context).padding.top + 80),
                child: PlaceDetailsWindow(
                  key: ValueKey(showDetailsPlace),
                  place: showDetailsPlace!,
                ),
              ),
            ZoomButtons(
              onZoomIn: () {
                _mapController.move(_currentLatLng, _currentZoom + 1);
              },
              onZoomOut: () {
                _mapController.move(_currentLatLng, _currentZoom - 1);
              },
              minZoom: _minZoom,
              maxZoom: _initialZoom,
              zoom: _currentZoom,
            ),
          ],
        ),
      ),
    );
  }
}
