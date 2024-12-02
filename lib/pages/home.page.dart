import 'dart:developer';

import 'package:agora/core/core.dart';
import 'package:agora/data/data.dart';
import 'package:agora/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        backgroundColor: AppTheme.backgroundColor,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                image: DecorationImage(
                  colorFilter: ColorFilter.mode(
                    AppTheme.backgroundColor.withOpacity(0.8),
                    BlendMode.srcOver,
                  ),
                  fit: BoxFit.cover,
                  image: AssetImage(
                    Assets.images.agora.path,
                  ),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 8),
                  BlocBuilder<UserCubit, User>(
                    builder: (context, state) {
                      return Row(
                        children: [
                          AgoraAvatar(
                            image: state.avatar.image,
                            radius: 40,
                          ),
                          const SizedBox(width: 8),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const AgoraText(text: '¡Hola!', fontSize: 16),
                              AgoraText(
                                text: state.name,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ],
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
            ListTile(
              trailing: const Icon(Icons.arrow_forward_ios),
              leading: const Icon(Icons.exit_to_app_outlined),
              title: const AgoraText(text: 'Cerrar sesión', fontSize: 16, textAlign: TextAlign.left),
              onTap: () => context.read<UserCubit>().clearUserData(),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: const AgoraText(text: 'Historial de asambleas', fontSize: 16),
        actions: [
          BlocBuilder<UserCubit, User>(
            builder: (context, state) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () => _showCreateMenu(context),
                  child: AgoraAvatar(image: state.avatar.image),
                ),
              );
            },
          ),
        ],
      ),
      body: BlocListener<UserCubit, User>(
        listener: (context, state) {
          if (!state.isComplete) {
            context.go('/login');
          }
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppTheme.kPadding),
          child: CustomScrollView(
            slivers: [
              const SliverPadding(padding: EdgeInsets.all(16.0)),
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const AgoraText(
                      text: '¡Bienvenido a Agora!',
                      fontSize: 20,
                      textAlign: TextAlign.left,
                      fontWeight: FontWeight.bold,
                    ),
                    const SizedBox(height: 8),
                    const AgoraText(
                      text:
                          'Tu espacio para compartir, escuchar y decidir. Estamos aquí para ayudarte a hacer de cada asamblea una experiencia participativa y efectiva. ¡Comencemos!"',
                      fontSize: 16,
                      textAlign: TextAlign.left,
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          flex: 4,
                          child: ElevatedButton(
                            onPressed: () {
                              context.go('/form');
                              log('Create assembly');
                            },
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [AgoraText(text: 'Crear asamblea', fontSize: 12)],
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Flexible(
                          flex: 5,
                          child: OutlinedButton(
                            onPressed: () => _joinAssembly(context),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [AgoraText(text: 'Unirse con un código', fontSize: 12)],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SliverPadding(padding: EdgeInsets.all(16.0)),
              const SliverToBoxAdapter(
                child: AgoraText(
                  text: 'Historial de asambleas',
                  fontSize: 14,
                  textAlign: TextAlign.left,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SliverPadding(padding: EdgeInsets.all(16.0)),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final assembly = context.read<AssemblyCubit>().assemblies[index];
                    return Builder(builder: (context) {
                      if (assembly.status == 'En curso') {
                        return Animate(
                          onComplete: (controller) => controller.repeat(),
                          effects: [
                            ShimmerEffect(
                              color: AppTheme.emphasisColor,
                              duration: const Duration(seconds: 5),
                              curve: Curves.easeInOut,
                            ),
                          ],
                          child: ListTile(
                            title: AgoraText(
                              text: assembly.name,
                              fontSize: 16,
                              textAlign: TextAlign.left,
                              fontWeight: FontWeight.bold,
                            ),
                            subtitle: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AgoraText(
                                  text: assembly.date,
                                  fontSize: 16,
                                  textAlign: TextAlign.left,
                                ),
                                Text(
                                  assembly.status,
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontFamily: FontFamily.montserrat,
                                    color: _statusColor(assembly.status),
                                  ),
                                )
                              ],
                            ),
                            trailing: const Icon(Icons.arrow_forward_ios),
                            onTap: () => context.go('/meeting'),
                          ),
                        );
                      }

                      return ListTile(
                        title: AgoraText(
                          text: assembly.name,
                          fontSize: 16,
                          textAlign: TextAlign.left,
                          fontWeight: FontWeight.bold,
                        ),
                        subtitle: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AgoraText(
                              text: assembly.date,
                              fontSize: 16,
                              textAlign: TextAlign.left,
                            ),
                            Text(
                              assembly.status,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: FontFamily.montserrat,
                                color: _statusColor(assembly.status),
                              ),
                            )
                          ],
                        ),
                        trailing: const Icon(Icons.arrow_forward_ios),
                        onTap: () => context.go('/meeting'),
                      );
                    });
                  },
                  childCount: context.read<AssemblyCubit>().assemblies.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Color _statusColor(String status) {
  if (status == 'En curso') {
    return AppTheme.emphasisColor;
  } else if (status == 'Finalizada') {
    return AppTheme.errorColor;
  } else {
    return AppTheme.infoColor;
  }
}

Future<dynamic> _joinAssembly(BuildContext context) {
  return showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    builder: (context) {
      return SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(bottom: MediaQuery.viewInsetsOf(context).bottom),
          child: Padding(
            padding: const EdgeInsets.all(AppTheme.kPadding),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: AppTheme.kPadding),
                const AgoraText(
                  text: 'Unirse a una asamblea',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  textAlign: TextAlign.left,
                ),
                const SizedBox(height: 8.0),
                const AgoraText(
                  text: 'Ingresa el código de la asamblea para unirte a ella.',
                  fontSize: 16,
                  textAlign: TextAlign.left,
                ),
                const SizedBox(height: AppTheme.kPadding),
                TextField(
                  decoration: const InputDecoration(
                    labelText: 'Introduce el código de la asamblea',
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {},
                ),
                const SizedBox(height: AppTheme.kPadding),
                OutlinedButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [AgoraText(text: 'Ingresar a asamblea', fontSize: 20)],
                  ),
                ),
                OutlinedButton(
                  style: OutlinedButton.styleFrom(backgroundColor: AppTheme.emphasisColor),
                  onPressed: () => Navigator.pop(context),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [AgoraText(text: 'Cancelar', fontSize: 20)],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}

Future<dynamic> _showCreateMenu(BuildContext context) {
  return showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    builder: (context) {
      return SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(bottom: MediaQuery.viewInsetsOf(context).bottom),
          child: Padding(
            padding: const EdgeInsets.all(AppTheme.kPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: AppTheme.kPadding),
                const AgoraText(
                  text: 'Completa tu perfil',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  textAlign: TextAlign.left,
                ),
                const SizedBox(height: 8.0),
                const AgoraText(
                  text: 'Completa tu perfil para comenzar a crear asambleas y unirte a ellas.',
                  fontSize: 16,
                  textAlign: TextAlign.left,
                ),
                const SizedBox(height: AppTheme.kPadding),
                SizedBox(
                  width: MediaQuery.sizeOf(context).width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        flex: 2,
                        child: IconButton(
                          onPressed: () => _showAvatarMenu(context),
                          icon: Badge(
                            offset: const Offset(0, -10),
                            backgroundColor: AppTheme.backgroundColor,
                            label: const Icon(Icons.edit_outlined, size: 10),
                            alignment: Alignment.bottomRight,
                            child: BlocBuilder<UserCubit, User>(
                              builder: (context, state) {
                                return AgoraAvatar(radius: 30, image: state.avatar.image);
                              },
                            ),
                          ),
                        ),
                      ),
                      const Flexible(flex: 6, child: NameForm()),
                    ],
                  ),
                ),
                const SizedBox(height: AppTheme.kPadding),
                OutlinedButton(
                  onPressed: () {
                    context.read<UserCubit>().completeProfile();
                    Navigator.pop(context);
                  },
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [AgoraText(text: 'Guardar', fontSize: 20)],
                  ),
                ),
                OutlinedButton(
                  style: OutlinedButton.styleFrom(backgroundColor: AppTheme.emphasisColor),
                  onPressed: () => Navigator.pop(context),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [AgoraText(text: 'Cancelar', fontSize: 20)],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}

Future<dynamic> _showAvatarMenu(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        backgroundColor: AppTheme.backgroundColor,
        title: const AgoraText(text: 'Selecciona una imagen', fontSize: 16),
        content: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
              onTap: () {
                context.read<UserCubit>().updateAvatar(Assets.images.avatar1.path);
                Navigator.pop(context);
              },
              child: AgoraAvatar(image: Assets.images.avatar1, radius: 30),
            ),
            InkWell(
              onTap: () {
                context.read<UserCubit>().updateAvatar(Assets.images.avatar2.path);
                Navigator.pop(context);
              },
              child: AgoraAvatar(image: Assets.images.avatar2, radius: 30),
            ),
            InkWell(
              onTap: () {
                context.read<UserCubit>().updateAvatar(Assets.images.avatar3.path);
                Navigator.pop(context);
              },
              child: AgoraAvatar(image: Assets.images.avatar3, radius: 30),
            ),
            InkWell(
              onTap: () {
                context.read<UserCubit>().updateAvatar(Assets.images.avatar4.path);
                Navigator.pop(context);
              },
              child: AgoraAvatar(image: Assets.images.avatar4, radius: 30),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const AgoraText(text: 'Cancelar', fontSize: 16),
          ),
        ],
      );
    },
  );
}
