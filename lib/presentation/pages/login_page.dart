import 'package:flutter/material.dart';
import 'package:servinet_movil/application/usecase/SessionUseCase.dart';
import 'package:servinet_movil/domain/exception/ResponseInvalidFormat.dart';
import 'package:servinet_movil/domain/exception/UnauthorizedException.dart';
import 'package:servinet_movil/presentation/components/text_field.dart';
import 'package:servinet_movil/presentation/controller/login_controller.dart';
import 'package:servinet_movil/presentation/design/app_colors.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final LoginController loginController = LoginController();
  String errorMessage = "";

  @override
  void initState() {
    super.initState();
    verificarSesion();
  }

  Future<void> verificarSesion() async {
    if (!mounted) return;
    debugPrint('-- -- ----- verificando session');
    try {
      bool result = await SessionUseCase.isActiveSessionUser();
      if (result) {
        context.go('/technicians');
        return;
      }
      debugPrint('-- -- ----- Session vencida o nunca inició sesion');
    } on RersponseInvalidFormat catch (e) {
      debugPrint('-- -- ----- Error al procesar tu usuario $e');
      setState(() {
        errorMessage = 'Error al procesar tu usuario';
      });
      return;
    } on UnauthorizedException catch (e) {
      debugPrint(' --- -- -- -- Error al verificar la sesión: $e');
    }
  }

  Future<void> iniciarSesion() async {
    bool result = await loginController.iniciarSesion(
      emailController.text,
      passwordController.text,
    );

    if (result) {
      context.go('/technicians');
      return;
    }

    setState(() {
      errorMessage = 'Una credencial inválida';
    });
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

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
                                color: AppColors.primary,
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 10),

                        const Text(
                          'Accede a tu cuenta',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Color(0xFF6B7280),
                          ),
                        ),
                        Text(
                          errorMessage,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 12,
                            color: Color(0xFFCC3014),
                          ),
                        ),
                        const SizedBox(height: 35),

                        // CORREO
                        PrimaryTextField(
                          hint: 'Ingresa tu correo',
                          isPasswordField: false,
                          iconUse: Icons.email_outlined,
                          controller: emailController,
                        ),

                        const SizedBox(height: 18),

                        PrimaryTextField(
                          hint: 'Ingresa tu contraseña',
                          isPasswordField: true,
                          iconUse: Icons.lock_outline,
                          controller: passwordController,
                        ),

                        const SizedBox(height: 12),

                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {},
                            style: TextButton.styleFrom(
                              foregroundColor: AppColors.primary,
                            ),
                            child: const Text('¿Olvidaste tu contraseña?'),
                          ),
                        ),

                        const SizedBox(height: 15),
                        SizedBox(
                          height: 52,
                          child: ElevatedButton(
                            onPressed: iniciarSesion,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primary,
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

                        const SizedBox(height: 30),

                        const Text(
                          'Sistema para técnicos',
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
