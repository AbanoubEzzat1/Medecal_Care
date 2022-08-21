import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_app/shared/components/components.dart';
import 'package:medical_app/shared/cubit/app_cubit/medical_cubit.dart';
import 'package:medical_app/shared/cubit/app_cubit/medical_states.dart';
import 'package:medical_app/shared/styles/colors.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MedicalCubit, MedicalAppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(15),
                  decoration: deffaultDecoration(
                    backgroundColor: deffaultGreyColor,
                    topEnd: 20,
                    topStart: 20,
                    bottomEnd: 20,
                    bottomStart: 20,
                  ),
                  child: Row(
                    children: [
                      const CircleAvatar(
                        backgroundImage: NetworkImage(
                            "https://img.freepik.com/free-vector/dentistry-concept-illustration_1284-4609.jpg?w=740&t=st=1649193887~exp=1649194487~hmac=1010fa1c25a4712cce9bf57afa554b744c3f17e88e805de61818cc37bc84a1c9"),
                        radius: 30,
                      ),
                      const SizedBox(width: 15),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "Abanoub",
                              style: TextStyle(fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.edit,
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                Container(
                  padding: const EdgeInsets.all(15),
                  decoration: deffaultDecoration(
                    backgroundColor: deffaultGreyColor,
                    topEnd: 20,
                    topStart: 20,
                    bottomEnd: 20,
                    bottomStart: 20,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "About",
                              style: TextStyle(fontSize: 20),
                            ),
                            SizedBox(height: 8),
                            Text(
                              "About Me...",
                              style: TextStyle(fontSize: 18),
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.edit,
                            color: Colors.blue,
                          )),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                Container(
                  padding: const EdgeInsets.all(15),
                  decoration: deffaultDecoration(
                    backgroundColor: deffaultGreyColor,
                    topEnd: 20,
                    topStart: 20,
                    bottomEnd: 20,
                    bottomStart: 20,
                  ),
                  child: Row(
                    children: [
                      const Expanded(
                        child: Text(
                          "Contact Us",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.contact_phone_outlined,
                            color: Colors.blue,
                          )),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                Container(
                  padding: const EdgeInsets.all(15),
                  decoration: deffaultDecoration(
                    backgroundColor: deffaultGreyColor,
                    topEnd: 20,
                    topStart: 20,
                    bottomEnd: 20,
                    bottomStart: 20,
                  ),
                  child: Row(
                    children: [
                      const Expanded(
                        child: Text(
                          "Help",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.help_outline,
                            color: Colors.blue,
                          )),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                Container(
                  padding: const EdgeInsets.all(15),
                  decoration: deffaultDecoration(
                    backgroundColor: deffaultGreyColor,
                    topEnd: 20,
                    topStart: 20,
                    bottomEnd: 20,
                    bottomStart: 20,
                  ),
                  child: Row(
                    children: [
                      const Expanded(
                        child: Text(
                          "Log Out",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                      IconButton(
                          onPressed: () {
                            MedicalCubit.get(context).signOut(context);
                          },
                          icon: const Icon(
                            Icons.exit_to_app,
                            color: Colors.blue,
                          )),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
