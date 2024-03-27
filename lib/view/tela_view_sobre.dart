// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class SobreView extends StatefulWidget {
  const SobreView({super.key});

  @override
  State<SobreView> createState() => _SobreViewState();
}

class _SobreViewState extends State<SobreView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Sobre',
          style: TextStyle(fontSize: 35, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Color(0xFF6495ED),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
          child: Flexible(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(
                      color: Color(0xFF6495ED),
                      style: BorderStyle.solid,
                      width: 2,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.file_present,
                        size: 50,
                        color: Color(0xFF6495ED),
                      ),
                      Text(
                        'Sobre o Aplicativo',
                        style: TextStyle(
                          fontSize: 30,
                          color: Color(0xFF6495ED),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(40),
                        child: Text(
                          'Gerencie sua lista de lembretes e a modifique como bem desejar.\n'
                          'Escreva um lembrete para um compromisso ou simplesmente faça uma\n' 
                          'lista de afazeres em um dia ou hora em específico.',
                          style: TextStyle(
                            fontSize: 15,
                          ),
                          maxLines: null,
                          softWrap: true,
                        ),
                      ),
                      Text(
                        'Desenvolvedor',
                        style: TextStyle(
                          fontSize: 30,
                          color: Color(0xFF6495ED),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Color(0xFF6495ED),
                            width: 2,
                          ),
                        ),
                        child: Image.asset(
                          'lib/assets/images/dev.jpg',
                          scale: 1.0,
                          fit: BoxFit.cover,
                          width: 150,
                          height: 150,
                        ),
                      ),
                      Text(
                        'Alexandre Monteiro Sabbag de Souza',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}