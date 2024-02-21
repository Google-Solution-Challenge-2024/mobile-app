import 'package:flutter/material.dart';
import 'package:solution_app/core/service-locator/service_locator_manager.dart';
import 'package:solution_app/core/ui/button/custom_button.dart';
import 'package:solution_app/navigation/auth_navigation.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Center(
            child: Text("SEARCH PAGE"),
          ),
          CustomButton.h2(
            title: "Slider",
            onPressed: () {
              globalSL<AuthNavigation>()
                  .globalRouter
                  .push(AuthNavigation.slider);
            },
          )
        ],
      ),
    );
  }
}
