import 'package:flutter/material.dart';
import 'package:islamic_app/model/details_screen_args.dart';
import 'package:islamic_app/ui/screens/details_screen/details_screen.dart';
import 'package:islamic_app/utils/app_assets.dart';
import 'package:islamic_app/utils/constants.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class QuranTab extends StatelessWidget {
  const QuranTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(flex: 3, child: Image.asset(AppAssets.quranLogo)),
        const Divider(),
        Text(AppLocalizations.of(context)!.suraName,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleMedium),
        const Divider(),
        Expanded(
            flex: 7,
            child: ListView.builder(
              itemCount: Constants.suraNames.length,
              itemBuilder: (context, index) => TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, DetailsScreen.routeName,
                        arguments: DetailsScreenArgs(
                            title: Constants.suraNames[index],
                            fileName: "${index + 1}.txt",
                            isQuran: true));
                  },
                  child: Text(Constants.suraNames[index],
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.titleSmall)),
            ))
      ],
    );
  }
}
