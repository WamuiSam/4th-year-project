import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wamui/cubits/traffick_info_cubit/trafick_info_cubit.dart';

class TraffickInfo extends StatelessWidget {
  const TraffickInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<TrafickInfoCubit>().getInfo(latitude: ,longitude: , style: '',versionNumber: ,zoom: );
    return BlocConsumer<TrafickInfoCubit, TrafickInfoState>(
      listener: (context, state) {
        if (state is TrafickInfoFailed) {
          showCupertinoDialog(
              context: context,
              builder: (context) => CupertinoAlertDialog(
                    title: Text("Error"),
                    content: Text(state.failed),
                  ));
        }
      },
      builder: (context, state) {
        if (state is TrafickInfoLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is TrafickInfoSuccess) {
          //Return the ui on success
          return Center(
            child: Text(state.flowSegmentData.toString()),
          );
        }
        return Container();
      },
    );
  }
}
