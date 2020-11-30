import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _aController = new TextEditingController();
  final _bController = new TextEditingController();
  int resultado = 0;
  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = TextStyle(fontSize: 20, fontWeight: FontWeight.bold);
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text(
          'Suma',
          style: TextStyle(color: Colors.black, fontSize: 25),
        ),
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Ingrese dos números a sumar:',
                style: textStyle,
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 60),
                child: buildTextFormFieldA(),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                '+',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 60),
                child: buildTextFormFieldB(),
              ),
              SizedBox(
                height: 20,
              ),
              RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18)),
                onPressed: () => {
                  setState(() {
                    sumar();
                  })
                },
                child: Text(
                  'Calcular',
                  style: textStyle,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Resultado:',
                style: textStyle,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                '$resultado',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                height: 20,
              ),
              RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18)),
                onPressed: () {
                  setState(() {
                    resultado = 0;
                    _aController.clear();
                    _bController.clear();
                  });
                },
                child: Text(
                  'C',
                  style: textStyle,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  TextFormField buildTextFormFieldB() {
    return TextFormField(
      controller: _bController,
      keyboardType: TextInputType.number,
      inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
      textAlign: TextAlign.center,
      decoration: InputDecoration(
          hintText: 'Ingrese un número',
          contentPadding: EdgeInsets.symmetric(horizontal: 20),
          border: InputBorder.none,
          enabledBorder:
              OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
          focusedBorder:
              OutlineInputBorder(borderRadius: BorderRadius.circular(30))),
    );
  }

  TextFormField buildTextFormFieldA() {
    return TextFormField(
      controller: _aController,
      keyboardType: TextInputType.number,
      inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
      textAlign: TextAlign.center,
      decoration: InputDecoration(
          hintText: 'Ingrese un número',
          contentPadding: EdgeInsets.symmetric(horizontal: 20),
          border: InputBorder.none,
          enabledBorder:
              OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
          focusedBorder:
              OutlineInputBorder(borderRadius: BorderRadius.circular(30))),
    );
  }

  void sumar() {
    if (_aController.text.isEmpty && _bController.text.isEmpty) {
      resultado = 0;
    } else if (_aController.text.isEmpty) {
      resultado = int.parse(_bController.text);
    } else if (_bController.text.isEmpty) {
      resultado = int.parse(_aController.text);
    } else {
      resultado = int.parse(_aController.text) + int.parse(_bController.text);
    }
    FocusScope.of(context).unfocus(); // Ocultar teclado
  }
}
