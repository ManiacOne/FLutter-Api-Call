import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interview_flutter_application/Features/Data/home_repository_impl.dart';
import 'package:interview_flutter_application/Features/Data/models.dart';
import 'package:interview_flutter_application/Features/Data/remote_source_impl.dart';
import 'package:interview_flutter_application/Features/Domain/home_usecase.dart';
import 'package:interview_flutter_application/Features/Screens/bloc/user_bloc.dart';
import 'package:interview_flutter_application/Features/Screens/newScreen.dart';

class MyHome extends StatefulWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  final UserBloc userBloc =
      UserBloc(HomeUsecase(HomeRepositoryImpl(RemoteSourceImpl())));

  @override
  void initState() {
    // TODO: implement initState
    userBloc.add(HomeInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocConsumer<UserBloc, UserState>(
        bloc: userBloc,
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          if (state is HomeDataLoadingState)
            return Center(
              child: CircularProgressIndicator(),
            );
          if (state is HomeDataLoadedState) {
            return ListView.builder(
                itemCount: state.userData.length,
                itemBuilder: ((context, index) {
                  return InkWell(
                    onTap: () {
                      print("howdyyy");

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => SecondScreen(
                                    username: state.userData[index].username!,
                                    email: state.userData[index].email!,
                                    name: state.userData[index].name!,
                                  ))));
                    },
                    child: Column(
                      children: [
                        Text(state.userData[index].username!),
                        Text(state.userData[index].name!),
                        Text(state.userData[index].email!),
                        SizedBox(
                          height: 5,
                        ),
                        Divider(thickness: 3),
                      ],
                    ),
                  );
                }));
          }
          return Text("Null Text");
        },
      ),
    );
  }
}
