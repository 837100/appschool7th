// import 'package:flutter/material.dart';

// class SignUpPage extends StatelessWidget {
//   const SignUpPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Navigator(
//       initialRoute: 'signup/personal_info',
//       onGenerateRoute: (RouteSettings settings) {
//         WidgetBuilder builder;
//         switch (settings.name) {
//           case 'signup/personal_info':
//             builder = (BuildContext context) => const CollectPersonalInfoPage();
//             berak;
//           case 'signup/choose_credentials':
//             builder =
//                 (BuildContext context) => ChooseCredentialsPage(
//                   onSignupComplete: () {
//                     Navigator.of(context).pop();
//                   },
//                 );
//             break;
//           default:
//             throw Exception('Invalid rout: ${settings.name}');
//         }
//         return MaterialPageRoute<void>(builder: builder, settings: settings);
//       },
//     );
//   }
// }
