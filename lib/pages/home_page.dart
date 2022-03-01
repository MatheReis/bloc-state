import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_bloc/pages/bloc/home_bloc.dart';
import 'package:login_bloc/pages/bloc/home_state.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exemplo Bloc'),
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
          cubit: BlocProvider.of<HomeBloc>(context),
          builder: (context, state) {
            if (state is HomeStateLoaded)
              return ListView.builder(
                itemCount: 50,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('Item $index'),
                  );
                },
              );
            if (state is HomeErrorState) {
              return Center(
                child: Text(
                  state.message,
                  style: TextStyle(fontSize: 17.0),
                ),
              );
            }

            if (state is HomeStateEmptyList) {
              return Center(
                child: Text(
                  'Não a dados disponíveis.',
                  style: TextStyle(fontSize: 17.0),
                ),
              );
            }

            return Center(child: CircularProgressIndicator());
          }),
    );
  }
}
