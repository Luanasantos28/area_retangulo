import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController _controllerBase = TextEditingController();
  TextEditingController _controllerAltura = TextEditingController();
  String _txtRes = "";
  void _calcular() {
    double? base = double.tryParse(_controllerBase.text);
    double? altura = double.tryParse(_controllerAltura.text);
    if (base == null || altura == null) {
      setState(() {
        _txtRes =
            ("Número ivalido, digite número maiores que 0 e utilizando (.)");
      });
    } else {
      setState(() {
        double result = base*altura;
        _txtRes = result.toString();
        _limparCampos();
      });
    }
  }

  void _limparCampos() {
    _controllerBase.clear();
    _controllerAltura.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Base  x Altura"),
        backgroundColor: Color.fromARGB(255, 141, 61, 100),
      ),
      body: Container(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: Padding(
                  padding: EdgeInsets.only(bottom: 32),
                  child: Image(
                    image: AssetImage("imagens/img.png"),
                    width: 200,
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: EdgeInsets.only(bottom: 32),
                  child: Text(
                    "Calcular a área do retângulo",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 25,
                        color: Color.fromARGB(255, 141, 61, 100),
                        decoration: TextDecoration.underline),
                  ),
                ),
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: "Valor da base "),
                style: TextStyle(
                  fontSize: 25,
                ),
                controller: _controllerBase,
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: "Valor da altura"),
                style: TextStyle(
                  fontSize: 25,
                ),
                controller: _controllerAltura,
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.all(10),
                      backgroundColor: Color.fromARGB(255, 141, 61, 100),
                      textStyle: TextStyle(fontSize: 25)),
                  onPressed: _calcular,
                  child: Text(
                    "Calcular",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    _txtRes,
                    style: TextStyle(fontSize: 25, color: Color.fromARGB(255, 141, 61, 100),),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
