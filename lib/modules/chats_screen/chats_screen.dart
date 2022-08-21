import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_app/models/user_model.dart';
import 'package:medical_app/shared/components/components.dart';
import 'package:medical_app/shared/cubit/app_cubit/medical_cubit.dart';
import 'package:medical_app/shared/cubit/app_cubit/medical_states.dart';

class ChatsScreen extends StatelessWidget {
  ChatsScreen({Key? key}) : super(key: key);
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MedicalCubit, MedicalAppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                Container(
                    padding:
                        const EdgeInsetsDirectional.only(top: 10, bottom: 25),
                    child: deffaultFormField(
                      controller: searchController,
                      labelText: 'Search',
                      prefix: Icons.search,
                    )),
                ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) => chatBuilder(),
                  separatorBuilder: (context, index) =>
                      deffaultSeparatorBuilder(),
                  itemCount: 10,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

Widget chatBuilder() => Column(
      children: [
        Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.blue.shade300,
              radius: 29,
              child: const CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://img.freepik.com/free-vector/female-portrait-medical-doctor-profile-flat-design-vector_617655-23.jpg?w=740"),
                radius: 25,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: InkWell(
                onTap: () {},
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Text("Abanoub"),
                        const Spacer(),
                        Text(
                          "10h ago",
                          style: TextStyle(color: Colors.grey.shade700),
                        ),
                      ],
                    ),
                    const SizedBox(height: 3),
                    const Text("Last Message"),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
