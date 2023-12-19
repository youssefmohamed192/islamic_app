import 'package:flutter/material.dart';
import 'package:islamic_app/model/details_screen_args.dart';
import 'package:islamic_app/ui/screens/details_screen/details_screen.dart';
import 'package:islamic_app/utils/app_assets.dart';
import 'package:islamic_app/utils/constants.dart';

class AhadethTab extends StatelessWidget {

  List ahadthNames = List.generate(50, (index) {
    return "الحديث رقم ${index + 1 }";
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(flex: 3, child: Image.asset(AppAssets.hadethLogo)),
        const Divider(),
        Text("Hadeth Name",
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
                    child: Text(
                        ahadthNames[index],
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.titleSmall),
                  )),
            ))
      ],
    );
  }
}
