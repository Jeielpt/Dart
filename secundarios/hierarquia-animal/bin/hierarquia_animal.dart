/**
 * Classe principal que executa o programa
 * @author Leonardo
 * @version 1.0
 * @since 26/05/2026
 */
import 'package:hierarquia_animal/anda.dart';
import 'package:hierarquia_animal/gato.dart';
import 'package:hierarquia_animal/lobo.dart';
import 'package:hierarquia_animal/pato.dart';
import 'package:hierarquia_animal/cobra.dart';
import 'package:hierarquia_animal/ave.dart';
import 'package:hierarquia_animal/animal.dart';
import 'package:hierarquia_animal/rato.dart';
import 'package:hierarquia_animal/padal.dart';
import 'package:hierarquia_animal/voa.dart';

import 'dart:io';


void main() {
  const int SAIR = 8;
  int opcao;
  do {
    montaMenu();
    opcao = leOpcao();

    switch (opcao) {
      case 1:
        Lobo lobo = Lobo(leNome());
        print(lobo);
        break;
      case 2:
        Gato gato = Gato(leNome());
        print(gato);
      case 3:
        Cobra cobra = Cobra(leNome());
        print(cobra);
      case 4:
        Pato pato = Pato(leNome());
        print(pato);
      case 5:
        Pardal pardal = Pardal(leNome());
        pardal.subir(10);
        pardal.recuar(2, 2);
        print(pardal);
        animalanda(pardal);
        animalvoar(pardal);
      case 6:
        Rato rato = Rato(leNome());
        print(rato);
        animalanda(rato);
      case 7:
        testarAnimais();
      case SAIR:
        print("Saindo...");
        break;
      default:
        print("Opção inválida!");
    }
  } while (opcao != SAIR);

}

String leNome() {
  stdout.write("Digite o nome do animal: ");
  String? input = stdin.readLineSync();
  if (input != null) {
    return input;
  } else {
    return "Sem-Nome-Ainda";
  }
}

int leOpcao() {
  String? input = stdin.readLineSync();
  int opcao=0;
  if (input != null) {
    opcao = int.parse(input);
  }
  return opcao;
}

void testarAnimal(Animal animal) {
  print("O nome deste animal é ${animal.nome} e ele é um ${animal.runtimeType}");
  if (animal is Gato) {
    animal.ronronar();
  }
}
void animalanda(Anda andar) {
  Animal a = andar as Animal;
  print("O animal é ${a.nome} e ele é anda");
}
void animalvoar(Voa voar) {
  Animal v = voar as Animal;
  print("O animal é ${v.nome} e ele é voar");
}


void montaMenu() {
  print("\nMenu:");
  print("1. Cadastrar um lobo");
  print("2. Cadastrar um gato");
  print("3. Cadastrar um cobra");
  print("4. Cadastrar um pato");
  print("5. Cadastrar um pardal");
  print("6. Cadastrar um rato");
  print("7. anda");
  print("8. mostrar");
  print("9. Sair");
  stdout.write("Digite uma opção: ");
}

// Exercícios anteriores
void testarAnimais() {
  print("\nAnimais:");
  Gato gato = Gato("Fluflu");
  print(gato.nome);
  print(gato.emitirSom());
  gato.ronronar();

  Ave pato = Pato("Donald");
  print(pato.nome);
  print(pato.emitirSom());

  Lobo lobo = Lobo("Lobo de Fogo");
  print(lobo.nome);
  print(lobo.emitirSom());
  
  Rato rato = Rato("Mine");
  print(rato.nome);
  print(rato.emitirSom());
  
  Pardal pardal = Pardal("andorinhas");
  print(pardal.nome);
  print(pardal.emitirSom());

  var cobra = Cobra("Naja");
  print(cobra.nome);
  print(cobra.emitirSom());

  print("\nTestando animais:");
  testarAnimal(gato);
  testarAnimal(pato);
  testarAnimal(lobo);
  testarAnimal(cobra);
  testarAnimal(rato);
  testarAnimal(pardal);
}

  void exibirPardal(Pardal p) {
  print('Nome:      ${p.nome}'); 
  print('Posição X: ${p.posx}');
  print('Posição Y: ${p.posy}');
  print('Altura:    ${p.altura}');
  print('Som:       ${p.emitirSom()}');
} 

  void exibirrato(Rato r) {
  print('Nome:      ${r.nome}'); 
  print('Posição X: ${r.posx}');
  print('Posição Y: ${r.posy}');
  print('Som:       ${r.emitirSom()}');
}  
