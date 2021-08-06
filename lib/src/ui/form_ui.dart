import 'dart:async';

import 'package:challenge_flutter/src/blocs/company/company_bloc.dart';
import 'package:challenge_flutter/src/models/request_model.dart';
import 'package:challenge_flutter/src/resources/translate.dart';
import 'package:challenge_flutter/src/widget/activity_card.dart';
import 'package:challenge_flutter/src/widget/dialogs/activity_dialog.dart';
import 'package:challenge_flutter/src/widget/dialogs/partner_dialog.dart';
import 'package:challenge_flutter/src/widget/floating_button_loading.dart';
import 'package:challenge_flutter/src/widget/inputs/datepicker_form_input.dart';
import 'package:challenge_flutter/src/widget/inputs/dropdown_form_input.dart';
import 'package:challenge_flutter/src/widget/inputs/text_form_input.dart';
import 'package:challenge_flutter/src/widget/partner_card.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:challenge_flutter/src/utils/extensions.dart';

class FormUI extends StatefulWidget {
  final RequestModel? data;

  const FormUI({Key? key, this.data}) : super(key: key);

  static final route = "/form";

  @override
  _FormUIState createState() => _FormUIState();
}

class _FormUIState extends State<FormUI> {
  late RequestModel _data;
  late GlobalKey<FormState> _form;
  late TextEditingController _nifController;
  late TextEditingController _cepController;
  late StreamSubscription _streamListener;

  @override
  void initState() {
    _data = widget.data ??
        RequestModel(
          status: Status.OK,
          type: Type.MATRIZ,
          partners: [],
          altActivities: [],
          mainActivities: [],
        );
    _form = GlobalKey();
    _nifController = MaskedTextController(
      mask: '00.000.000/0000-00',
      text: _data.nfi,
    );
    _cepController = MaskedTextController(
      mask: '00.000-000',
      text: _data.cep,
    );

    context.read<CompanyBloc>().add(CompanyResetEvent());

    _streamListener =
        BlocProvider.of<CompanyBloc>(context).stream.listen((state) {
      if (state is CompanySuccessState) {
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(translate(Keys.label_form_success_save)),
        ));
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    _streamListener.cancel();
    super.dispose();
  }

  Future<bool> _willPop() async {
    var cancelBtn = TextButton(
        onPressed: () => Navigator.pop(context, false),
        child: Text(translate(Keys.label_no_button)));
    var confirmBtn = TextButton(
        onPressed: () => Navigator.pop(context, true),
        child: Text(translate(Keys.label_yes_button)));

    var alert = AlertDialog(
      title: Text(translate(Keys.label_form_dialog_title_text)),
      content: Text(translate(Keys.label_form_dialog_description_text)),
      actions: [cancelBtn, confirmBtn],
    );

    var result = await showDialog<bool>(
      context: context,
      builder: (context) {
        return alert;
      },
    );

    return result ?? false;
  }

  String? _validIsNull(String? value) {
    if (value == null || value.isEmpty)
      return translate(Keys.error_required_field);
    return null;
  }

  String? _validNfi(String? value) {
    if (value == null || value.isEmpty)
      return translate(Keys.error_required_field);
    if (value.onlyNumbers.length != 14)
      return translate(Keys.error_invalid_field);
    return null;
  }

  String? _validUf(String? value) {
    if (value == null || value.isEmpty)
      return translate(Keys.error_required_field);
    if (value.length != 2)
      return translate(Keys.error_invalid_field);
    return null;
  }

  void _editPartner(int? index) async {
    late RequestPartnerModel object;
    if (index is int && _data.partners != null) {
      object = _data.partners![index];
    } else {
      object = RequestPartnerModel();
    }
    var result = await Navigator.push(context,
        MaterialPageRoute(builder: (_) => PartnerDialog(data: object)));

    if (result == null) return;

    setState(() {
      if (_data.partners == null) _data.partners = [];
      if (index is int) {
        _data.partners![index] = result;
      } else {
        _data.partners!.add(result);
      }
    });
  }

  void _removePartner(int index) {
    setState(() {
      _data.partners!.removeAt(index);
    });
  }

  void _editMainActivity(int? index) async {
    late RequestActivityModel object;
    if (index is int && _data.mainActivities != null) {
      object = _data.mainActivities![index];
    } else {
      object = RequestActivityModel();
    }
    var result = await Navigator.push(context,
        MaterialPageRoute(builder: (_) => ActivityDialog(data: object)));

    if (result == null) return;

    setState(() {
      if (_data.mainActivities == null) _data.mainActivities = [];
      if (index is int) {
        _data.mainActivities![index] = result;
      } else {
        _data.mainActivities!.add(result);
      }
    });
  }

  void _removeMainActivity(int index) {
    setState(() {
      _data.mainActivities!.removeAt(index);
    });
  }

  void _editAltActivity(int? index) async {
    late RequestActivityModel object;
    if (index is int && _data.altActivities != null) {
      object = _data.altActivities![index];
    } else {
      object = RequestActivityModel();
    }
    var result = await Navigator.push(context,
        MaterialPageRoute(builder: (_) => ActivityDialog(data: object)));

    if (result == null) return;

    setState(() {
      if (_data.altActivities == null) _data.altActivities = [];
      if (index is int) {
        _data.altActivities![index] = result;
      } else {
        _data.altActivities!.add(result);
      }
    });
  }

  void _removeAltActivity(int index) {
    setState(() {
      _data.altActivities!.removeAt(index);
    });
  }

  void _submit() {
    if (_form.currentState != null && _form.currentState!.validate()) {
      _form.currentState!.save();
      context.read<CompanyBloc>().add(CompanySaveEvent(_data));
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _willPop,
      child: BlocBuilder<CompanyBloc, CompanyState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              toolbarHeight: 70,
              centerTitle: true,
              title: Text(translate(Keys.label_form_title_text)),
            ),
            body: Form(
              key: _form,
              child: ListView(
                children: [
                  ExpansionTile(
                    initiallyExpanded: true,
                    title: Text(translate(Keys.label_form_general_header_text),
                        style: Theme.of(context).textTheme.headline6),
                    childrenPadding: EdgeInsets.all(20),
                    children: [
                      TextFormInput(
                        label: translate(Keys.label_form_name_label_text),
                        initialValue: _data.name,
                        validation: _validIsNull,
                        onSaved: (value) => _data.name = value,
                      ),
                      TextFormInput(
                        label: translate(Keys.label_form_nickname_label_text),
                        initialValue: _data.nickname,
                        validation: _validIsNull,
                        onSaved: (value) => _data.nickname = value,
                      ),
                      TextFormInput(
                        label: translate(Keys.label_form_nfi_label_text),
                        keyboardType: TextInputType.number,
                        validation: _validNfi,
                        onSaved: (value) => _data.nfi = value,
                        controller: _nifController,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: DropdownFormInput<Type?>(
                              label: translate(Keys.label_form_type_label_text),
                              value: _data.type,
                              onChange: (value) => _data.type = value,
                              items: [
                                DropdownMenuItem(
                                  value: Type.MATRIZ,
                                  child: Text(describeEnum(Type.MATRIZ)),
                                ),
                                DropdownMenuItem(
                                  value: Type.FILIAL,
                                  child: Text(describeEnum(Type.FILIAL)),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: DatePickerFormInput(
                              label: translate(Keys.label_form_opening_label_text),
                              value: _data.opening,
                              onChange: (value) => setState(() {
                                _data.opening = value;
                              }),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  ExpansionTile(
                    initiallyExpanded: true,
                    title: Text(translate(Keys.label_form_address_header_text),
                        style: Theme.of(context).textTheme.headline6),
                    childrenPadding: EdgeInsets.all(20),
                    children: [
                      TextFormInput(
                        label: translate(Keys.label_form_address_label_text),
                        initialValue: _data.address,
                        validation: _validIsNull,
                        onSaved: (value) => _data.address = value,
                      ),
                      TextFormInput(
                        label:
                            translate(Keys.label_form_neighborhood_label_text),
                        initialValue: _data.neighborhood,
                        validation: _validIsNull,
                        onSaved: (value) => _data.neighborhood = value,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: TextFormInput(
                              label:
                                  translate(Keys.label_form_number_label_text),
                              initialValue: _data.number,
                              validation: _validIsNull,
                              onSaved: (value) => _data.number = value,
                            ),
                          ),
                          Expanded(
                            child: TextFormInput(
                                label:
                                    translate(Keys.label_form_cep_label_text),
                                keyboardType: TextInputType.number,
                                controller: _cepController),
                          ),
                        ],
                      ),
                      TextFormInput(
                        label: translate(Keys.label_form_complement_label_text),
                        initialValue: _data.complement,
                        onSaved: (value) => _data.complement = value,
                      ),
                      Row(
                        children: [
                          Expanded(
                              flex: 2,
                              child: TextFormInput(
                                label:
                                    translate(Keys.label_form_city_label_text),
                                initialValue: _data.city,
                                validation: _validIsNull,
                                onSaved: (value) => _data.city = value,
                              )),
                          Expanded(
                              child: TextFormInput(
                            label: translate(Keys.label_form_uf_label_text),
                            initialValue: _data.uf,
                            validation: _validUf,
                            onSaved: (value) => _data.uf = value,
                          )),
                        ],
                      ),
                      TextFormInput(
                        label: translate(Keys.label_form_email_label_text),
                        keyboardType: TextInputType.emailAddress,
                        initialValue: _data.email,
                        onSaved: (value) => _data.email = value,
                      ),
                      TextFormInput(
                        label: translate(Keys.label_form_phone_label_text),
                        keyboardType: TextInputType.phone,
                        initialValue: _data.phone,
                        onSaved: (value) => _data.phone = value,
                      ),
                    ],
                  ),
                  ExpansionTile(
                    title: Text(
                        translate(Keys.label_form_situation_header_text),
                        style: Theme.of(context).textTheme.headline6),
                    childrenPadding: EdgeInsets.all(20),
                    children: [
                      TextFormInput(
                        label: translate(Keys.label_form_situation_label_text),
                        initialValue: _data.situation,
                        onSaved: (value) => _data.situation = value,
                      ),
                      DatePickerFormInput(
                        label: translate(
                            Keys.label_form_situation_date_label_text),
                        value: _data.situationDate,
                        onChange: (value) => setState(() {
                          _data.situationDate = value;
                        }),
                      ),
                      TextFormInput(
                        label: translate(
                            Keys.label_form_special_situation_label_text),
                        initialValue: _data.especialSituation,
                        onSaved: (value) => _data.especialSituation = value,
                      ),
                      DatePickerFormInput(
                        label: translate(
                            Keys.label_form_special_situation_date_label_text),
                        value: _data.especialSituationDate,
                        onChange: (value) => setState(() {
                          _data.especialSituationDate = value;
                        }),
                      ),
                    ],
                  ),
                  ExpansionTile(
                    title: Text(translate(Keys.label_form_partners_header_text),
                        style: Theme.of(context).textTheme.headline6),
                    childrenPadding: EdgeInsets.all(20),
                    children: [
                      ListView.separated(
                        shrinkWrap: true,
                        primary: false,
                        itemBuilder: (context, index) {
                          return PartnerCard(
                            data: _data.partners![index],
                            onEdit: () => _editPartner(index),
                            onRemove: () => _removePartner(index),
                          );
                        },
                        separatorBuilder: (context, index) =>
                            SizedBox(height: 5),
                        itemCount: _data.partners!.length,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: TextButton.icon(
                          icon: Icon(Icons.add),
                          onPressed: () => _editPartner(null),
                          label: Text(translate(Keys.label_add_button)),
                        ),
                      ),
                    ],
                  ),
                  ExpansionTile(
                    title: Text(
                        translate(Keys.label_form_main_activities_header_text),
                        style: Theme.of(context).textTheme.headline6),
                    childrenPadding: EdgeInsets.all(20),
                    children: [
                      ListView.separated(
                        shrinkWrap: true,
                        primary: false,
                        itemBuilder: (context, index) {
                          return ActivityCard(
                            data: _data.mainActivities![index],
                            onEdit: () => _editMainActivity(index),
                            onRemove: () => _removeMainActivity(index),
                          );
                        },
                        separatorBuilder: (context, index) =>
                            SizedBox(height: 5),
                        itemCount: _data.mainActivities!.length,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: TextButton.icon(
                          icon: Icon(Icons.add),
                          onPressed: () => _editMainActivity(null),
                          label: Text(translate(Keys.label_add_button)),
                        ),
                      ),
                    ],
                  ),
                  ExpansionTile(
                    title: Text(
                        translate(Keys.label_form_alt_activities_header_text),
                        style: Theme.of(context).textTheme.headline6),
                    childrenPadding: EdgeInsets.all(20),
                    children: [
                      ListView.separated(
                        shrinkWrap: true,
                        primary: false,
                        itemBuilder: (context, index) {
                          return ActivityCard(
                            data: _data.altActivities![index],
                            onEdit: () => _editAltActivity(index),
                            onRemove: () => _removeAltActivity(index),
                          );
                        },
                        separatorBuilder: (context, index) =>
                            SizedBox(height: 5),
                        itemCount: _data.altActivities!.length,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: TextButton.icon(
                          icon: Icon(Icons.add),
                          onPressed: () => _editAltActivity(null),
                          label: Text(translate(Keys.label_add_button)),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            bottomNavigationBar: Row(
              children: [
                Spacer(),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: FloatingButtonLoading(
                      loading: state is CompanyLoadingState,
                      heroTag: "app_btn",
                      onPressed: _submit,
                      label: Text(translate(Keys.label_save_button)),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
