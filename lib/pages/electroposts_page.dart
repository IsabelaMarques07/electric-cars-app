import 'package:flutter/material.dart';
import 'package:stellantis/api/eletropostos_api.dart';
import 'package:stellantis/models/electropost.dart';

class ElectropostsPage extends StatefulWidget {
  const ElectropostsPage({Key? key}) : super(key: key);

  @override
  State<ElectropostsPage> createState() => _ElectropostsPageState();
}

class _ElectropostsPageState extends State<ElectropostsPage> {
  late Future<List<Eletroposto>> _futureEletropostos;

  @override
  void initState() {
    final api = EletropostosApi();
    _futureEletropostos = api.listElectroposts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Padding(
      padding: const EdgeInsets.only(
        left: 20,
        top: 20,
        right: 20,
        bottom: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Eletropostos disponíveis", 
            style: TextStyle(
              color: const Color.fromRGBO(24, 19 , 31, 1),
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),),
            const SizedBox(height:10),
            const Text("Encontre eletropostos mais próximos de você em São Paulo.",
              style: TextStyle(
                color: const Color.fromRGBO(24, 19 , 31, 1),
                fontSize: 20,
                fontWeight: FontWeight.normal,
              ),),
          Expanded(
            child: FutureBuilder<List<Eletroposto>>(
              future: _futureEletropostos,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  var eletropostos = snapshot.data ?? [];
                  return ListView.separated(
                    itemCount: eletropostos.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.only(
                            left: 16, top: 16, right: 16, bottom: 0),
                        padding: const EdgeInsets.only(
                            left: 16, top: 16, right: 16, bottom: 16),
                        decoration:
                            BoxDecoration(color: Colors.white, boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: const Offset(
                                0, 3), // changes position of shadow
                          )
                        ]),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.2,
                                  child: Image.asset('assets/images/car.png'),
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.5,
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          eletropostos[index].nome,
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          eletropostos[index].endereco,
                                          style: TextStyle(fontSize: 14),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          children: [
                                            Icon(Icons.phone, color: Colors.green, size: 24,),
                                            Container(
                                              padding: const EdgeInsets.only(
                                                  left: 8,
                                                  top: 6,
                                                  right: 8,
                                                  bottom: 6),
                                              decoration: BoxDecoration(
                                                  color: Color.fromRGBO(
                                                      237, 237, 227, 1),
                                                  borderRadius:
                                                      BorderRadius.circular(8)),
                                              child: Text(
                                                "Tel:. " +
                                                    eletropostos[index]
                                                        .telefone,
                                                style: TextStyle(
                                                  fontSize: 16,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ]),
                                ),
                              ],
                            ),
                            const SizedBox(height: 16,),
                            Row(
                              children: [
                                Text(
                                  "Conectores: ",
                                  style: TextStyle(fontSize: 14),
                                ),
                                for (var item in eletropostos[index].conectores)
                                  Container(
                                    padding: const EdgeInsets.only(
                                        left: 6, top: 4, right: 6, bottom: 4),
                                    decoration: BoxDecoration(
                                        color: Color.fromRGBO(237, 237, 227, 1),
                                        borderRadius: BorderRadius.circular(8)),
                                    child: Text(
                                      item,
                                      style: TextStyle(
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              eletropostos[index].informacoes,
                              style: TextStyle(fontSize: 14),
                            ),
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const Divider();
                    },
                  );
                }
              },
            ),
          )
        ],
      ),
    ));
  }
}
