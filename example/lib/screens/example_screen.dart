import 'package:easy_text_input/easy_text_input.dart';
import 'package:example/widgets/eye_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

import '../blocs/example_bloc.dart';

class ExampleScreen extends StatefulWidget {
  const ExampleScreen({
    @required this.exampleBloc,
  });

  final ExampleBloc exampleBloc;

  @override
  State<StatefulWidget> createState() {
    return ExampleScreenState(
      exampleBloc: exampleBloc,
    );
  }
}

class ExampleScreenState extends State<ExampleScreen> {
  ExampleScreenState({
    @required this.exampleBloc,
  });

  final ExampleBloc exampleBloc;

  final ImageIcon _errorIcon = ImageIcon(
    AssetImage('lib/assets/error_circle.png'),
    color: Colors.red,
  );

  final ImageIcon _successIcon = ImageIcon(
    AssetImage('lib/assets/check_circle.png'),
    color: Colors.green,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(16),
        padding: EdgeInsets.only(top: 120),
        child: Column(
          children: <Widget>[
            InputField(
              stream: exampleBloc.password,
              labelText: 'Password',
              onChanged: exampleBloc.sinkPassword,
              obscureText: true,
              successIcon: _successIcon,
              errorIcon: _errorIcon,
              obscureTextIconOff: EyeIcon.close,
              obscureTextIconOn: EyeIcon.open,
            ),
            SizedBox(
              height: 16,
            ),
            InputField(
              stream: exampleBloc.phone,
              labelText: 'Phone',
              obscureText: false,
              onChanged: exampleBloc.sinkPhone,
              controller: MaskedTextController(mask: '(00) 00000-00000'),
              hintText: '(31) 91234-5678',
              successIcon: _successIcon,
            ),
          ],
        ));
  }
}
