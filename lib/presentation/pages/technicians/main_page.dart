import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:servinet_movil/presentation/components/logout_button.dart';
import 'package:servinet_movil/presentation/components/tecnico_option.dart';
import 'package:servinet_movil/presentation/design/app_colors.dart';

class TecnicosPage extends StatefulWidget {
  const TecnicosPage({super.key});

  @override
  State<TecnicosPage> createState() => _TecnicosPageState();
}

class _TecnicosPageState extends State<TecnicosPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

      appBar: AppBar(
        title: const Text(
          'Técnicos',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.fontGroundPrimary,
        elevation: 0,
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Panel de técnicos',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1F2937),
                ),
              ),

              const SizedBox(height: 8),

              const Text(
                'Gestiona tus instalaciones y actividades.',
                style: TextStyle(fontSize: 15, color: Color(0xFF6B7280)),
              ),

              const SizedBox(height: 25),

              TecnicoOption(
                icon: Icons.assignment_outlined,
                title: 'Instalaciones',
                description: 'Consulta y toma pedidos de instalación.',
                onTap: () {
                  context.push('/technicians/orders');
                },
              ),

              const SizedBox(height: 15),

              const SizedBox(height: 15),

              TecnicoOption(
                icon: Icons.description_outlined,
                title: 'Anuncios',
                description:
                    'Mantente informado con los anuncios de la empresa.',
                onTap: () {
                  context.push('/technicians/advertisements');
                },
              ),
              const SizedBox(height: 15),

              TecnicoOption(
                icon: Icons.description_outlined,
                title: 'Mi perfil',
                description: 'Echa uin vistazo a tu eprfil y enterate de tus nuevas estadísticas.',
                onTap: () {
                  context.push('/technicians/my-profile');
                },
              ),
              const SizedBox(height: 15),
              LogoutButton(
                onPressed: () {
                  context.go('/login');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
