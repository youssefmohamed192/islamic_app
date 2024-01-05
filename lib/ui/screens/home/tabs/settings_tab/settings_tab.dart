import 'package:flutter/material.dart';
import 'package:islamic_app/providers/settings_provider.dart';
import 'package:islamic_app/utils/app_colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class SettingsTab extends StatefulWidget {
  const SettingsTab({super.key});

  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  bool arSwitch = false;
  bool darkSwitch = false;
  late SettingsProvider provider;

  @override
  Widget build(BuildContext context) {
    provider = Provider.of(context);
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            AppLocalizations.of(context)!.settings,
            style: Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: buildSettingsRow(AppLocalizations.of(context)!.arabic, context, arSwitch, (newValue) {
              arSwitch = newValue;
               if(arSwitch){
                 provider.setCurLocale("ar");
               }else{
                 provider.setCurLocale("en");
               }
            }),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: buildSettingsRow(AppLocalizations.of(context)!.darkMode, context, darkSwitch, (newValue) {
              darkSwitch = newValue;
              setState(() {});
            }),
          )
        ],
      ),
    );
  }

  Widget buildSettingsRow(String tittle, BuildContext context, bool switchBool,
      Function(bool) onChange) {
    return Row(
      children: [
        Text(
          tittle,
          style: Theme.of(context).textTheme.bodySmall,
        ),
        Spacer(),
        Switch(
          value: switchBool,
          onChanged: onChange,
          activeColor: AppColors.primary,
        )
      ],
    );
  }
}
