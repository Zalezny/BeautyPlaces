import 'package:beauty_places/bloc/cubit/map_cubit.dart';
import 'package:beauty_places/bloc/cubit/user_session_cubit.dart';
import 'package:beauty_places/data/models/place_model.dart';
import 'package:beauty_places/screens/widgets/draggable_sheet_widget.dart';
import 'package:beauty_places/screens/widgets/favorite_dialog.dart';
import 'package:beauty_places/screens/widgets/login_dialog.dart';
import 'package:beauty_places/screens/widgets/simple_account_menu.dart';
import 'package:beauty_places/screens/widgets/zoom_buttons.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

import '../services/injection.dart';
import 'widgets/new_place_dialog.dart';
import 'widgets/place_details_window.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final _sheetController = DraggableScrollableController();
  final double _initialZoom = 16;
  final double _minZoom = 4;
  double _currentZoom = 7;
  final _mapController = MapController();
  LatLng _currentLatLng = const LatLng(50.1545, 19.0118);
  PlaceModel? showDetailsPlace;

  @override
  void initState() {
    super.initState();
    _sheetController.addListener(() {
      if (_sheetController.size == 0.2) {
        setState(() {
          showDetailsPlace = null;
        });
      }
    });
  }

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
                              height: 48,
                              width: 48,
                              alignment: Alignment.topCenter,
                              point: LatLng(model.location.latitude, model.location.longitude),
                              child: GestureDetector(
                                behavior: HitTestBehavior.translucent,
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
              DraggableSheetWidget(
                sheetController: _sheetController,
                child: PlaceDetailsWindow(key: UniqueKey(), place: showDetailsPlace!),
              ),
            Container(
              padding: EdgeInsets.only(top: MediaQuery.paddingOf(context).top + 5, right: 20),
              alignment: Alignment.topLeft,
              child: Column(
                children: [
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
                  const SizedBox(height: 10),
                  SimpleAccountMenu(
                    onChoice: (chosenIndex) {
                      Widget? dialog;
                      switch (chosenIndex) {
                        case 0:
                          dialog = FavoriteDialog(
                            onFavoriteChosen: (model) {
                              setState(() {
                                showDetailsPlace = model;
                              });
                            },
                          );
                          break;
                        case 1:
                          dialog = const NewPlaceDialog();
                          break;
                        case 2:
                          if (FirebaseAuth.instance.currentUser != null) {
                            getIt<UserSessionCubit>().logout();
                          } else {
                            dialog = const LoginDialog();
                          }
                          break;
                      }
                      if (dialog != null) {
                        showDialog(
                          context: context,
                          builder: (_) => BlocProvider.value(
                            value: BlocProvider.of<MapCubit>(context),
                            child: dialog,
                          ),
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
