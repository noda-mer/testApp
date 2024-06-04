import 'package:flutter/material.dart';

class SimpleDialogSample extends StatefulWidget {
  const SimpleDialogSample({super.key});

  @override
  State<SimpleDialogSample> createState() => _SimpleDialogSampleState();
}

class _SimpleDialogSampleState extends State<SimpleDialogSample> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _urlController = TextEditingController();
  @override
  void dispose() {
    _titleController.dispose();
    _urlController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: const Center(child: Text("ブックマーク登録")),
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20.0), // 余白を追加
          child: SizedBox(
            child: Column(
              children: [
                Form(
                  child: SizedBox(
                    height: 300,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Spacer(),
                        TextFormField(
                          controller: _titleController,
                          decoration: const InputDecoration(
                            labelText: "タイトル",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(10.0)), // 枠線の角の丸みを設定
                            ),
                          ),
                        ),
                        const Spacer(),
                        TextFormField(
                          controller: _urlController,
                          decoration: const InputDecoration(
                            labelText: "URL",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(10.0)), // 枠線の角の丸みを設定
                            ),
                          ),
                          onChanged: (value) {
                            setState(() {
                              _urlController.text = value;
                            });
                          },
                        ),
                        const Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              style: ElevatedButton.styleFrom(
                                fixedSize: const Size(130, double.infinity),
                              ),
                              child: const Text('キャンセル'),
                            ),
                            ElevatedButton(
                              onPressed: _urlController.text != ''
                                  ? () {
                                      // フォームが送信されたときの処理を記述
                                      print(_titleController.text);
                                      print(_urlController.text);
                                    }
                                  : null,
                              style: ElevatedButton.styleFrom(
                                fixedSize: const Size(130, double.infinity),
                              ),
                              child: const Text("登録"),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
