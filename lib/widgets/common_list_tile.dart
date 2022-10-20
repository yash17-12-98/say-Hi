import 'package:flutter/material.dart';

class CommonListTile extends StatelessWidget {
  final String? title;
  final String? subTitle;

  const CommonListTile({Key? key, this.title, this.subTitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      tileColor: Colors.blue.withOpacity(0.3),
      trailing: TextButton(
        onPressed: () {},
        child: const Text('Say H!'),
      ),
      title: Text(title.toString()),
      subtitle: Text(subTitle.toString()),
    );
  }
}
