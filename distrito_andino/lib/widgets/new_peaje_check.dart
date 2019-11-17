import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function addTx;
  final codigoController = TextEditingController();
  final nombreController = TextEditingController();

  NewTransaction(this.addTx);

  void submitData()
  {

    final enteredTitle = nombreController.text;
    final enteredCode = codigoController.text;

    if(enteredTitle.isEmpty || int.parse(enteredCode) <= 0)
    {
      return;
    }

    addTx(
            int.parse(codigoController.text),
            nombreController.text
          );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Codigo'),
              controller: codigoController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submitData(),
              // onChanged: (val) {
              //   titleInput = val;
              // },
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Nombre'),
              controller: nombreController,
              onSubmitted: (_) => submitData()
              // onChanged: (val) => amountInput = val,
            ),
            FlatButton(
              child: Text('Registrar paso por peaje'),
              textColor: Colors.purple,
              onPressed: submitData,
            ),
          ],
        ),
      ),
    );
  }
}