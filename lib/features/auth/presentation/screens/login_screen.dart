import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/routes/app_routes.dart';
import '../../../../models/user_model.dart';
import '../../../../widgets/app_logo.dart';
import '../../../../widgets/custom_button.dart';
import '../../../../widgets/custom_text_field.dart';

/// Authentication Screen Placeholder for FARMIGO.
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  UserRole _selectedRole = UserRole.farmer;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isObscure = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _onSignInPressed() {
    // Navigates to home dashboard screen foundation
    Navigator.of(context).pushReplacementNamed(AppRoutes.home);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(AppColors.paddingLarge),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 440),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(AppColors.paddingLarge),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const AppLogo(),
                      const SizedBox(height: AppColors.paddingLarge),

                      Text(
                        AppStrings.selectRole,
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                      const SizedBox(height: AppColors.paddingSmall),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(AppColors.radiusMedium),
                          border: Border.all(
                            color: Theme.of(context).colorScheme.outline.withValues(alpha: 0.3),
                          ),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<UserRole>(
                            value: _selectedRole,
                            isExpanded: true,
                            onChanged: (role) {
                              if (role != null) {
                                setState(() => _selectedRole = role);
                              }
                            },
                            items: UserRole.values.map((role) {
                              return DropdownMenuItem<UserRole>(
                                value: role,
                                child: Text(role.displayName),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                      const SizedBox(height: AppColors.paddingMedium),

                      CustomTextField(
                        controller: _emailController,
                        label: 'Email / Phone Number',
                        hint: 'user@farmigo.org',
                        prefixIcon: Icons.person_outline_rounded,
                        keyboardType: TextInputType.emailAddress,
                      ),
                      const SizedBox(height: AppColors.paddingMedium),

                      CustomTextField(
                        controller: _passwordController,
                        label: 'Password',
                        prefixIcon: Icons.lock_outline_rounded,
                        obscureText: _isObscure,
                        suffixIcon: IconButton(
                          icon: Icon(
                            _isObscure ? Icons.visibility_outlined : Icons.visibility_off_outlined,
                          ),
                          onPressed: () {
                            setState(() => _isObscure = !_isObscure);
                          },
                        ),
                      ),
                      const SizedBox(height: AppColors.paddingLarge),

                      CustomButton(
                        label: AppStrings.loginButton,
                        onPressed: _onSignInPressed,
                        icon: Icons.arrow_forward_rounded,
                      ),
                      const SizedBox(height: AppColors.paddingMedium),

                      CustomButton(
                        label: AppStrings.registerButton,
                        isSecondary: true,
                        onPressed: _onSignInPressed,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
