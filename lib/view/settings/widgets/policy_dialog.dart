import 'package:carmarket/view/constants/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class PrivacyPolicy extends StatelessWidget {
  PrivacyPolicy({
    Key? key,
    this.radius = 8,
    required this.mdFileName,
  })  : assert(
          mdFileName.contains('.md'),
          "The file must contain .md extension",
        ),
        super(key: key);

  final double radius;
  final String mdFileName;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: kGrey[400],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius),
      ),
      child: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: Future.delayed(
                const Duration(milliseconds: 150),
              ).then(
                (value) {
                  return rootBundle.loadString(
                    'assets/$mdFileName',
                  );
                },
              ),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Markdown(
                    data: snapshot.data.toString(),
                    styleSheet: MarkdownStyleSheet.fromTheme(
                      ThemeData(
                        textTheme: const TextTheme(
                          bodyText2: TextStyle(
                            fontSize: 16,
                            color: kBlack,
                          ),
                        ),
                      ),
                    ),
                  );
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
              ),
              alignment: Alignment.center,
              height: 50,
              width: double.infinity,
              child: const Text(
                "CLOSE",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
