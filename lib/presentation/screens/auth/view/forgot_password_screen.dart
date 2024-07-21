import 'package:task_tech/utils/exports.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    TextEditingController forgotPassEmailController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          elevation: 0,
          centerTitle: true,
          title: Text(
            'Forgot Password',
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
          )),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset('images/Forgot password-amico 1.png'),
                Text(
                  'The verification code will be sent to your\nE-mail, please check it.',
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: labelTextFormStyle.copyWith(
                    color: Theme.of(context).textTheme.headlineSmall!.color,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextFormField(
                  controller: forgotPassEmailController,
                  obscure: false,
                  fillColor: Theme.of(context).canvasColor,
                  borderColor: Theme.of(context).canvasColor,
                  validator: (email) {
                    email = forgotPassEmailController.text.toString();
                    if (email.isEmpty) {
                      return 'Enter your email!';
                    } else {
                      Constants.unFocusFunc();
                      return null;
                    }
                  },
                  hintText: 'Email',
                ),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      BlocProvider.of<AuthCubit>(context)
                          .forgotPassCubit(forgotPassEmailController.text);
                    }
                  },
                  style: ButtonStyle(
                    padding: WidgetStatePropertyAll(
                      EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 0.2 * Constants.screenWidth,
                      ),
                    ),
                    backgroundColor: WidgetStatePropertyAll(
                        Theme.of(context).primaryColor),
                    shape: WidgetStatePropertyAll(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                    ),
                  ),
                  child: Text(
                    'Send code',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
