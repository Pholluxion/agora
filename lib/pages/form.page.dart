import 'package:agora/core/core.dart';
import 'package:agora/widgets/widgets.dart';
import 'package:flutter/material.dart';

class FormPage extends StatelessWidget {
  const FormPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AgoraText(text: 'Crear una nueva asamblea', fontSize: 16),
      ),
      body: const FormWidget(),
    );
  }
}

class FormWidget extends StatefulWidget {
  const FormWidget({super.key});

  @override
  State<FormWidget> createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  Set<String> selected = {'Público'};
  List<Widget> rules = [];
  TextEditingController ruleController = TextEditingController();

  void addRule(String rule) {
    setState(() {
      ruleController.clear();
      rules.add(
        ListTile(
          title: Text('${rules.length + 1}: $rule'),
          trailing: IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              setState(() {
                rules.removeLast();
              });
            },
          ),
        ),
      );
    });
  }

  void removeRule(int index) {
    setState(() {
      rules.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 8),
              const AgoraText(
                text: 'Crear nueva asamblea',
                fontSize: 20,
                textAlign: TextAlign.left,
                fontWeight: FontWeight.bold,
              ),
              const SizedBox(height: 8),
              const AgoraText(
                text: 'Por favor, completa la siguiente información para crear tu asamblea',
                fontSize: 16,
                textAlign: TextAlign.left,
              ),
              const SizedBox(height: 16.0),
              const AgoraText(
                text: 'Crear una nueva asamblea',
                fontSize: 16.0,
                textAlign: TextAlign.left,
                fontWeight: FontWeight.bold,
              ),
              const SizedBox(height: 8.0),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Nombre de la asamblea',
                ),
              ),
              const SizedBox(height: 16.0),
              const AgoraText(
                text: 'Detalles de la asamblea',
                fontSize: 16.0,
                textAlign: TextAlign.left,
                fontWeight: FontWeight.bold,
              ),
              const SizedBox(height: 8.0),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Descripción',
                ),
              ),
              const SizedBox(height: 16.0),
              const AgoraText(
                text: 'Fecha y hora de la asamblea',
                fontSize: 16.0,
                textAlign: TextAlign.left,
                fontWeight: FontWeight.bold,
              ),
              const SizedBox(height: 8.0),
              TextFormField(
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    onPressed: () {
                      showDatePicker(
                        context: context,
                        helpText: 'Selecciona la fecha',
                        firstDate: DateTime.now(),
                        lastDate: DateTime.now().add(
                          const Duration(days: 30),
                        ),
                      );
                    },
                    icon: const Icon(Icons.calendar_today),
                  ),
                  labelText: 'Fecha',
                ),
              ),
              const SizedBox(height: 8.0),
              TextFormField(
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    onPressed: () {
                      showTimePicker(
                        helpText: 'Selecciona la hora',
                        context: context,
                        initialTime: TimeOfDay.now(),
                        initialEntryMode: TimePickerEntryMode.inputOnly,
                      );
                    },
                    icon: const Icon(Icons.access_time),
                  ),
                  labelText: 'Hora',
                ),
              ),
              const SizedBox(height: 16.0),
              const AgoraText(
                text: 'Tipo de Acceso',
                fontSize: 16.0,
                textAlign: TextAlign.left,
                fontWeight: FontWeight.bold,
              ),
              const SizedBox(height: 8.0),
              SegmentedButton(
                selected: selected,
                onSelectionChanged: (value) {
                  setState(() {
                    selected = value;
                  });
                },
                segments: [
                  ButtonSegment(
                    value: 'Público',
                    label: SizedBox(
                      width: MediaQuery.sizeOf(context).width * 0.4,
                      child: const AgoraText(text: 'Público', fontSize: 16.0),
                    ),
                  ),
                  ButtonSegment(
                    value: 'Privado',
                    label: SizedBox(
                      width: MediaQuery.sizeOf(context).width * 0.4,
                      child: const AgoraText(text: 'Privado', fontSize: 16.0),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16.0),
              const AgoraText(
                text: 'Reglas de la asamblea',
                fontSize: 16.0,
                textAlign: TextAlign.left,
                fontWeight: FontWeight.bold,
              ),
              const SizedBox(height: 8.0),
              TextFormField(
                controller: ruleController,
                decoration: const InputDecoration(
                  labelText: 'Reglas',
                ),
              ),
              ...List.from(rules),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () => addRule(ruleController.text),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AgoraText(
                      text: 'Agregar regla',
                      fontSize: 15.0,
                    )
                  ],
                ),
              ),
              const SizedBox(height: 16.0),
              const AgoraText(
                text: 'Adjuntar archivo',
                fontSize: 16.0,
                textAlign: TextAlign.left,
                fontWeight: FontWeight.bold,
              ),
              const SizedBox(height: 8.0),
              ElevatedButton(
                onPressed: () {},
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AgoraText(
                      text: 'Adjuntar',
                      fontSize: 15.0,
                    )
                  ],
                ),
              ),
              const SizedBox(height: 16.0),
              Divider(color: AppTheme.textColor),
              const SizedBox(height: 48.0),
              ElevatedButton(
                onPressed: () {
                  _upsDialog(context);
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AgoraText(
                      text: 'Crear asamblea',
                      fontSize: 15.0,
                    )
                  ],
                ),
              ),
              const SizedBox(height: 8.0),
              OutlinedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AgoraText(
                      text: 'Cancelar',
                      fontSize: 15.0,
                    )
                  ],
                ),
              ),
              const SizedBox(height: 16.0),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    ruleController.dispose();
    super.dispose();
  }
}

Future<dynamic> _upsDialog(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        backgroundColor: AppTheme.backgroundColor,
        title: const Text('Ups!'),
        content: const Text('Esta funcionalidad aún no está disponible.'),
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const AgoraText(
              text: 'Entendido',
              fontSize: 16,
            ),
          ),
        ],
      );
    },
  );
}
