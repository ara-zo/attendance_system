import 'package:attendance_system/common/widgets/form_button.dart';
import 'package:attendance_system/constants/sizes.dart';
import 'package:attendance_system/features/join/join_screen.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:group_radio_button/group_radio_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Map<String, String> formData = {};

  final _status = ["PARENT", "SCHOOL"];
  String _userType = "PARENT";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                const Text(
                  '출결서비스',
                  style: TextStyle(
                    fontSize: Sizes.size36,
                  ),
                ),
                const Gap(28.0),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      SizedBox(
                        child: RadioGroup<String>.builder(
                          direction: Axis.horizontal,
                          horizontalAlignment: MainAxisAlignment.spaceAround,
                          onChanged: (value) => setState(() {
                            _userType = value ?? 'PARENT';
                          }),
                          activeColor: Colors.blue,
                          textStyle: const TextStyle(fontSize: Sizes.size16),
                          groupValue: _userType,
                          items: _status,
                          itemBuilder: (item) => RadioButtonBuilder(
                            item,
                          ),
                        ),
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: 'ID',
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey.shade400,
                            ),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey.shade400,
                            ),
                          ),
                        ),
                        validator: (value) {
                          if (value != null && value.isEmpty) {
                            return "아이디를 입력하세요";
                          }
                          return null;
                        },
                        onSaved: (newValue) {
                          if (newValue != null) {
                            formData['id'] = newValue;
                          }
                        },
                      ),
                      const Gap(16.0),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Password',
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey.shade400,
                            ),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey.shade400,
                            ),
                          ),
                        ),
                        validator: (value) {
                          if (value != null && value.isEmpty) {
                            return "비밀번호를 입력하세요";
                          }
                          return null;
                        },
                        onSaved: (newValue) {
                          if (newValue != null) {
                            formData['password'] = newValue;
                          }
                        },
                      ),
                      const Gap(28.0),
                      GestureDetector(
                        onTap: _onSubmitTap,
                        child: const FormButton(disabled: false, text: 'Login'),
                      ),
                      const Gap(28.0),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const JoinScreen(),
                            ),
                          );
                        },
                        child: const Text(
                          '회원가입',
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: Sizes.size14,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onSubmitTap() {
    if (_formKey.currentState != null) {
      if (_formKey.currentState!.validate()) {
        // 텍스트 입력에 onSaved 콜백 함수를 실행
        _formKey.currentState!.save();

        // formData에 userType 저장
        formData['userType'] = _userType;

        print(formData);
      }
    }
  }
}
