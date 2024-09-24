import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'counter_cubit.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CounterCubit(),
      child: const CounterView(),
    );
  }
}

class CounterView extends StatelessWidget {
  const CounterView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CounterCubit, int>(
      listener: (context, state) {
        if (state > 5) {
          // run logic to add discount
        }

        if (state < 5) {
          // run logic ro remove discount
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Counter Page'),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    final cubit = context.read<CounterCubit>();
                    cubit.increase();
                  },
                  child: const Text('Increase'),
                ),
                Text('$state'),
                TextButton(
                  onPressed: () {
                    final cubit = context.read<CounterCubit>();
                    cubit.decrease();
                  },
                  child: const Text('Decrease'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
