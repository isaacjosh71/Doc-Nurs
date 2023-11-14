//
// import 'package:docs_and_nurs/Screens/root_page.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:docs_and_nurs/services/data/location_controller.dart';
// import 'package:docs_and_nurs/Helpers/custom_button.dart';
//
// class MapScreen extends StatefulWidget {
//   final bool fromSignUp;
//   final bool fromAddress;
//   final GoogleMapController? googleMapController;
//   const MapScreen({Key? key, required this.fromSignUp, required this.fromAddress, this.googleMapController}) : super(key: key);
//
//   @override
//   State<MapScreen> createState() => _MapScreenState();
// }
//
// class _MapScreenState extends State<MapScreen> {
//   late LatLng _initialPosition;
//   late GoogleMapController _mapController;
//   late CameraPosition _cameraPosition;
//
//   @override
//   void initState(){
//     super.initState();
//     if(Get.find<LocationController>().addressList.isEmpty){
//       _initialPosition=const LatLng(6.508835, 3.313712);
//       _cameraPosition=CameraPosition(target: _initialPosition, zoom: 17);
//     }else{
//       if(Get.find<LocationController>().addressList.isNotEmpty){
//         _initialPosition= LatLng(
//           double.parse(Get.find<LocationController>().getAddress['latitude']),
//           double.parse(Get.find<LocationController>().getAddress['longitude']),
//         );
//         _cameraPosition=CameraPosition(target: _initialPosition, zoom: 17);
//       }
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     var size = MediaQuery.of(context).size;
//     return GetBuilder<LocationController>(builder: (locationController){
//       return Scaffold(
//         body: SafeArea(
//           child: Center(
//             child: SizedBox(
//               width: double.maxFinite,
//               child: Stack(
//                 children: [
//                   GoogleMap(
//                     initialCameraPosition:
//                     CameraPosition(target:
//                     _initialPosition, zoom: 17),
//                     zoomControlsEnabled: false,
//                     onCameraMove: (CameraPosition position){
//                       _cameraPosition=position;
//                     },
//                     onCameraIdle: (){
//                       Get.find<LocationController>().updatePosition(_cameraPosition, false);
//                     },
//                   ),
//                   Center(
//                       child: !locationController.loading
//                           ? Image.asset('assets/images/download.png',
//                         height: 30, width: 30,)
//                           : const CircularProgressIndicator()
//                   ),
//                   Positioned(
//                       top: size.height*0.045,
//                       left: size.width*0.002,
//                       right: size.width*0.002,
//                       child: Container(
//                         padding: EdgeInsets.symmetric(horizontal: size.width*0.001),
//                         height: 50,
//                         decoration: BoxDecoration(
//                           color: Colors.orangeAccent,
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                         child: Row(
//                           children: [
//                             Icon(Icons.location_on, size: 25, color: Colors.teal.shade400,),
//                             const SizedBox(width: 4,),
//                             Expanded(
//                                 child: Text(
//                                   locationController.pickPlacemark.name??'',
//                                   style: const TextStyle(
//                                       fontSize: 16, color: Colors.white
//                                   ),
//                                   maxLines: 1, overflow: TextOverflow.ellipsis,
//                                 )
//                             ),
//                           ],
//                         ),
//                       )),
//                   Positioned(
//                     bottom: 80,
//                     left: size.width*0.002,
//                     right: size.width*0.002,
//                     child: locationController.isLoading
//                         ?const Center(child: CircularProgressIndicator(),)
//                         : CustomButton(
//                       buttonText: locationController.inZone
//                           ? widget.fromAddress ? 'Pick Address' : 'Pick Location'
//                           : 'Service is not available in your area',
//                       onPressed: (locationController.buttonDisabled || locationController.loading)
//                           ? null
//                           :(){
//                         if(locationController.pickPosition.latitude!=0
//                             &&locationController.pickPlacemark.name!=null){
//                           if(widget.fromAddress){
//                             if(widget.googleMapController!=null){
//                               print('Now you can click on this');
//                               widget.googleMapController!.moveCamera(CameraUpdate.newCameraPosition(
//                                   CameraPosition(target: LatLng(
//                                       locationController.pickPosition.latitude,
//                                       locationController.pickPosition.longitude
//                                   ))
//                               ));
//                               locationController.setAddressData();
//                             }
//                             //Get.back() creates update issues so
//                             Get.off(const RootPage());
//                           }
//                         }
//                       },
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           ),
//         ),
//       );
//     });
//   }
// }
