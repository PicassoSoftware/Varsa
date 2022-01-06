import 'package:FrontendBranchOffice/assets/const.dart';
import 'package:flutter/material.dart';

class Grade extends StatelessWidget {
  const Grade({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(30.0, 40.0, 0, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              "lib/assets/seller.jpg",
              fit: BoxFit.fill,
              width: 60.0,
              height: 60.0,
            ),
            const Divider(
              height: 60.0,
              color: Color(0xFF157575),
              thickness: 0.8,
              endIndent: 30.0,
            ),
            const Text(
              'Satıcı Bilgileri : ',
              style: TextStyle(
                color: Color(0xFF157575),
                letterSpacing: 3.0,
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            const Text(
              'Ayşe Yılmaz',
              style: TextStyle(
                color: Color(0xFF157575),
                letterSpacing: 2.0,
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 30.0,
            ),
            const Text(
              'Adres Bilgileri',
              style: TextStyle(
                color: Color(0xFF157575),
                letterSpacing: 2.0,
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            const Text(
              'Trabzon / Ortahisar / Konaklar Mah. / Ayşe Market',
              style: TextStyle(
                color: Color(0xFF157575),
                letterSpacing: 2.0,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 30.0,
            ),
            const Text(
              'HAKKIMDA ',
              style: TextStyle(
                color: Color(0xFF157575),
                letterSpacing: 2.0,
              ),
            ),
            const SizedBox(
              height: 7.0,
            ),
            Row(
              children: const [
                SizedBox(
                  width: 320,
                  child: Text(
                    'Yaklaşık 10 yıldır burada halka hizmet vermekteyim. Mahallemi çok seviyorum ve sizlere kalite vadediyorum.',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.0,
                      color: Color(0xFF157575),
                    ),
                  ),
                ),
              ],
            ),
            const Card(),
          ],
        ),
      ),
    );
  }
}
