import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zorro_test/util/text_styles.dart';

import '../blocs/homeBloc/home_bloc.dart';
import 'employee_details_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    context.read<HomeBloc>().add(GetEmployeesEvent());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home",style: txtStyleHeader,),),
      body: BlocBuilder<HomeBloc,HomeState>(
        builder: (context,state){
          if(state is HomeInitial){
            _loadingBuilder();
          }
          if(state is HomeSuccess){
            return ListView.builder(
                itemCount: state.employees.length,
                itemBuilder: (context,index){
                  return InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => EmployeeDetailsPage(state.employees[index])),);
                    },
                    child: ListTile(
                      title: Text("${state.employees[index].firstName} ${state.employees[index].lastName}",style: txtStyleHeader ,),
                      subtitle: Text(state.employees[index].email,style: txtStyleParagraph,),
                      leading: const Icon(Icons.supervised_user_circle,size: 24,),
                    ),
                  );
                });
          }
          if(state is HomeError){
            _errorBuilder(state);
          }
          return Container();
        },
      ),

    );
  }


  Widget _loadingBuilder() {
    return const Center(child: CircularProgressIndicator());
  }

  Widget _errorBuilder(HomeError state) {
    return Center(child: Text(state.message));
  }
}
