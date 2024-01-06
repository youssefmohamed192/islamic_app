import 'package:flutter/material.dart';
import 'package:islamic_app/providers/settings_provider.dart';
import 'package:islamic_app/utils/app_assets.dart';
import 'package:islamic_app/utils/app_colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class SebhaTab extends StatefulWidget {
  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  double angle = 0;
  int counter = 0;
  int curIndex = 0;
  late SettingsProvider provider;

  @override
  Widget build(BuildContext context) {
    provider = Provider.of(context);
    List<String> azkar = [
      AppLocalizations.of(context)!.subhanAllah,
      AppLocalizations.of(context)!.allahuAkbar,
      AppLocalizations.of(context)!.alhamdulillah
    ];
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        width: size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              children: [
                Container(
                    margin: EdgeInsets.only(top: size.height * .1),
                    child: Transform.rotate(
                      angle: angle,
                      child: Theme(
                        data: ThemeData(
                            splashColor: AppColors.transparent,
                            highlightColor: AppColors.transparent),
                        child: InkWell(
                          onTap: () {
                            clickOnImage();
                          },
                          child: provider.isLightMode()
                              ? Image.asset(
                                  AppAssets.sebhaBody,
                                  height: size.height * .26,
                                )
                              : Image.asset(AppAssets.sebhaBodyDark,
                                  height: size.height * .26),
                        ),
                      ),
                    )),
                Container(
                  margin: provider.curLocale == "en"
                      ? EdgeInsets.only(left: size.width * .24)
                      : EdgeInsets.only(right: size.width * .09),
                  child: provider.isLightMode()
                      ? Image.asset(
                          AppAssets.sebhaHead,
                          height: size.height * .12,
                        )
                      : Image.asset(AppAssets.sebhaHeadDark,
                          height: size.height * .12),
                )
              ],
            ),
            SizedBox(
              height: size.height * .04,
            ),
            Text(
              AppLocalizations.of(context)!.numberOfPraises,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            SizedBox(
              height: size.height * .028,
            ),
            Container(
                // padding: const EdgeInsets.all(22),
                padding: const EdgeInsets.only(top: 20),
                height: size.height * .09,
                width: size.width * .16,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(26),
                    color: provider.isLightMode()
                        ? AppColors.counterBoxColor
                        : AppColors.darkPrimary),
                child: Text(
                  "$counter",
                  style: provider.isLightMode()
                      ? Theme.of(context).textTheme.titleSmall
                      : Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(color: AppColors.white),
                  textAlign: TextAlign.center,
                )),
            SizedBox(
              height: size.height * .026,
            ),
            Container(
                padding: const EdgeInsets.all(22),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(36),
                    color: provider.isLightMode() ? AppColors.primary : AppColors.darkAccent),
                child: Text(
                  azkar[curIndex],
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(color: provider.isLightMode() ? AppColors.white : AppColors.darkPrimary),
                  textAlign: TextAlign.center,
                )),
          ],
        ),
      ),
    );
  }

  void clickOnImage() {
    angle += 2;
    if (counter == 33) {
      counter = 0;
      curIndex++;
      // using modulus operator instead of If cond.
      curIndex = curIndex % 3;
      // if (curIndex > 2) {
      //   curIndex = 0;
      // }
    }
    counter++;
    setState(() {});
  }
}
