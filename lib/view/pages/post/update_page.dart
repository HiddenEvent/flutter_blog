import 'package:flutter/material.dart';
import 'package:flutter_blog/controller/post_controller.dart';
import 'package:flutter_blog/util/validator_util.dart';
import 'package:flutter_blog/view/components/custom_elevated_button.dart';
import 'package:flutter_blog/view/components/custom_text_form_field.dart';
import 'package:flutter_blog/view/components/custom_textarea.dart';
import 'package:get/get.dart';

class UpdatePage extends StatelessWidget {
  final PostController postC = Get.find();
  final _formKey = GlobalKey<FormState>();
  final _title = TextEditingController();
  final _content = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _title.text = "${postC.post.value.title}"; /* 값 전달*/
    _content.text = "${postC.post.value.content}";
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              CustomTextFormField(
                controller: _title,
                hint: "Title",
                funValidator: validateTitle(),
              ),
              CustomTextArea(
                controller: _content,
                hint: "Content",
                funValidator: validateContent(),
              ),
              CustomElevatedButton(
                text: "글수정하기",
                funPageRoute: () async {
                  if (_formKey.currentState!.validate()) {
                    await postC.updateById(postC.post.value.id ?? 0, _title.text, _content.text);
                    Get.back(); // 상태관리 GetX 라이브러리 - Obs
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
