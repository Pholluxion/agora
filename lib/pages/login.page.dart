import 'dart:math';

import 'package:agora/data/data.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';

import 'package:agora/core/core.dart';
import 'package:agora/widgets/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<UserCubit, User>(
        listener: (context, state) {
          if (state.isComplete) {
            context.go('/');
          }
        },
        child: SafeArea(
          top: false,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Assets.images.agora.image(
                fit: BoxFit.cover,
                height: MediaQuery.sizeOf(context).height,
              ),
              Container(
                width: double.infinity,
                height: MediaQuery.sizeOf(context).height,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      AppTheme.backgroundColor.withOpacity(0.1),
                      AppTheme.backgroundColor.withOpacity(0.3),
                      AppTheme.backgroundColor.withOpacity(0.5),
                      AppTheme.backgroundColor.withOpacity(0.7),
                      AppTheme.backgroundColor.withOpacity(0.9),
                      AppTheme.backgroundColor,
                    ],
                  ),
                ),
              ),
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: AppTheme.kPadding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(height: kToolbarHeight),
                      const AgoraLogotipo(),
                      const ListTile(
                        title: AgoraText(
                          text: '¡Bienvenido a Agora!',
                          fontSize: 30,
                          textAlign: TextAlign.left,
                          fontWeight: FontWeight.bold,
                        ),
                        subtitle: AgoraText(
                          text: 'Donde cada opinión cuenta.',
                          fontSize: 20,
                          textAlign: TextAlign.left,
                        ),
                      ),
                      const SizedBox(height: AppTheme.kPadding),
                      ListTile(
                        title: const AgoraText(
                          text: 'Interacción en vivo',
                          fontSize: 16,
                          textAlign: TextAlign.left,
                          fontWeight: FontWeight.bold,
                        ),
                        subtitle: const AgoraText(
                          text: 'Participa en tiempo real',
                          fontSize: 16,
                          textAlign: TextAlign.left,
                        ),
                        trailing: const Icon(Icons.live_tv_outlined),
                        onTap: () {},
                      ),
                      ListTile(
                        title: const AgoraText(
                          text: 'Acceso fácil',
                          fontSize: 16,
                          textAlign: TextAlign.left,
                          fontWeight: FontWeight.bold,
                        ),
                        subtitle: const AgoraText(
                          text: 'Ingresa con un solo clic',
                          fontSize: 16,
                          textAlign: TextAlign.left,
                        ),
                        trailing: const Icon(Icons.fast_forward_outlined),
                        onTap: () {},
                      ),
                      ListTile(
                        title: const AgoraText(
                          text: 'Participación estructurada',
                          fontSize: 16,
                          textAlign: TextAlign.left,
                          fontWeight: FontWeight.bold,
                        ),
                        subtitle: const AgoraText(
                          text: 'Participa en encuestas y preguntas',
                          fontSize: 16,
                          textAlign: TextAlign.left,
                        ),
                        trailing: const Icon(Icons.question_answer_outlined),
                        onTap: () {},
                      ),
                      ListTile(
                        title: const AgoraText(
                          text: 'Votaciones seguras',
                          fontSize: 16,
                          textAlign: TextAlign.left,
                          fontWeight: FontWeight.bold,
                        ),
                        subtitle: const AgoraText(
                          text: 'Vota de forma segura y anónima',
                          fontSize: 16,
                          textAlign: TextAlign.left,
                        ),
                        trailing: const Icon(Icons.how_to_vote_outlined),
                        onTap: () {},
                      ),
                      ListTile(
                        title: const AgoraText(
                          text: 'Resúmenes automáticos',
                          fontSize: 16,
                          textAlign: TextAlign.left,
                          fontWeight: FontWeight.bold,
                        ),
                        subtitle: const AgoraText(
                          text: 'Recibe un resumen al finalizar',
                          fontSize: 16,
                          textAlign: TextAlign.left,
                        ),
                        trailing: const Icon(Icons.report_outlined),
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      persistentFooterButtons: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppTheme.kPadding),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton(
                onPressed: () => _showCreateMenu(context),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [AgoraText(text: 'Crear usuario', fontSize: 20)],
                ),
              ),
              OutlinedButton(
                onPressed: () {
                  final faker = Faker();
                  context.read<UserCubit>().updateName(faker.person.name());
                  context.read<UserCubit>().updateAvatar(_getRandomAvatar().path);
                  context.read<UserCubit>().completeProfile();
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AgoraText(text: 'Anónimo', fontSize: 20),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
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
                mainAxisSize: MainAxisSize.min,
                children: [
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
                      children: [
                        AgoraText(text: 'Crear usuario', fontSize: 20),
                      ],
                    ),
                  ),
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      backgroundColor: AppTheme.emphasisColor,
                    ),
                    onPressed: () => Navigator.pop(context),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AgoraText(text: 'Cancelar', fontSize: 20),
                      ],
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
          content: Wrap(
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
}

AssetGenImage _getRandomAvatar() {
  final random = Random();

  final avatar = random.nextInt(4);

  switch (avatar) {
    case 0:
      return Assets.images.avatar1;
    case 1:
      return Assets.images.avatar2;
    case 2:
      return Assets.images.avatar3;
    case 3:
      return Assets.images.avatar4;
    default:
      return Assets.images.avatar1;
  }
}
