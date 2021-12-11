import 'package:exercise_mobile/l10n/l10n.dart';
import 'package:exercise_mobile/router/shift_router.dart';
import 'package:exercise_mobile/shift/model/shift_state.dart';
import 'package:exercise_mobile/shift/shift.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class ShiftsPage extends StatelessWidget {
  const ShiftsPage({Key? key, required this.tapShift}) : super(key: key);

  final void Function(Shift) tapShift;
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.shiftAppBarTitle),
      ),
      body: BlocProvider(
        create: (BuildContext context) => ShiftCubit.autoFetch(),
        child: Builder(builder: _buildPage),
      ),
    );
  }

  Widget _buildPage(BuildContext context) {
    return BlocBuilder<ShiftCubit, ShiftsState>(
      builder: (context, state) {
        if (state is ShiftsLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is ShiftsLoaded) {
          final dateAndShift = state.groupFoldByDay().entries.toList();
          return ListView.builder(
            itemCount: dateAndShift.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    subtitle: Text(
                      DateFormat('EEEE, MMM d')
                          .format(dateAndShift.elementAt(index).key)
                          .toUpperCase(),
                    ),
                  ),
                  ListView.builder(
                    itemCount: dateAndShift.elementAt(index).value.length,
                    shrinkWrap: true,
                    primary: false,
                    itemBuilder: (context, index) {
                      final shift =
                          dateAndShift.elementAt(index).value.elementAt(index);
                      return ListTile(
                        enabled: shift.slots != 0,
                        onTap: () {
                          tapShift(shift);
                        },
                        leading: CircleAvatar(
                          backgroundColor:
                              Theme.of(context).colorScheme.primary,
                          child: const Icon(
                            Icons.group,
                            color: Colors.white,
                          ),
                        ),
                        trailing: const Icon(Icons.chevron_right),
                        title: Text(shift.title),
                        subtitle:
                            Text('${shift.time}\n${shift.fillInfo}'.trim()),
                      );
                    },
                  )
                ],
              );
            },
          );
        }
        return const Center(
          child: Text("Couldn't fetch shifts. Is the device online?"),
        );
      },
    );
  }
}
