import 'package:exercise_mobile/gen/assets.gen.dart';
import 'package:exercise_mobile/shift/model/shift.dart';
import 'package:flutter/material.dart';

class ShiftDetailPage extends StatelessWidget {
  const ShiftDetailPage(this._shift, {Key? key}) : super(key: key);
  final Shift _shift;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(_shift.title),
          bottom: const TabBar(
            indicatorColor: Colors.white,
            tabs: [
              Padding(
                padding: EdgeInsets.all(8),
                child: Text('PROFESSIONALS'),
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: Text('SHIFT'),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ProfessionalsTab(shift: _shift),
            ShiftTab(shift: _shift),
          ],
        ),
      ),
    );
  }
}

class ShiftTab extends StatelessWidget {
  const ShiftTab({
    Key? key,
    required Shift shift,
  })  : _shift = shift,
        super(key: key);

  final Shift _shift;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          subtitle: Text(
            'DETAILS',
            style: Theme.of(context).textTheme.caption,
          ),
        ),
        ListTile(
          leading: const Icon(Icons.calendar_today),
          title: const Text('Date'),
          subtitle: Text(_shift.date),
        ),
        ListTile(
          leading: const Icon(Icons.timelapse),
          title: const Text('Time'),
          subtitle: Text(_shift.time),
        ),
        ListTile(
          leading: const Icon(Icons.av_timer),
          title: const Text('Unpaid break'),
          subtitle: Text(_shift.unpaidBreak),
        ),
        ListTile(
          leading: ImageIcon(Assets.images.usDollar),
          title: const Text('Rate'),
          subtitle: Text(_shift.rate),
        ),
        ListTile(
          leading: const Icon(Icons.location_on),
          title: const Text('Location'),
          subtitle: Text(_shift.location.address),
        ),
        ListTile(
          subtitle: Text(
            'INSTRUCTIONS',
            style: Theme.of(context).textTheme.caption,
          ),
        ),
        ListTile(
          leading: const Icon(Icons.supervisor_account),
          title: const Text('On-site Contacts'),
          subtitle: Text(_shift.contacts.map((e) => ' • ${e.name}').join('\n')),
        ),
        ListTile(
          leading: const Icon(Icons.work_outline),
          title: const Text('Attire'),
          subtitle: Text(_shift.attire),
        ),
        ListTile(
          leading: const Icon(Icons.warning_amber),
          title: const Text('Requirements'),
          subtitle: Text(
            _shift.additionalRequirements.map((e) => ' • $e').join('\n'),
          ),
        ),
        ListTile(
          leading: const Icon(Icons.text_snippet),
          title: const Text('Additional instrctions'),
          subtitle: Text(_shift.additionalInstructions),
        ),
      ],
    );
  }
}

class ProfessionalsTab extends StatelessWidget {
  const ProfessionalsTab({
    Key? key,
    required Shift shift,
  })  : _shift = shift,
        super(key: key);

  final Shift _shift;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _shift.matched.length + 1,
      itemBuilder: (context, index) {
        if (index == 0) {
          return ListTile(
            subtitle: Text('${_shift.matched.length} FILLED'),
          );
        }
        final pro = _shift.matched.elementAt(index - 1).pro;
        return ListTile(
          leading: CircleAvatar(
            foregroundImage: NetworkImage(
              pro.avatar ?? '',
            ),
            backgroundImage: Assets.images.avatarPlaceholder,
          ),
          title: Text('${pro.firstName} ${pro.lastName}'),
        );
      },
    );
  }
}
