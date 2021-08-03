import 'package:flutter/material.dart';
import 'package:flutter_blog/pages/components/custom_elevated_button.dart';
import 'package:flutter_blog/pages/components/custom_text_form_field.dart';

class JoinPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          SizedBox(height: 200),
          CustomTextFormField(hint: "Enter UserName"),
          CustomTextFormField(hint: "Enter Password"),
          CustomTextFormField(hint: "Enter Email"),
          CustomElevatedButton(text: "회원가입",)
        ],
      ),
    );
  }
}

