import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:servinet_movil/presentation/design/app_colors.dart';

class TecnicosAnunciosPage extends StatelessWidget {
  const TecnicosAnunciosPage({super.key});

  @override
  Widget build(BuildContext context) {
    final anuncios = [
      {
        'autor': 'Administración',
        'titulo': 'Mantenimiento del sistema',
        'contenido': 'El sistema estará en mantenimiento el día de hoy desde las 10:00 p. m. hasta las 11:00 p. m.',
        'fecha': '07 Oct 2026',
        'prioridad': Priority.alta,
      },
      {
        'autor': 'Coordinación Técnica',
        'titulo': 'Nuevos pedidos de instalación',
        'contenido': 'Se han registrado nuevos pedidos de instalación disponibles para los técnicos.',
        'fecha': '06 Oct 2026',
        'prioridad': Priority.media,
      },
      {
        'autor': 'Administración',
        'titulo': 'Actualización de procedimientos',
        'contenido': 'Recuerda revisar los nuevos procedimientos para el registro de instalaciones.',
        'fecha': '04 Oct 2026',
        'prioridad': Priority.baja,
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
          'Anuncios',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black87,
        elevation: 0,
      ),
      body: SafeArea(
        child: anuncios.isEmpty
            ? const _EmptyAnnouncements()
            : ListView.separated(
                padding: const EdgeInsets.all(20),
                itemCount: anuncios.length,
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 14),
                itemBuilder: (context, index) {
                  final anuncio = anuncios[index];

                  return _AnnouncementCard(
                    autor: anuncio['autor'] as String,
                    titulo: anuncio['titulo'] as String,
                    contenido: anuncio['contenido'] as String,
                    fecha: anuncio['fecha'] as String,
                    prioridad: anuncio['prioridad'] as Priority,
                  );
                },
              ),
      ),
    );
  }
}

enum Priority { baja, media, alta }

class _AnnouncementCard extends StatelessWidget {
  final String autor;
  final String titulo;
  final String contenido;
  final String fecha;
  final Priority prioridad;

  const _AnnouncementCard({
    required this.autor,
    required this.titulo,
    required this.contenido,
    required this.fecha,
    required this.prioridad,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _PriorityIcon(prioridad: prioridad),

              const SizedBox(width: 12),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      titulo,
                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w700,
                        color: Colors.black87,
                      ),
                    ),

                    const SizedBox(height: 5),

                    Text(
                      'Por $autor',
                      style: const TextStyle(fontSize: 13, color: Colors.grey),
                    ),
                  ],
                ),
              ),

              _PriorityBadge(prioridad: prioridad),
            ],
          ),

          const SizedBox(height: 16),

          Text(
            contenido,
            style: const TextStyle(
              fontSize: 14,
              height: 1.5,
              color: Colors.black54,
            ),
          ),

          const SizedBox(height: 16),

          Row(
            children: [
              const Icon(
                Icons.calendar_today_outlined,
                size: 15,
                color: Colors.grey,
              ),

              const SizedBox(width: 6),

              Text(
                fecha,
                style: const TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _PriorityIcon extends StatelessWidget {
  final Priority prioridad;

  const _PriorityIcon({required this.prioridad});

  @override
  Widget build(BuildContext context) {
    IconData icon;

    switch (prioridad) {
      case Priority.alta:
        icon = Icons.priority_high;
        break;

      case Priority.media:
        icon = Icons.warning_amber_outlined;
        break;

      case Priority.baja:
        icon = Icons.info_outline;
        break;
    }

    return Container(
      width: 44,
      height: 44,
      decoration: BoxDecoration(
        color: _priorityColor().withValues(alpha: 0.12),
        shape: BoxShape.circle,
      ),
      child: Icon(icon, color: _priorityColor(), size: 23),
    );
  }

  Color _priorityColor() {
    switch (prioridad) {
      case Priority.alta:
        return Colors.red;

      case Priority.media:
        return Colors.orange;

      case Priority.baja:
        return AppColors.primary;
    }
  }
}

class _PriorityBadge extends StatelessWidget {
  final Priority prioridad;

  const _PriorityBadge({required this.prioridad});

  @override
  Widget build(BuildContext context) {
    String texto;

    switch (prioridad) {
      case Priority.alta:
        texto = 'Alta';
        break;

      case Priority.media:
        texto = 'Media';
        break;

      case Priority.baja:
        texto = 'Baja';
        break;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: _priorityColor().withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        texto,
        style: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w700,
          color: _priorityColor(),
        ),
      ),
    );
  }

  Color _priorityColor() {
    switch (prioridad) {
      case Priority.alta:
        return Colors.red;

      case Priority.media:
        return Colors.orange;

      case Priority.baja:
        return AppColors.primary;
    }
  }
}

class _EmptyAnnouncements extends StatelessWidget {
  const _EmptyAnnouncements();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.campaign_outlined,
              size: 64,
              color: Colors.grey.shade400,
            ),

            const SizedBox(height: 16),

            const Text(
              'No hay anuncios',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),

            const SizedBox(height: 6),

            const Text(
              'Aquí aparecerán los anuncios enviados por la administración.',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
