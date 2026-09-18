import '../Copa do Mundo.lib/estadio_copa.dart';
import '../Copa do Mundo.lib/pais_copa.dart';
import '../Copa do Mundo.lib/partida.dart';
import '../Copa do Mundo.lib/selecao_copa.dart';

void main() {
  List<String> selecoes = [];
  List<String> estadio = [];

  var s1 = Selecao('a', 'brasil');
  var s2 = Selecao('b', 'AM');


  try {
    var e1 = Estadio('USA', 120398);
    var e2 = Estadio('UFA', 121234);
    var p1 = Partida(s1, s2, e1, 2, 11);

    selecoes.add('c');
    selecoes.add('d');
    print('$selecoes cadastradas');

    estadio.add('ASD');
    estadio.add('USB');
    print('$estadio cadastradas');
    
    print(p1.resultado());

  } catch (e) {
    print('Ocorreu um erro no campeonato: $e');
  }
}
