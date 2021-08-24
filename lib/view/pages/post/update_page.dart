import 'package:flutter/material.dart';
import 'package:flutter_blog/controller/post_controller.dart';
import 'package:flutter_blog/util/validator_util.dart';
import 'package:flutter_blog/view/components/custom_elevated_button.dart';
import 'package:flutter_blog/view/components/custom_text_form_field.dart';
import 'package:flutter_blog/view/components/custom_textarea.dart';
import 'package:get/get.dart';

class UpdatePage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    PostController postC = Get.find();
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
            key: _formKey,
            child: ListView(
              children: [
                CustomTextFormField(
                    hint: "Title", funValidator: validateTitle(),
                  value: "${postC.post.value.title}",
                ),
                CustomTextArea(
                    hint: "Content", funValidator: validateContent(),
                  value: "${postC.post.value.content}",
                ),
                CustomElevatedButton(
                    text: "글수정하기",
                    funPageRoute: () {
                      if (_formKey.currentState!.validate()) {
                        Get.back(); // 상태관리 GetX 라이브러리 - Obs
                      }
                    }),
              ],
            )),
      ),
    );
  }
}
