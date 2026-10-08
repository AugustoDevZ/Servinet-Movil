import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:servinet_movil/presentation/design/app_colors.dart';

class TecnicosProfilePage extends StatelessWidget {
  const TecnicosProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final instalaciones = [
      {
        'id': 'INST-001',
        'direccion': 'Av. América Norte 1234',
        'fecha': '07 Oct 2026',
        'puntos': 50,
      },
      {
        'id': 'INST-002',
        'direccion': 'Jr. Unión 456',
        'fecha': '05 Oct 2026',
        'puntos': 50,
      },
      {
        'id': 'INST-003',
        'direccion': 'Av. España 789',
        'fecha': '03 Oct 2026',
        'puntos': 50,
      },
      {
        'id': 'INST-004',
        'direccion': 'Calle Los Pinos 321',
        'fecha': '01 Oct 2026',
        'puntos': 50,
      },
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF7F9FC),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => context.go('/technicians'),
          icon: const Icon(Icons.arrow_back),
        ),
        title: const Text(
          'Mi actividad',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        backgroundColor: AppColors.background,
        foregroundColor: Colors.black87,
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildTechnicianHeader(),

              const SizedBox(height: 24),

              _buildStatistics(),

              const SizedBox(height: 30),

              const Text(
                'Instalaciones realizadas',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Colors.black87,
                ),
              ),

              const SizedBox(height: 6),

              const Text(
                'Historial de instalaciones completadas',
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),

              const SizedBox(height: 16),

              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: instalaciones.length,
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 12),
                itemBuilder: (context, index) {
                  final instalacion = instalaciones[index];

                  return _InstallationCard(
                    id: instalacion['id'] as String,
                    direccion: instalacion['direccion'] as String,
                    fecha: instalacion['fecha'] as String,
                    puntos: instalacion['puntos'] as int,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTechnicianHeader() {
    return Column(
      children: [
        Container(
          width: 90,
          height: 90,
          decoration: BoxDecoration(
            color: AppColors.primary.withValues(alpha: 0.12),
            shape: BoxShape.circle,
          ),
          child: Icon(Icons.person, size: 48, color: AppColors.primary),
        ),

        const SizedBox(height: 12),

        const Text(
          'Juan Técnico',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w700,
            color: Colors.black87,
          ),
        ),

        const SizedBox(height: 4),

        const Text(
          'Técnico',
          style: TextStyle(fontSize: 14, color: Colors.grey),
        ),
      ],
    );
  }

  Widget _buildStatistics() {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isTablet = constraints.maxWidth >= 600;

        return GridView.count(
          crossAxisCount: isTablet ? 4 : 2,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: isTablet ? 1.5 : 1.25,
          children: const [
            _StatisticCard(
              value: '24',
              label: 'Instalaciones',
              icon: Icons.home_work_outlined,
            ),
            _StatisticCard(
              value: '1,200',
              label: 'Puntos',
              icon: Icons.stars_outlined,
            ),
            _StatisticCard(
              value: '20',
              label: 'Completadas',
              icon: Icons.check_circle_outline,
            ),
            _StatisticCard(
              value: '4',
              label: 'Pendientes',
              icon: Icons.pending_actions_outlined,
            ),
          ],
        );
      },
    );
  }
}

class _StatisticCard extends StatelessWidget {
  final String value;
  final String label;
  final IconData icon;

  const _StatisticCard({
    required this.value,
    required this.label,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 24, color: AppColors.primary),

          const SizedBox(height: 8),

          Text(
            value,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: Colors.black87,
            ),
          ),

          const SizedBox(height: 4),

          Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 13, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}

class _InstallationCard extends StatelessWidget {
  final String id;
  final String direccion;
  final String fecha;
  final int puntos;

  const _InstallationCard({
    required this.id,
    required this.direccion,
    required this.fecha,
    required this.puntos,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              color: Colors.green.withValues(alpha: 0.12),
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.check, color: Colors.green, size: 22),
          ),

          const SizedBox(width: 12),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  id,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Colors.black87,
                  ),
                ),

                const SizedBox(height: 6),

                Text(
                  direccion,
                  style: const TextStyle(fontSize: 14, color: Colors.black54),
                ),

                const SizedBox(height: 4),

                Text(
                  fecha,
                  style: const TextStyle(fontSize: 13, color: Colors.grey),
                ),
              ],
            ),
          ),

          const SizedBox(width: 8),

          Text(
            '+$puntos pts',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: AppColors.primary,
            ),
          ),
        ],
      ),
    );
  }
}
