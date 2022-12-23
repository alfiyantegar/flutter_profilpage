import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(const MyApp());
}

class NumbersWidget extends StatelessWidget {
  const NumbersWidget({super.key});

  @override
  Widget build(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          buildButton(text: 'Projects', value: 100),
          buildDivider(),
          buildButton(text: 'Following', value: 1000),
          buildDivider(),
          buildButton(text: 'Followers', value: 10000),
        ],
      );
}

Widget buildDivider() => Container(
      height: 24,
      child: const VerticalDivider(),
    );

Widget buildButton({
  required String text,
  required int value,
}) =>
    MaterialButton(
      padding: const EdgeInsets.symmetric(vertical: 4),
      onPressed: () {},
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Text(
            '$value',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 2),
          Text(
            text,
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  final double coverHeight = 280;
  final double profileHeight = 144;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          buildTop(),
          buildContent(),
        ],
      ),
    );
  }

  Widget buildContent() => Column(
        children: [
          const SizedBox(height: 8),
          const Text(
            'Alfiyan Tegar Budi Satria',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.w300),
          ),
          const Text(
            'Flutter Pemula',
            style: TextStyle(
                fontSize: 20, color: Color.fromARGB(255, 158, 153, 153)),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildSocialIcon(FontAwesomeIcons.facebook),
              const SizedBox(width: 12),
              buildSocialIcon(FontAwesomeIcons.twitter),
              const SizedBox(width: 12),
              buildSocialIcon(FontAwesomeIcons.instagram),
              const SizedBox(width: 12),
            ],
          ),
          const SizedBox(height: 16),
          const Divider(),
          const SizedBox(height: 16),
          const NumbersWidget(),
          const SizedBox(height: 16),
          const Divider(),
          const SizedBox(height: 16),
          about(),
          const SizedBox(height: 32),
        ],
      );

  Widget buildTop() {
    final bottom = profileHeight / 2;
    final top = coverHeight - profileHeight / 2;

    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(bottom: bottom),
          child: coverimg(),
        ),
        Positioned(
          top: top,
          child: profileimg(),
        ),
      ],
    );
  }

  Widget coverimg() => Container(
        color: Colors.grey,
        width: double.infinity,
        height: coverHeight,
        child: FittedBox(
          fit: BoxFit.cover,
          child: Image.asset('assets/images/programming2.jpg'),
        ),
      );

  Widget profileimg() => CircleAvatar(
        radius: 70.0,
        backgroundColor: Colors.grey.shade800,
        backgroundImage: const NetworkImage(
            'https://scontent.fsub8-1.fna.fbcdn.net/v/t39.30808-6/320158232_1662733810811847_3515705582195314194_n.jpg?stp=cp0_dst-jpg_e15_q65_s173x172&_nc_cat=110&ccb=1-7&_nc_sid=7aed08&_nc_ohc=idDbuTccNZoAX8dpnaP&_nc_ht=scontent.fsub8-1.fna&oh=00_AfATJAOMO3bc-cucPJ1nHNn6XX6GTx_WihFMdniqHLd_5Q&oe=63A99789'),
      );

  Widget about() => Column(
        children: const <Widget>[
          Text(
            'Tentang Saya',
            style:
                TextStyle(fontSize: 20, color: Color.fromARGB(255, 36, 35, 35)),
          ),
          Text(''),
          Text(
            'Saya adalah Mahasiswa Semester 3 dari Universitas Duta Bangsa dan saya mengambil prodi Sistem Informasi, Hobby saya menonton anime, saya suka tantangan dan suka mempelajari hal hal yang menarik buat saya.',
            style:
                TextStyle(fontSize: 14, color: Color.fromARGB(255, 36, 35, 35)),
          ),
        ],
      );

  Widget buildSocialIcon(IconData icon) => CircleAvatar(
        radius: 25,
        child: Material(
          shape: const CircleBorder(),
          clipBehavior: Clip.hardEdge,
          color: Colors.transparent,
          child: InkWell(
            onTap: () {},
            child: Center(child: Icon(icon, size: 32)),
          ),
        ),
      );
}
