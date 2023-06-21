import 'package:flutter/material.dart';
import 'package:task_tech/presentation/screens/auth/view/screens/forgot_password_screen.dart';
import 'package:task_tech/presentation/screens/auth/view/screens/reset_password_screen.dart';
import 'package:task_tech/presentation/screens/auth/view/screens/sign_in_screen.dart';
import 'package:task_tech/presentation/screens/create_profile/create_profile.dart';
import 'package:task_tech/presentation/screens/auth/view/screens/onboarding_screen.dart';
import 'package:task_tech/presentation/screens/add_post/create_post_screen.dart';
import 'package:task_tech/presentation/screens/home/view/categories_screen.dart';
import 'package:task_tech/presentation/screens/home/view/home_screen.dart';
import 'package:task_tech/presentation/screens/payment/add_card_screen.dart';
import 'package:task_tech/presentation/screens/payment/order_review_screen.dart';
import 'package:task_tech/presentation/screens/payment/success_payment_screen.dart';
import 'package:task_tech/presentation/screens/posts/posts_screen.dart';
import 'package:task_tech/presentation/screens/posts/service_details.dart';
import 'package:task_tech/presentation/screens/posts/task_details.dart';
import 'package:task_tech/presentation/screens/auth/view/screens/unexpected_error_screen.dart';
import 'package:task_tech/presentation/screens/auth/view/screens/verification_code_screen.dart';
import 'presentation/screens/auth/view/screens/sign_up_screen.dart';

class Routing {
  static Map<String, Widget Function(BuildContext)> routes = {
    'onboarding': (context) => const OnboardingScreen(),
    'signUp': (context) => const SignUpScreen(),
    'signIn': (context) => const SignInScreen(),
    'forgotPassword': (context) => const ForgotPasswordScreen(),
    'verification': (context) => const VerificationScreen(
          fromSignup: true,
        ),
    'resetPassword': (context) => const ResetPassword(),
    'unexpectedError': (context) => const UnexpectedErrorScreen(),
    'home': (context) => const HomeScreen(),
    'addPost': (context) => const AddPostScreen(),
    'posts': (context) => const PostsScreen(),
    'categories': (context) => const CategoriesScreen(),
    'createProfile': (context) => const CreateProfile(),
    'taskDetails': (context) => const TaskDetailsPage(
          name: 'Need someone help me to design modern websites in figma.',
          description:
              'i\'m looking for UI/UX designer,gathering user requirements,building navigation components.',
          deliveryTime: '14 days',
          price: '25',
        ),
    'serviceDetails': (context) => const ServiceDetailsPage(
          userName: 'Aya Mohamed',
          imgUrl:
              'https://images.pexels.com/photos/415829/pexels-photo-415829.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
          serviceName: 'I will build a fully app & web design.',
          description:
              'jkgealfjegklfjgtihkdslfnlsr;gtjnk;aejfkgntsrkfkgtb;sekgtjrssgja;srgtjkistrjkgi',
          deliveryDays: '14 Days',
          category: 'UI?UX design',
          softwareTools: 'Figma, AdobeXD',
          price: 200,
          attachedFileUrl:
              'https://images.pexels.com/photos/415829/pexels-photo-415829.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
          rate: 4.9,
          deliveryDate: 'Mon, 25 Nov, 2023',
        ),
    'order': (context) => const OrderReviewScreen(
          imgUrl:
              'https://images.pexels.com/photos/415829/pexels-photo-415829.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
          serviceName:
              'serviceName gjliigilkhguoy\nfryglpyot hgityfty yipguout',
          rate: 4,
          deliveryDays: '14',
          deliveryDate: 'deliveryDate',
          price: 200,
        ),
    'addCard': (context) => const AddCardScreen(),
    'success': (context) => const CongratesScreen(),
  };
}
