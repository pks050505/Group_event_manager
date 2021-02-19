import 'package:contribution_app/providers/auth_provider.dart';
import 'package:contribution_app/providers/providers.dart';
import 'package:contribution_app/screens/screens.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:flutter/material.dart';

class HomeOrLogin extends ConsumerWidget {
  static const route = '/homeOrLogin';
  @override
  Widget build(BuildContext context, watch) {
    final user = watch(authStateProvider).data?.value;
    return user != null ? Dashboard() : Login();
  }
}
