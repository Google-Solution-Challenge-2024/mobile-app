import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solution_app/core/config/custom_theme_extension.dart';
import 'package:solution_app/core/service-locator/service_locator_manager.dart';
import 'package:solution_app/core/ui/button/custom_button.dart';
import 'package:solution_app/feature/search/model/hospital_model.dart';
import 'package:solution_app/navigation/auth_navigation.dart';
import 'package:latlong2/latlong.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    final CustomThemeExtension theme = CustomThemeExtension.of(context);
    return Scaffold(
      appBar: _buildAppBar(context),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildMap(),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: ListView(
                children: [
                  SizedBox(height: 20.h),
                  Text(
                    "Your Location: Kabanbay Batyr 53",
                    style: theme.headline4,
                  ),
                  SizedBox(height: 20.h),
                  TextField(
                    decoration: InputDecoration(
                      hintText: "Search for hospitals",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.w),
                        borderSide: BorderSide(
                          width: 2.sp,
                          color: Colors.grey,
                        ),
                      ),
                      focusColor: Colors.grey,
                      prefixIcon: const Icon(
                        Icons.search,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  for (var h in hospitalList) _buildItem(h),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildItem(HospitalModel h) {
    final CustomThemeExtension theme = CustomThemeExtension.of(context);

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.w),
      ),
      padding: EdgeInsets.all(10.w),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10.w),
            child: Image.network(
              "https://bmcudp.kz/images/News/fas.jpg",
              width: 80.w,
              height: 80.w,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 10.w),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                h.name,
                style: theme.headline2.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 10.h),
              Text(
                h.address,
                style: theme.headline4.copyWith(
                  fontWeight: FontWeight.w400,
                  color: Colors.grey,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildMap() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 200.h,
      color: Colors.black,
      child: FlutterMap(
        options: const MapOptions(
          initialZoom: 12.2,
          initialCenter: LatLng(51.1655, 71.4272),
        ),
        children: [
          TileLayer(
            urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
          ),
        ],
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    final CustomThemeExtension theme = CustomThemeExtension.of(context);
    return AppBar(
      leading: IconButton(
        onPressed: () {},
        icon: Icon(
          Icons.menu,
          color: theme.textColor1,
        ),
      ),
      title: Text(
        "Hospitals",
        style: theme.headline3,
      ),
      centerTitle: true,
      elevation: 0,
    );
  }
}
