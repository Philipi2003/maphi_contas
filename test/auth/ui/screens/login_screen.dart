import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_sign_in_web/web_only.dart';

class LoginScreen extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Text('Maphi'), Text("Contas")],
                ),
                SizedBox(
                  width: 200,
                  child: Text(
                    "Controle financeiro simples sincronizado em tempo real com uma planilha Google Sheets",
                  ),
                ),
              ],
            ),
          ),
          Padding(padding: const EdgeInsets.all(32.0), child: renderButton()),
        ],
      ),
    );
  }
}
