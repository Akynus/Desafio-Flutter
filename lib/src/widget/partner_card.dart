import 'package:challenge_flutter/src/models/request_model.dart';
import 'package:challenge_flutter/src/resources/translate.dart';
import 'package:flutter/material.dart';

enum _EventType { EDIT, REMOVE }

class PartnerCard extends StatelessWidget {
  final RequestPartnerModel data;
  final VoidCallback onEdit;
  final VoidCallback onRemove;

  const PartnerCard({
    Key? key,
    required this.data,
    required this.onEdit,
    required this.onRemove,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        data.name ?? "-",
        overflow: TextOverflow.ellipsis,
      ),
      subtitle: Text(
        data.type ?? "-",
        overflow: TextOverflow.ellipsis,
      ),
      trailing: PopupMenuButton(
        onSelected: (value) {
          if (value == _EventType.EDIT) onEdit();
          if (value == _EventType.REMOVE) onRemove();
        },
        itemBuilder: (BuildContext context) {
          return [
            PopupMenuItem(value: _EventType.EDIT, child: Text(translate(Keys.label_edit_button))),
            PopupMenuItem(value: _EventType.REMOVE, child: Text(translate(Keys.label_remove_button))),
          ];
        },
      ),
    );
  }
}
