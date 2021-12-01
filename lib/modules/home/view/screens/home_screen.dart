import 'package:custom_architecture/modules/home/view/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  final HomeController homeController;

  const HomeScreen({
    Key? key,
    required this.homeController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: homeController.obx(
          (state) => Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Olá, ${state!.name}'),
              OutlinedButton(
                onPressed: () => homeController.logout(),
                child: const Text(
                  'Logout',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
          onLoading: const CircularProgressIndicator(),
          onError: (error) => Text(error!),
        ),
      ),
    );
  }
}
