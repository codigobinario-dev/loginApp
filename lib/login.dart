import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formkey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Obtener dimensiones de la pantalla
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    // Tamaños responsivos basados en el porcentaje de la pantalla
    final logoSize = screenWidth * 0.7; // 70% del ancho de la pantalla
    final horizontalPadding = screenWidth * 0.06; // 6% del ancho de la pantalla
    final verticalPadding = screenHeight * 0.02; // 2% del alto de la pantalla
    final fontSize = screenWidth * 0.04; // 4% del ancho de la pantalla (para texto base)
    final iconSize = screenWidth * 0.06; // 6% del ancho de la pantalla

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
          constraints: BoxConstraints(
            minHeight: screenHeight,
          ),
          child: Form(
            key: _formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Logo
                Column(
                  children: [
                    Image.asset(
                      'assets/logo.png',
                      width: logoSize,
                      height: logoSize,
                      fit: BoxFit.contain,
                    ),
                  ],
                ),

                // Campos de formulario
                Column(
                  children: [
                    TextFormField(
                      controller: _emailController,
                      style: TextStyle(
                        fontFamily: 'Kavoon',
                        fontSize: fontSize,
                      ),
                      decoration: InputDecoration(
                        labelText: 'Correo',
                        labelStyle: TextStyle(
                          fontFamily: 'Kavoon',
                          color: Colors.grey,
                          fontSize: fontSize * 0.9,
                        ),
                        prefixIcon: Icon(
                          Icons.email_rounded,
                          color: Colors.grey,
                          size: iconSize,
                        ),
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        contentPadding: EdgeInsets.symmetric(
                          vertical: verticalPadding,
                          horizontal: horizontalPadding * 0.5,
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Ingresa Correo';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: verticalPadding * 2),
                    TextFormField(
                      controller: _passwordController,
                      obscureText: _obscurePassword,
                      style: TextStyle(
                        fontFamily: 'Kavoon',
                        fontSize: fontSize,
                      ),
                      decoration: InputDecoration(
                        labelText: 'Contraseña',
                        labelStyle: TextStyle(
                          fontFamily: 'Kavoon',
                          color: Colors.grey,
                          fontSize: fontSize * 0.9,
                        ),
                        prefixIcon: Icon(
                          Icons.lock,
                          color: Colors.grey,
                          size: iconSize,
                        ),
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscurePassword
                                ? Icons.visibility_outlined
                                : Icons.visibility_off_outlined,
                            size: iconSize,
                          ),
                          onPressed: () {
                            setState(() {
                              _obscurePassword = !_obscurePassword;
                            });
                          },
                        ),
                        contentPadding: EdgeInsets.symmetric(
                          vertical: verticalPadding,
                          horizontal: horizontalPadding * 0.5,
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Ingresa una Contraseña';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: verticalPadding),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            'Registrate Aquí',
                            style: TextStyle(
                              color: Colors.blue[800],
                              fontSize: fontSize * 0.9,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: verticalPadding),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(vertical: verticalPadding * 1.5),
                          backgroundColor: Colors.blue[800],
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Text(
                          'Iniciar',
                          style: TextStyle(
                            fontFamily: 'Kavoon',
                            fontSize: fontSize * 1.1,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                // Otras opciones de login
                Column(
                  children: [
                    Row(
                      children: [
                        const Expanded(
                          child: Divider(
                            color: Colors.black,
                            thickness: 1.0,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: horizontalPadding * 0.5),
                          child: Text(
                            'Ó',
                            style: TextStyle(
                              fontSize: fontSize * 1.2,
                            ),
                          ),
                        ),
                        const Expanded(
                          child: Divider(
                            color: Colors.black,
                            thickness: 1.0,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: verticalPadding * 2),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                blurRadius: 5,
                                spreadRadius: 1,
                              ),
                            ],
                          ),
                          child: IconButton(
                            onPressed: () {},
                            icon: Image.asset(
                              'assets/google.png',
                              width: iconSize * 1.5,
                            ),
                          ),
                        ),
                        SizedBox(width: screenWidth * 0.12),
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                blurRadius: 5,
                                spreadRadius: 1,
                              ),
                            ],
                          ),
                          child: IconButton(
                            onPressed: () {},
                            icon: Image.asset(
                              'assets/facebook.png',
                              width: iconSize * 1.5,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: verticalPadding * 2),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Terminos y Condiciones',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: fontSize * 0.8,
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            'Ver',
                            style: TextStyle(
                              color: Colors.blue[800],
                              fontSize: fontSize * 0.8,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}