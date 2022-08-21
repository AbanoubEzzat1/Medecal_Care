import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_app/shared/components/components.dart';
import 'package:medical_app/shared/cubit/app_cubit/medical_cubit.dart';
import 'package:medical_app/shared/cubit/app_cubit/medical_states.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MedicalCubit, MedicalAppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                InkWell(
                  onTap: (() {}),
                  child: Card(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    elevation: 5.0,
                    margin: const EdgeInsets.symmetric(
                      horizontal: 8.0,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Image(
                          width: double.infinity,
                          image: NetworkImage(
                              "https://img.freepik.com/free-vector/rx-medical-prescription-doctor-writes-signature-recipe-disease-therapy-pills-painkiller-drugs_102902-2929.jpg?w=740"),
                        ),
                        Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Row(
                            children: const [
                              Icon(
                                Icons.watch_later,
                                color: Colors.blue,
                              ),
                              SizedBox(width: 5),
                              Text(
                                "Upcoming appointments",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                              Spacer(),
                              Text(
                                "12",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                InkWell(
                  onTap: (() {}),
                  child: Card(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    elevation: 5.0,
                    margin: const EdgeInsets.symmetric(
                      horizontal: 8.0,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Image(
                          width: double.infinity,
                          image: NetworkImage(
                              "https://img.freepik.com/free-vector/female-doctor-general-practitioner-office-interior_89224-5010.jpg?w=826"),
                        ),
                        Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Row(
                            children: const [
                              Icon(
                                Icons.watch_later,
                                color: Colors.green,
                              ),
                              SizedBox(width: 5),
                              Text(
                                "Completed appointments",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                              Spacer(),
                              Text(
                                "7",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                InkWell(
                  onTap: (() {}),
                  child: Card(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    elevation: 5.0,
                    margin: const EdgeInsets.symmetric(
                      horizontal: 8.0,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Image(
                          width: double.infinity,
                          image: NetworkImage(
                              "https://img.freepik.com/free-vector/vaccination-clinic-medical-background-picture-kids-hospital-doctor-making-safety-injection-from-influenza-healthcare-concept_80590-7008.jpg?w=826"),
                        ),
                        Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Row(
                            children: const [
                              Icon(
                                Icons.local_hospital,
                                color: Colors.red,
                              ),
                              SizedBox(width: 5),
                              Text(
                                "Patients",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                              Spacer(),
                              Text(
                                "24",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
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
