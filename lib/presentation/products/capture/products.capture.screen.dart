import 'package:dataprice/domain/model/request/products.capture.request.model.dart';
import 'package:dataprice/presentation/products/products.provider.dart';
import 'package:dataprice/presentation/shared/Utils/validators.dart';
import 'package:dataprice/presentation/shared/custom.listtile.formfield.dart';
import 'package:dataprice/presentation/shared/theme.user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductsCaptureScreen extends ConsumerWidget {
  ProductsCaptureScreen({super.key});

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
            onPressed: () async {
              final obj = ProductsCaptureRequestModel(
                  precioRegular: precioRegularController.text,
                  precioOferta: precioOfertaController.text,
                  otraPromocion: ref.watch(changeOtraPromocionProvider),
                  tipoPromocion: ref.watch(changePromocionSelectProvider),
                  descripcionOferta: descripcionOfertaController.text);
              final response = ref.watch(saveProductCaptureProvider(obj));
            },
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
                          value: ref.watch(changeOtraPromocionProvider),
                          onChanged: (val) => ref
                              .read(changeOtraPromocionProvider.notifier)
                              .changeValue(val),
                          title: const Text('¿Tiene otra promoción?'),
                        ),
                        const SizedBox(height: 20.0),
                        AnimatedSwitcher(
                          duration: Durations.medium2,
                          child: ref.watch(changeOtraPromocionProvider)
                              ? CustomListtileFormfield(
                                  title: const Text('Tipo de promoción'),
                                  body: DropdownButtonFormField(
                                    value: ref
                                        .watch(changePromocionSelectProvider),
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
                                    onChanged: (val) => ref
                                        .read(changePromocionSelectProvider
                                            .notifier)
                                        .changeValue(val),
                                    items: const [
                                      DropdownMenuItem(
                                        value: '',
                                        child: Text(
                                          'DropdownMenuItem',
                                          style: TextStyle(color: Colors.black),
                                        ),
                                      ),
                                      DropdownMenuItem(
                                        value: '1',
                                        child: Text(
                                          '1',
                                          style: TextStyle(color: Colors.black),
                                        ),
                                      ),
                                      DropdownMenuItem(
                                        value: '2',
                                        child: Text(
                                          '2',
                                          style: TextStyle(color: Colors.black),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              : const SizedBox.shrink(),
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
