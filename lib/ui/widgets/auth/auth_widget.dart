import 'package:flutter/material.dart';
import 'package:themoviedb/ui/theme/app_button_style.dart';
import 'package:themoviedb/ui/widgets/auth/auth_model.dart';

class AuthWidget extends StatefulWidget {
  const AuthWidget({super.key});

  @override
  State<AuthWidget> createState() => _AuthWidgetState();
}

class _AuthWidgetState extends State<AuthWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.blue,
        title: const Text('Login to your account'),
      ),
      body: ListView(
        children: const [
          _HeaderWidget(),
        ],
      ),
    );
  }
}

class _HeaderWidget extends StatelessWidget {
  const _HeaderWidget();

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(
      fontSize: 16,
      color: Colors.black,
    );

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 25),
          const _FormWidget(),
          const SizedBox(height: 25),
          const Text(
            'In order to use the editing and rating capabilities of TMDB, as well as get personal recommendations you will need to login to your account. If you do not have an account, registering for an account is free and simple.',
            style: textStyle,
          ),
          const SizedBox(height: 5),
          TextButton(
            onPressed: () {},
            style: AppButtonStyle.linkButton,
            child: const Text('Register'),
          ),
          const SizedBox(height: 25),
          const Text(
            'If you signed up but didn\'t get your verification email.',
            style: textStyle,
          ),
          const SizedBox(height: 5),
          TextButton(
            onPressed: () {},
            style: AppButtonStyle.linkButton,
            child: const Text('Verify email'),
          ),
        ],
      ),
    );
  }
}

class _FormWidget extends StatelessWidget {
  const _FormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final model = AuthModelProvider.read(context).model;
    const textStyle = TextStyle(
      fontSize: 16,
      color: Color(0xFF212529),
    );

    // const appColor = Color(0xFF01B4E4);

    const textFieldDecorator = InputDecoration(
      border: OutlineInputBorder(),
      isCollapsed: true,
      contentPadding: EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 10,
      ),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _ErrorMassageWidget(),
        const Text(
          'Username',
          style: textStyle,
        ),
        const SizedBox(height: 5),
        TextField(
          controller: model.loginTextController, //_loginTextController,
          decoration: textFieldDecorator,
        ),
        const SizedBox(height: 20),
        const Text(
          'Password',
          style: textStyle,
        ),
        const SizedBox(height: 5),
        TextField(
          controller: model.passwordTextController, //_passwordTextController,
          decoration: textFieldDecorator,
          obscureText: true,
        ),
        const SizedBox(height: 20),
        Row(
          children: [
            const _AuthButtonWidget(),
            const SizedBox(width: 30),
            TextButton(
              onPressed: () {},
              style: AppButtonStyle.linkButton,
              child: const Text('Reset password'),
            ),
          ],
        )
      ],
    );
  }
}

class _AuthButtonWidget extends StatelessWidget {
  const _AuthButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = AuthModelProvider.watch(context).model;
    const appColor = Color(0xFF01B4E4);
    final onPressed = model.canStartAuth ? () => model.auth(context) : null;

    return ElevatedButton(
      onPressed: onPressed, //_auth,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(appColor),
        foregroundColor: MaterialStateProperty.all(Colors.white),
        textStyle: MaterialStateProperty.all(
          const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
        ),
        // ???
        padding: MaterialStateProperty.all(
          const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 8,
          ),
        ),
        // ???
      ),
      child: const Text('Login'),
    );
  }
}

class _ErrorMassageWidget extends StatelessWidget {
  const _ErrorMassageWidget();

  @override
  Widget build(BuildContext context) {
    final errorMassage = AuthModelProvider.watch(context).model.errorMessage;

    if (errorMassage == null) return const SizedBox.shrink();

    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Text(
        errorMassage,
        style: const TextStyle(
          fontSize: 17,
          color: Colors.red,
        ),
      ),
    );
  }
}

// class _FormWidget extends StatefulWidget {
//   const _FormWidget();

//   @override
//   State<_FormWidget> createState() => __FormWidgetState();
// }

// class __FormWidgetState extends State<_FormWidget> {
//   final _loginTextController = TextEditingController(text: 'admin');
//   final _passwordTextController = TextEditingController(text: 'admin');
//   String errorText = '';

//   void _auth() {
//     final login = _loginTextController.text;
//     final password = _passwordTextController.text;
//     setState(() {
//       if (login == 'admin' && password == 'admin') {
//         errorText = '';
//         // Navigator.of(context).pushNamed('/main_screen');
//         Navigator.of(context).pushReplacementNamed('/main_screen');
//       } else {
//         errorText = 'We couldn\'t validate your login session.';
//       }
//     });
//   }

//   // void _resetPassword() {
//   //   print('Reset password');
//   // }

//   @override
//   Widget build(BuildContext context) {
//     const textStyle = TextStyle(
//       fontSize: 16,
//       color: Color(0xFF212529),
//     );

//     const appColor = Color(0xFF01B4E4);

//     const textFieldDecorator = InputDecoration(
//       border: OutlineInputBorder(),
//       isCollapsed: true,
//       contentPadding: EdgeInsets.symmetric(
//         horizontal: 10,
//         vertical: 10,
//       ),
//     );

//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         if (errorText != '') ...[
//           Text(
//             errorText,
//             style: const TextStyle(color: Colors.red),
//           ),
//           const SizedBox(height: 20)
//         ],
//         const Text(
//           'Username',
//           style: textStyle,
//         ),
//         const SizedBox(height: 5),
//         TextField(
//           controller: _loginTextController,
//           decoration: textFieldDecorator,
//         ),
//         const SizedBox(height: 20),
//         const Text(
//           'Password',
//           style: textStyle,
//         ),
//         const SizedBox(height: 5),
//         TextField(
//           controller: _passwordTextController,
//           decoration: textFieldDecorator,
//           obscureText: true,
//         ),
//         const SizedBox(height: 20),
//         Row(
//           children: [
//             ElevatedButton(
//                 onPressed: _auth,
//                 style: ButtonStyle(
//                   backgroundColor: MaterialStateProperty.all(appColor),
//                   foregroundColor: MaterialStateProperty.all(Colors.white),
//                   textStyle: MaterialStateProperty.all(const TextStyle(
//                       fontSize: 16, fontWeight: FontWeight.w700)),
//                 ),
//                 child: const Text('Login')),
//             const SizedBox(width: 30),
//             TextButton(
//               onPressed: _passwordTextController.clear,
//               style: AppButtonStyle.linkButton,
//               child: const Text('Reset password'),
//             ),
//           ],
//         )
//       ],
//     );
//   }
