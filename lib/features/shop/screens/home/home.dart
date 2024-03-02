import 'package:clothes/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:clothes/common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import 'package:clothes/util/constants/colors.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
        children: [
          TCurvedEdgeWidget(
            child: Container(
              color: TColors.primary,
              padding: const EdgeInsets.all(0),
              child: SizedBox(
                height: 400,
                child: Stack(
                  children: [
                    Positioned(
                        top: -150,
                        right: -250,
                        child: TCircularContainer(
                            backgroundColor:
                                TColors.textWhite.withOpacity(0.1))),
                    Positioned(
                        top: 100,
                        right: -300,
                        child: TCircularContainer(
                            backgroundColor:
                                TColors.textWhite.withOpacity(0.1))),
                  ],
                ),
              ),
            ),
          )
        ],
      )),
    );
  }
}
