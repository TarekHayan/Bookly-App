import 'package:bookly_app/core/widgets/network_error.dart';
import 'package:flutter_offline/flutter_offline.dart';

import '../widgets/home_page_body.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: (HomePageBody()));
  }
}
