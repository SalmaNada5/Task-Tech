import 'package:task_tech/utils/exports.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController newPassController = TextEditingController();
    TextEditingController confirmPassController = TextEditingController();
    AuthCubit authCubit = BlocProvider.of<AuthCubit>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Reset Password',
          style: titleStyle,
        ),
        leading: Container(
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Theme.of(context).primaryColor,
          ),
          child: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              size: 20,
            ),
            onPressed: () => Navigator.pop(context),
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: BlocBuilder<AuthCubit, AuthState>(
            bloc: authCubit,
            buildWhen: (prev, cur) =>
                cur is SignUpPassVisible ||
                cur is SignUpPassInVisible ||
                cur is SignUpConfirmPassInVisible ||
                cur is SignUpConfirmPassVisible,
            builder: (context, state) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Image.asset(
                    'images/Reset password-pana 1.png',
                    height: Constants.screenHeight * 0.45,
                  ),
                  Text(
                    'Your new password must be different from\nthe password you used previously',
                    textAlign: TextAlign.center,
                    style: labelTextFormStyle.copyWith(
                      fontSize: 16,
                      color: const Color(0xff3E4446),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextFormField(
                    controller: emailController,
                    fillColor: Theme.of(context).canvasColor,
                    borderColor: Theme.of(context).canvasColor,
                    obscure: false,
                    hintText: 'Email',
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      value = emailController.text;
                      if (value.isEmpty) {
                        return 'Please enter your email address';
                      } else {
                        return '';
                      }
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextFormField(
                    hintText: 'New password',
                    fillColor: Theme.of(context).canvasColor,
                    borderColor: Theme.of(context).canvasColor,
                    icon: IconButton(
                      icon: Icon(
                        authCubit.obsecureTextForResetPass
                            ? Icons.visibility_off
                            : Icons.visibility,
                        size: 20,
                      ),
                      onPressed: () {
                        authCubit.obsecureSignUpPasswordLogic(true);
                      },
                    ),
                    obscure: authCubit.obsecureTextForResetPass ? true : false,
                    controller: newPassController,
                    validator: (value) {
                      value = newPassController.text.toString();
                      if (value.isEmpty) {
                        return 'please enter a valid email';
                      } else {
                        return '';
                      }
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextFormField(
                    hintText: 'Confirm password',
                    fillColor: Theme.of(context).canvasColor,
                    borderColor: Theme.of(context).canvasColor,
                    icon: IconButton(
                      icon: Icon(
                        authCubit.obsecureTextForResetConfirmPass
                            ? Icons.visibility_off
                            : Icons.visibility,
                        size: 20,
                      ),
                      onPressed: () {
                        authCubit.obsecureSignUpConfirmPasswordLogic(true);
                      },
                    ),
                    obscure: authCubit.obsecureTextForResetConfirmPass
                        ? true
                        : false,
                    controller: confirmPassController,
                    validator: (value) {
                      value = confirmPassController.text.toString();
                      if (value != newPassController.text) {
                        return 'passwords does\'t match ';
                      } else {
                        return '';
                      }
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      BlocProvider.of<AuthCubit>(context).resetPassCubit(
                          email: emailController.text,
                          password: newPassController.text,
                          confirmPassword: confirmPassController.text);
                    },
                    style: ButtonStyle(
                      padding: WidgetStatePropertyAll(EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 0.35 * Constants.screenWidth)),
                      backgroundColor: WidgetStatePropertyAll(
                          Theme.of(context).primaryColor),
                      shape: WidgetStatePropertyAll(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                      ),
                    ),
                    child: Text(
                      'Save',
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
