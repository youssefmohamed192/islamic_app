import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamic_app/model/details_screen_args.dart';
import 'package:islamic_app/providers/settings_provider.dart';
import 'package:islamic_app/utils/app_assets.dart';
import 'package:islamic_app/utils/app_colors.dart';
import 'package:provider/provider.dart';

class DetailsScreen extends StatefulWidget {
  static const String routeName = "detailsScreen";

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  late DetailsScreenArgs arguments;
  late SettingsProvider provider;

  String fileContent = "";

  @override
  Widget build(BuildContext context) {
    provider = Provider.of(context);
    var size = MediaQuery.of(context).size;
    arguments = ModalRoute.of(context)!.settings.arguments as DetailsScreenArgs;
    if (fileContent.isEmpty) readFile();

    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill,
                image: provider.isLightMode()
                    ? const AssetImage(AppAssets.backgroundImage)
                    : const AssetImage(AppAssets.darkBackgroundImage))),
        child: Scaffold(
          appBar: AppBar(title: const Text("Islami")),
          body: fileContent.isEmpty
              ? const Center(child: CircularProgressIndicator())
              : SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: size.height * .07),
                      Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: size.width * .07),
                          height: size.height * .74,
                          margin:
                              EdgeInsets.symmetric(horizontal: size.width * .068),
                          decoration: BoxDecoration(
                              color: provider.isLightMode()
                                  ? AppColors.lessWhite
                                  : AppColors.darkPrimary,
                              borderRadius: BorderRadius.all(Radius.circular(16))),
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Text(
                                    arguments.isQuran
                                        ? "سورة ${arguments.title}"
                                        : arguments.title,
                                    textAlign: TextAlign.center,
                                    style: Theme.of(context).textTheme.titleSmall),
                                const Divider(thickness: 1.5),
                                Text(
                                  fileContent,
                                  textAlign: TextAlign.center,
                                  textDirection: TextDirection.rtl,
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                              ],
                            ),
                          )),
                    ],
                  )),
        ));
  }

  void readFile() async {
    String file = await rootBundle.loadString(arguments.isQuran
        ? "assets/files/quran/${arguments.fileName}"
        : "assets/files/ahadeth/${arguments.fileName}");
    fileContent = file;
    List<String> fileLines = file.split("\n");
    for (int i = 0; i < fileLines.length; i++) {
      fileLines[i] += arguments.isQuran ? "(${i + 1})" : " ";
    }
    fileContent = fileLines.join();
    setState(() {});
  }
}
