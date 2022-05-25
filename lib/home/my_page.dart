import 'package:apimarvel/models/character.dart';
import 'package:apimarvel/service/http_provider.dart';
import 'package:flutter/material.dart';

class MyPage extends StatefulWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  List<Character> herois = [];

  @override
  void initState() {
    _buscaHerois();
    super.initState();
  }

  void _buscaHerois() async {
    var httpProvider = HttpProvider();
    var result = await httpProvider.getApi();
    setState(() {
      herois = result.data!.results!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Heróis Marvel',
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search),
            )
          ],
        ),
      ),
      body: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Image.asset(
              'assets/imgs/herois.jpg',
              fit: BoxFit.fill,
            ),
          ),
          Container(
            color: Colors.black.withOpacity(0.50),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
          ),
          ListView.builder(
            itemCount: herois.length,
            itemBuilder: (context, index) {
              var heroi = herois[index];
              return ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  backgroundImage: _getImagem(heroi),
                ),
                title: Text(
                  heroi.name ?? '',
                  style: const TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 15,
                    color: Colors.white70,
                  ),
                ),
                subtitle: Text(
                  heroi.description ?? '',
                  style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 10,
                    color: Colors.white70,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  NetworkImage _getImagem(Character character) {
    return NetworkImage(
        '${character.thumbnail!.path}.${character.thumbnail!.extension}');
  }
}
