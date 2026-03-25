import 'package:empreinte/homepage.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  final double score;

  const ResultPage({super.key, required this.score});

  @override
  Widget build(BuildContext context) {
    String resultat =
        '''بصمتك البيئية :
لقد تحصلت على : ${(180 * score).floor()} نقطة 
هذا يعني أنك تستخدم ما يقارب : ${(score * 3.4).toStringAsFixed(1)} قطع أرض مساحتها 10000 متر مربع لتلبية احتياجاتك.
ولكن يمكنك بالتأكيد تحقيق نتائج أفضل. لو تصرّف الجميع مثلك، لاحتجنا إلى ${(score * 3.4 / 1.9).ceil()} كوكب على الأقل لتلبية احتياجاتنا.''';

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
              elevation: 6,
              child: Padding(
                padding: const EdgeInsets.all(30),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      "لقد أتممت الإختبار",
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "${(180 * score).floor()} نقطة !",
                      style: const TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(resultat, style: const TextStyle(fontSize: 20)),
                    const SizedBox(height: 30),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 40,
                          vertical: 16,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (_) => const HomePage()),
                          (route) => false,
                        );
                      },
                      child: const Text("الرجوع إلى البداية"),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
