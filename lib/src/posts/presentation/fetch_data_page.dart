import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_api/dependency_injection.dart';
import 'package:get_api/src/posts/data/models/post_model.dart';
import 'package:get_api/src/posts/presentation/cubits/post_cubit.dart';

class FetchDataPage extends StatefulWidget {
  const FetchDataPage({super.key});

  @override
  State<FetchDataPage> createState() => _FetchDataPageState();
}

class _FetchDataPageState extends State<FetchDataPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<PostCubit>(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Fetch Posts'),
        ),
        body: BlocBuilder<PostCubit, List<PostModel>>(
          builder: (context, state) {
            if (state.isEmpty) return const CircularProgressIndicator();
            return ListView.builder(
                itemCount: state.length,
                itemBuilder: (_, index) {
                  return ListTile(
                    leading: Text('${index + 1}'),
                    title: Text(state[index].title),
                  );
                });
          },
        ),
      ),
    );
  }
}
