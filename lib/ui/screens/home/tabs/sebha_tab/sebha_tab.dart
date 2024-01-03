import 'package:flutter/material.dart';
import 'package:islamic_app/utils/app_assets.dart';
import 'package:islamic_app/utils/app_colors.dart';

class SebhaTab extends StatefulWidget {
  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  double angle = 0;
  int counter = 0;
  int curIndex = 0;
  List<String> azkar = ["Subhan Allah", "Allahu akbar", "Alhamdulillah"];

  @override
  Widget build(BuildContext context) {
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
                          child: Image.asset(
                            AppAssets.sebhaBody,
                            height: size.height * .26,
                          ),
                        ),
                      ),
                    )),
                Container(
                  margin: EdgeInsets.only(left: size.width * .24),
                  child: Image.asset(
                    AppAssets.sebhaHead,
                    height: size.height * .12,
                  ),
                )
              ],
            ),
            SizedBox(
              height: size.height * .04,
            ),
            Text(
              "Number of praises",
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
                    color: AppColors.counterBoxColor),
                child: Text(
                  "$counter",
                  style: Theme.of(context).textTheme.titleSmall,
                  textAlign: TextAlign.center,
                )),
            SizedBox(
              height: size.height * .026,
            ),
            Container(
                padding: const EdgeInsets.all(22),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(36),
                    color: AppColors.primary),
                child: Text(
                  azkar[curIndex],
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(color: AppColors.white),
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
