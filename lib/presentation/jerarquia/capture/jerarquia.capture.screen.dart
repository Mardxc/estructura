import 'package:dataprice/presentation/shared/Utils/validators.dart';
import 'package:dataprice/presentation/shared/custom.listtile.formfield.dart';
import 'package:dataprice/presentation/shared/theme.user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class JerarquiaCaptureScreen extends ConsumerWidget {
  JerarquiaCaptureScreen({super.key});

  final precioRegularController = TextEditingController();
  final precioOfertaController = TextEditingController();
  final descripcionOfertaController = TextEditingController();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('CATSUP DEL MONTE PET 370 GR'),
        ),
        persistentFooterAlignment: AlignmentDirectional.center,
        persistentFooterButtons: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: ThemeColors.primaryColor,
              minimumSize: Size(MediaQuery.of(context).size.width * 0.9, 50),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
            ),
            onPressed: () async {},
            child: const Text(
              'Guardar',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Arial',
              ),
            ),
          ),
        ],
        body: SingleChildScrollView(
          child: Center(
            child: SizedBox(
              width: size.width * 0.9,
              child: Column(
                children: [
                  const Card(
                    color: Colors.white,
                    elevation: 5,
                    child: ListTile(
                      leading: Icon(Icons.check_circle),
                      title: Text('CATSUP DEL MONTE PET 370 GR'),
                      subtitle: Text('75053895'),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ThemeColors.primaryColor,
                      minimumSize:
                          Size(MediaQuery.of(context).size.width * 0.9, 50),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                    ),
                    onPressed: () async {
                      context.push('/products-scan');
                    },
                    icon: const Icon(
                      Icons.camera_alt_outlined,
                      color: Colors.white,
                    ),
                    label: const Text(
                      'Validar código',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Arial',
                      ),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  Form(
                    child: Column(
                      children: [
                        CustomListtileFormfield(
                          title: const Text('Precio regular'),
                          body: TextFormField(
                            controller: precioRegularController,
                            validator: (value) =>
                                Validators.campoRequerido(value.toString()),
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.attach_money),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: const BorderSide(),
                              ),
                              filled: true,
                              hintText: '0.0',
                              fillColor: Colors.white70,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20.0),
                        CustomListtileFormfield(
                          title: const Text('Precio oferta'),
                          body: TextFormField(
                            controller: precioOfertaController,
                            validator: (value) =>
                                Validators.campoRequerido(value.toString()),
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.attach_money),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: const BorderSide(),
                              ),
                              filled: true,
                              hintText: '0.0',
                              fillColor: Colors.white70,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20.0),
                        CheckboxListTile(
                          value: true,
                          onChanged: (val) {},
                          title: const Text('¿Tiene otra promoción?'),
                        ),
                        const SizedBox(height: 20.0),
                        CustomListtileFormfield(
                          title: const Text('Tipo de promoción'),
                          body: DropdownButtonFormField(
                            value: '',
                            hint: const Text('Selecciona la promoción'),
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              border: OutlineInputBorder(
                                borderSide: const BorderSide(),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              filled: true,
                              fillColor: Colors.white,
                            ),
                            onChanged: (val) {},
                            items: const [
                              DropdownMenuItem(
                                value: '',
                                child: Text(
                                  'DropdownMenuItem',
                                  style: TextStyle(color: Colors.black),
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(height: 20.0),
                        CustomListtileFormfield(
                          title: const Text('Descripcion de la oferta'),
                          body: TextFormField(
                            controller: descripcionOfertaController,
                            validator: (value) =>
                                Validators.campoRequerido(value.toString()),
                            keyboardType: TextInputType.multiline,
                            maxLines: 3,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: const BorderSide(),
                              ),
                              filled: true,
                              label: const Text('Descripción...'),
                              fillColor: Colors.white70,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20.0),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
