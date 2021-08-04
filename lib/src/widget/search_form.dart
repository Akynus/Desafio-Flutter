import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';

class SearchForm extends StatefulWidget {
  const SearchForm({Key? key}) : super(key: key);

  @override
  _SearchFormState createState() => _SearchFormState();
}

class _SearchFormState extends State<SearchForm> {
  late TextEditingController _controller;

  @override
  void initState() {
    _controller = MaskedTextController(mask: '00.000.000/0000-00');
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: 400),
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          TextFormField(
            controller: _controller,
            decoration: InputDecoration(hintText: "CNPJ"),
            style: Theme.of(context).textTheme.headline6,
          ),
          SizedBox(height: 20),
          FloatingActionButton.extended(
            onPressed: () {},
            icon: Icon(Icons.search),
            label: Text("Consultar CNPJ"),
          ),
          SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: RichText(
              text: TextSpan(
                text: "Nao possui um CNPJ? ",
                style: Theme.of(context).textTheme.bodyText2,
                children: [
                  TextSpan(
                    text: "Cadastre um aqui",
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                    ),
                    recognizer: TapGestureRecognizer()..onTap = () {},
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
