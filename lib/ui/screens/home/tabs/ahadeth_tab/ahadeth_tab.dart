import 'package:flutter/material.dart';
import 'package:islamic_app/model/details_screen_args.dart';
import 'package:islamic_app/providers/settings_provider.dart';
import 'package:islamic_app/ui/screens/details_screen/details_screen.dart';
import 'package:islamic_app/utils/app_assets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islamic_app/utils/app_colors.dart';
import 'package:provider/provider.dart';

class AhadethTab extends StatelessWidget {
  late SettingsProvider provider;
  List ahadthNames = List.generate(50, (index) {
    return "الحديث رقم ${index + 1}";
  });

  @override
  Widget build(BuildContext context) {
    provider = Provider.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(flex: 3, child: Image.asset(AppAssets.hadethLogo)),
        const Divider(),
        Text(AppLocalizations.of(context)!.hadithName,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleMedium),
        const Divider(),
        Expanded(
            flex: 7,
            child: ListView.builder(
              itemCount: ahadthNames.length,
              itemBuilder: (context, index) => TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, DetailsScreen.routeName,
                        arguments: DetailsScreenArgs(
                            title: ahadthNames[index],
                            fileName: "h${index + 1}.txt",
                            isQuran: false));
                  },
                  child: SingleChildScrollView(
                    child: Text(ahadthNames[index],
                        textAlign: TextAlign.center,
                        style: provider.isLightMode()
                            ? Theme.of(context).textTheme.titleSmall
                            : Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(color: AppColors.white)),
                  )),
            ))
      ],
    );
  }
}
