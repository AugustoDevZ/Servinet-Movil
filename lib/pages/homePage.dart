import 'package:flutter/material.dart';
import 'package:servinet_movil/components/backgorundLogin.dart';
import 'package:servinet_movil/components/textField.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const Color primaryColor = Color(0xFF2CA6EF);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7FAFC),
      body: Stack(
        children: [
          Positioned.fill(
            child: Container(color: const Color.fromARGB(255, 221, 236, 245)),
          ),

          SafeArea(
            child: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(24),
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 430),
                  child: Container(
                    padding: const EdgeInsets.all(30),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(24),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.08),
                          blurRadius: 30,
                          offset: const Offset(0, 10),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/images/ServinetLogo.png',
                              width: 60,
                              height: 60,
                              fit: BoxFit.contain,
                            ),

                            const SizedBox(width: 8),

                            const Text(
                              'Servinet',
                              style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                color: primaryColor,
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 10),

                        const Text(
                          'Accede a tu cuenta',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xFF6B7280),
                          ),
                        ),

                        const SizedBox(height: 35),

                        const PrimaryTextField(
                          hint: 'Ingresa tu correo',
                          isPasswordField: false,
                          iconUse: Icons.email_outlined,
                        ),

                        const SizedBox(height: 18),

                        const PrimaryTextField(
                          hint: 'Ingresa tu contraseña',
                          isPasswordField: true,
                          iconUse: Icons.lock_outline,
                        ),

                        const SizedBox(height: 12),

                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {},
                            style: TextButton.styleFrom(
                              foregroundColor: primaryColor,
                            ),
                            child: const Text('¿Olvidaste tu contraseña?'),
                          ),
                        ),

                        const SizedBox(height: 15),

                        SizedBox(
                          height: 52,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: primaryColor,
                              foregroundColor: Colors.white,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: const Text(
                              'Acceder a la cuenta',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 25),

                        const Text(
                          'Sistema apra técnicos',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 12,
                            color: Color(0xFF9CA3AF),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
