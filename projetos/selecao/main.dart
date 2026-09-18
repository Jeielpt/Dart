// disciplina: Desenvolvimento de Sistemas
// descrição: TAD Seleção
// autor(es): Jeiel e Gabriel

import '../selecao.dart';
import 'dart:io';

void main() {
  print('Informe o país:');
  String pais = stdin.readLineSync()!;

  print('Informe o técnico:');
  String tecnico = stdin.readLineSync()!;

  print('Informe os títulos:');
  int titulos = int.parse(stdin.readLineSync()!);

  Selecao s = Selecao(tecnico, pais, titulos);
  s.exibirDados();

  print('\nInforme o apelido (enter para ingnorar ou nao tem):');
  String apelido = stdin.readLineSync()!;
  s.apelido = apelido;

  print('Atualizado:');
  s.exibirDados();
}