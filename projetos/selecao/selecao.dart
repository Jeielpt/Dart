// disciplina: Desenvolvimento de Sistemas
// descrição: TAD Seleção
// autor(es): Jeiel e Gabriel

class Selecao {
  String _pais;
  String _tecnico;
  int _titulos;
  String? _apelido;

  Selecao(this._tecnico, this._pais, this._titulos);

  String get tecnico => _tecnico;
  String get pais => _pais;
  int get titulos => _titulos;
  String? get apelido => _apelido;

  set titulos(int value) {
    if (value < 0) {
      print('Erro');
    } else {
      _titulos = value;
    }
  }

  set tecnico(String value) {
    if (value.isEmpty) {
      print('Erro');
    } else {
      _tecnico = value;
    }
  }

  set pais(String value) {
    if (value.isEmpty) {
      print('Erro');
    } else {
      _pais = value;
    }
  }

  set apelido(String? value) {
    _apelido = value;
  }

  void exibirDados() {
    print('País:    $_pais');
    print('Técnico: $_tecnico');
    print('Títulos: $_titulos');
    if (_apelido == null ) {
      print('Apelido: (não informado)');
    } else if (_apelido!.isEmpty){
      print('Apelido: (não informado/não tem)');
    } else {
      print('Apelido: $_apelido');
    }
  }
}