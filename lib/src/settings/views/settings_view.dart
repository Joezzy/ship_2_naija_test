import 'package:flutter/material.dart';
import 'package:ship_to_naija/core/apptheme.dart';
import 'package:ship_to_naija/core/sizeConfig.dart';
import 'package:ship_to_naija/src/settings/views/kyc_tab_view.dart';
import 'package:ship_to_naija/src/settings/views/profile_tab_view.dart';
import 'package:ship_to_naija/src/settings/views/security_tab_view.dart';
import 'package:toggle_switch/toggle_switch.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  int tabIndex = 0;

  final scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppTheme.backgroundColor,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(MySize.size10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Settings', style: AppTheme.formHeaderStyle()),
            const SizedBox(height: 20),
            Center(
              child: ToggleSwitch(
                minWidth: double.infinity,
                cornerRadius: 40,
                activeBgColors: [
                  [Colors.green[800]!],
                  [Colors.green[800]!],
                  [Colors.green[800]!],
                ],
                activeFgColor: Colors.white,
                inactiveBgColor: AppTheme.grey,
                inactiveFgColor: Colors.white,
                initialLabelIndex: tabIndex,
                totalSwitches: 3,
                labels: const ['Profile', 'KYC', 'Security'],
                radiusStyle: true,
                onToggle: (index) {
                  setState(() {
                    tabIndex = index!;
                  });
                  print('switched to: $index');
                  print('switched to: $tabIndex');
                },
              ),
            ),
            const SizedBox(height: 16),
            switch (tabIndex) {
              0 => const ProfileTab(),
              1 => const KycTabView(),
              2 => const SecurityTabView(),
              _ => Container()
            },
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
