import 'package:chit_chat/core/utils/text_styles.dart';
import 'package:chit_chat/core/utils/widgets/custom_app_bar.dart';
import 'package:chit_chat/features/home/data/manager/home_cubit/home_cubit.dart';
import 'package:chit_chat/features/home/presentation/view/widgets/chat_column.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is HomeLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (state is HomeFaliure) {
          return Center(
            child: Text("Error: ${state.errMess}"),
          );
        }
        if (state is HomeSucsses) {
          return Column(
            children: [
              const SizedBox(
                height: 80,
                child: CustomAppBar(
                    text: 'Groups', actionIcon: Icon(Icons.search)),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: state.groups.length,
                  itemBuilder: (context, index) {
                    return AllChatsScreen(
                      groupName: state.groups[index],
                    );
                  },
                ),
              )
            ],
          );
        }
        return const Text(
          'No Groups Created',
          style: Style.textStyleBold24,
        );
      },
    );
  }
}
