import 'package:agora/data/data.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:intl/intl.dart';

class AssemblyCubit extends HydratedCubit<List<Assembly>> {
  AssemblyCubit() : super([]);

  final List<Assembly> _assemblies = [
    Assembly(
      id: '3',
      name: 'Asamblea de bienvenida',
      status: 'En curso',
      description: '',
      date: DateFormat('dd MMMM, HH:mm').format(DateTime.now().subtract(const Duration(hours: 1))),
    ),
    const Assembly(
      id: '1',
      name: 'Asamblea Trimestral',
      status: 'Próxima',
      description: '',
      date: 'Hoy, 19:00',
    ),
    const Assembly(
      id: '2',
      name: 'Asamblea Extraordinaria',
      status: 'Finalizada',
      description: '',
      date: '12 de septiembre, 19:00 - 21:00',
    ),
  ];

  List<Assembly> get assemblies => _assemblies;

  void addAssembly(Assembly assembly) {
    _assemblies.add(assembly);
    emit(_assemblies);
  }

  void removeAssembly(Assembly assembly) {
    _assemblies.remove(assembly);
    emit(_assemblies);
  }

  @override
  List<Assembly>? fromJson(Map<String, dynamic> json) {
    return (json['assemblies'] as List).map((e) => Assembly.fromJson(e)).toList();
  }

  @override
  Map<String, dynamic>? toJson(List<Assembly> state) {
    return {'assemblies': state.map((e) => e.toJson()).toList()};
  }
}
