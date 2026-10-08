import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:servinet_movil/presentation/design/app_colors.dart';

class TecnicosInstalacionesPage extends StatefulWidget {
  const TecnicosInstalacionesPage({super.key});

  @override
  State<TecnicosInstalacionesPage> createState() => _InstalacionesPageState();
}

class _InstalacionesPageState extends State<TecnicosInstalacionesPage> {
  // Simula que el técnico tiene una instalación pendiente.
  bool tieneInstalacionPendiente = true;

  final List<Map<String, String>> pedidos = [
    {
      'id': 'INST-001',
      'cliente': 'Juan Pérez',
      'direccion': 'Av. América Norte 1234',
      'plan': 'Internet 200 Mbps',
      'estado': 'DISPONIBLE',
    },
    {
      'id': 'INST-002',
      'cliente': 'María López',
      'direccion': 'Jr. Unión 456',
      'plan': 'Internet 300 Mbps',
      'estado': 'DISPONIBLE',
    },
    {
      'id': 'INST-003',
      'cliente': 'Carlos Torres',
      'direccion': 'Mz. B Lt. 12',
      'plan': 'Internet 150 Mbps',
      'estado': 'DISPONIBLE',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7FAFC),

      appBar: AppBar(
        leading: IconButton(
          onPressed: () => context.go('/technicians'),
          icon: const Icon(Icons.arrow_back),
        ),
        title: const Text(
          'Instalaciones',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: AppColors.background,
        foregroundColor: AppColors.fontGroundSecondary,
        elevation: 0,
      ),

      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // =========================================================
            // INSTALACIÓN PENDIENTE
            // =========================================================

            if (tieneInstalacionPendiente)
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                child: _InstalacionPendiente(
                  direccion: 'Av. América Norte 1234, Trujillo',
                  onGenerarReporte: () {
                    // Posteriormente:
                    // context.go('/tecnicos/instalaciones/reporte');
                  },
                  onContactarCliente: () {
                    // Posteriormente:
                    // abrir WhatsApp / teléfono
                  },
                ),
              ),

            const SizedBox(height: 25),

            // =========================================================
            // TÍTULO DE PEDIDOS
            // =========================================================
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Pedidos de instalación',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1F2937),
                ),
              ),
            ),

            const SizedBox(height: 5),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Consulta y toma nuevos pedidos.',
                style: TextStyle(fontSize: 14, color: Color(0xFF6B7280)),
              ),
            ),

            const SizedBox(height: 15),

            // =========================================================
            // CARRUSEL
            // =========================================================
            Expanded(
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.fromLTRB(20, 5, 20, 20),
                itemCount: pedidos.length,
                separatorBuilder: (context, index) => const SizedBox(width: 15),
                itemBuilder: (context, index) {
                  final pedido = pedidos[index];

                  return _PedidoCard(
                    id: pedido['id']!,
                    cliente: pedido['cliente']!,
                    direccion: pedido['direccion']!,
                    plan: pedido['plan']!,
                    estado: pedido['estado']!,
                    onTomar: () {
                      _tomarInstalacion(pedido);
                    },
                    onInformacion: () {
                      _mostrarInformacion(pedido);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _tomarInstalacion(Map<String, String> pedido) {
    setState(() {
      tieneInstalacionPendiente = true;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Instalación ${pedido['id']} tomada correctamente'),
      ),
    );
  }

  void _mostrarInformacion(Map<String, String> pedido) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                pedido['id']!,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 15),

              Text('Cliente: ${pedido['cliente']}'),
              Text('Dirección: ${pedido['direccion']}'),
              Text('Plan: ${pedido['plan']}'),

              const SizedBox(height: 20),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Cerrar'),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

// =============================================================
// INSTALACIÓN PENDIENTE
// =============================================================

class _InstalacionPendiente extends StatelessWidget {
  final String direccion;
  final VoidCallback onGenerarReporte;
  final VoidCallback onContactarCliente;

  const _InstalacionPendiente({
    required this.direccion,
    required this.onGenerarReporte,
    required this.onContactarCliente,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: AppColors.primary.withOpacity(0.20)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 45,
                height: 45,
                decoration: BoxDecoration(
                  color: AppColors.primary.withOpacity(0.10),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(
                  Icons.location_on_outlined,
                  color: AppColors.primary,
                ),
              ),

              const SizedBox(width: 12),

              const Expanded(
                child: Text(
                  'Instalación pendiente',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1F2937),
                  ),
                ),
              ),

              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 5,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFF3CD),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text(
                  'PENDIENTE',
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF856404),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 18),

          const Text(
            'Dirección de instalación',
            style: TextStyle(fontSize: 12, color: Color(0xFF6B7280)),
          ),

          const SizedBox(height: 5),

          Text(
            direccion,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Color(0xFF1F2937),
            ),
          ),

          const SizedBox(height: 18),

          Row(
            children: [
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: onContactarCliente,
                  icon: const Icon(Icons.phone_outlined, size: 19),
                  label: const Text('Contactar cliente'),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: AppColors.primary,
                    side: const BorderSide(color: AppColors.primary),
                    padding: const EdgeInsets.symmetric(vertical: 13),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),

              const SizedBox(width: 10),

              Expanded(
                child: ElevatedButton.icon(
                  onPressed: onGenerarReporte,
                  icon: const Icon(Icons.description_outlined, size: 19),
                  label: const Text('Generar reporte'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: Colors.white,
                    elevation: 0,
                    padding: const EdgeInsets.symmetric(vertical: 13),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// =============================================================
// PEDIDO
// =============================================================

class _PedidoCard extends StatelessWidget {
  final String id;
  final String cliente;
  final String direccion;
  final String plan;
  final String estado;
  final VoidCallback onTomar;
  final VoidCallback onInformacion;

  const _PedidoCard({
    required this.id,
    required this.cliente,
    required this.direccion,
    required this.plan,
    required this.estado,
    required this.onTomar,
    required this.onInformacion,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 290,
      child: Container(
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 15,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    id,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1F2937),
                    ),
                  ),
                ),

                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFFE8F5E9),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    estado,
                    style: const TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF2E7D32),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 18),

            _PedidoInfo(icon: Icons.person_outline, text: cliente),

            const SizedBox(height: 10),

            _PedidoInfo(icon: Icons.location_on_outlined, text: direccion),

            const SizedBox(height: 10),

            _PedidoInfo(icon: Icons.wifi_outlined, text: plan),

            const Spacer(),

            const SizedBox(height: 15),

            OutlinedButton(
              onPressed: onInformacion,
              style: OutlinedButton.styleFrom(
                minimumSize: const Size(double.infinity, 42),
                foregroundColor: AppColors.primary,
                side: const BorderSide(color: AppColors.primary),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text('Más información'),
            ),

            const SizedBox(height: 8),

            ElevatedButton(
              onPressed: onTomar,
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 42),
                backgroundColor: AppColors.primary,
                foregroundColor: Colors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text('Tomar instalación'),
            ),
          ],
        ),
      ),
    );
  }
}

// =============================================================
// INFORMACIÓN DEL PEDIDO
// =============================================================

class _PedidoInfo extends StatelessWidget {
  final IconData icon;
  final String text;

  const _PedidoInfo({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 19, color: AppColors.primary),

        const SizedBox(width: 9),

        Expanded(
          child: Text(
            text,
            style: const TextStyle(fontSize: 13, color: Color(0xFF4B5563)),
          ),
        ),
      ],
    );
  }
}
