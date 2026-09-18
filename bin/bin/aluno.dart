import 'dart:io';

class Aluno {
  String _nome;
  String _cor;
  DateTime _data;

  Aluno(this._nome, this._cor, this._data);

  @override
  String toString() {
    String dia = _data.day.toString();
    String mes = _data.month.toString();
    String ano = _data.year.toString();
    return 'nome: $_nome, cor: $_cor, data: $dia/$mes/$ano';
  }

  String get nome => _nome;
  String get cor => _cor;
  DateTime get data => _data;

  set nome(String nome) => _nome = nome;
  set cor(String cor) => _cor = cor;
  set data(DateTime data) => _data = data;
}

DateTime converterData(String texto) {
  var partes = texto.split('/');
  int dia = int.parse(partes[0]);
  int mes = int.parse(partes[1]);
  int ano = int.parse(partes[2]);
  return DateTime(ano, mes, dia);
}

void main(List<String> arguments) async {
  var arquivo = File('bin/bin/aluno2infob.csv');
  List<String> contents = [];
  List<Aluno> listaAluno = [];


  if (await arquivo.exists()) {
    contents = await arquivo.readAsLines();
    for (var i = 1; i < contents.length; i++) {
      var linha = contents[i];
      var dados = linha.split(',');
      if (dados.length >= 3) {
        String nome = dados[0];
        String cor = dados[1];
        DateTime data = converterData(dados[2]);
        listaAluno.add(Aluno(nome, cor, data));
      }
    }
  }
  for (var aluno in listaAluno) {
    print(aluno);
  }

  stdout.write('qual a cor: ');
  String? corDigitada = stdin.readLineSync();

  print('Alunos com a cor $corDigitada:');
  for (var aluno in listaAluno) {
    if (aluno.cor == corDigitada) {
      print(aluno.nome);
    }
  }

//codigo mais altenativo

/*  Map<String, List<String>> selecCor(List<Aluno> listaAluno) {
    Map<String, List<String>> mapa = {};
    for (var aluno in listaAluno) {
      mapa.putIfAbsent(aluno.cor, () => []);
      mapa[aluno.cor]!.add(aluno.nome);
    }
    return mapa;
}*/
  
/*  stdout.write('qual a cor: ');
  String? corDigitada = stdin.readLineSync();

  Map<String, List<String>> mapa = selecCor(listaAluno);

  if(corDigitada != null && mapa.containsKey(corDigitada)){
    print('aluno(s) com a cor $corDigitada: ');
    for(var nome in mapa[corDigitada]!){
      print(nome);
    }
  }*/
}