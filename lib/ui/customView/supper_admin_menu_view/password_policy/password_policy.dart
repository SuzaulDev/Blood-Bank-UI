import 'package:flutter/material.dart';

class PasswordPolicyView extends StatelessWidget {
  final passwordPolicyList;

  const PasswordPolicyView({super.key, required this.passwordPolicyList});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: passwordPolicyList.length,
              itemBuilder: (context, index) => ListTile(
                  leading: Text(passwordPolicyList[index].id.toString()),
                  title: Text(passwordPolicyList[index].name.toString()),
                  trailing: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                  ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
