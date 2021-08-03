import 'package:flutter/material.dart';
import 'package:flutter_blog/pages/components/custom_elevated_button.dart';
import 'package:flutter_blog/pages/components/custom_text_form_field.dart';
import 'package:flutter_blog/pages/user/login_page.dart';
import 'package:get/get.dart';

class JoinPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>(); /* 글로벌 키를 Form에다 세팅하는 이유는, Form 데이터를 전역에서 접근 가능하게 하기 위함 */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Container(
              alignment: Alignment.center,
              height: 200,
              child: Text(
                "회원가입 화면",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            _joinForm(),
          ],
        ),
      ),
    );
  }

  Widget _joinForm() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomTextFormField(
              hint: "UserName",
              funValidator: (value) {
                print(value);
              }),
          CustomTextFormField(
              hint: "Password",
              funValidator: (value) {
                print(value);
              }),
          CustomTextFormField(
              hint: "Email",
              funValidator: (value) {
                print(value);
              }),
          CustomElevatedButton(
            text: "회원가입",
            funPageRoute: () {
              _formKey.currentState!.validate();
              Get.to(LoginPage());
            },
          )
        ],
      ),
    );
  }
}
