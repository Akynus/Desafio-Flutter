import 'dart:async';

import 'package:challenge_flutter/src/blocs/request/request_bloc.dart';
import 'package:challenge_flutter/src/models/request_model.dart';
import 'package:challenge_flutter/src/widget/floating_button_loading.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:challenge_flutter/src/resources/translate.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:challenge_flutter/src/utils/extensions.dart';

class RequestForm extends StatefulWidget {
  final VoidCallback onNew;
  final ValueChanged<RequestModel> onData;

  const RequestForm({Key? key, required this.onNew, required this.onData})
      : super(key: key);

  @override
  _RequestFormState createState() => _RequestFormState();
}

class _RequestFormState extends State<RequestForm> {
  late TextEditingController _controller;
  late GlobalKey<FormState> _form;
  late StreamSubscription _searchListen;

  @override
  void initState() {
    _controller = MaskedTextController(mask: '00.000.000/0000-00');
    _form = GlobalKey();

    _searchListen = BlocProvider.of<RequestBloc>(context).stream.listen((state) {
      if (state is RequestDataState) {
        _controller.text = "";
        widget.onData(state.data);
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    _searchListen.cancel();
    super.dispose();
  }

  String? _validate(String? text) {
    if (text == null || text.isEmpty)
      return translate(Keys.error_required_field);
    if (text.onlyNumbers.length != 14)
      return translate(Keys.error_invalid_field);
    return null;
  }

  void _submit() async {
    FocusScope.of(context).unfocus();
    if (_form.currentState != null && _form.currentState!.validate()) {
      context
          .read<RequestBloc>()
          .add(RequestDataEvent(_controller.text.onlyNumbers));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: 400),
      padding: EdgeInsets.all(20),
      child: Form(
        key: _form,
        child: BlocBuilder<RequestBloc, RequestState>(
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                TextFormField(
                  controller: _controller,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: translate(Keys.label_nif_hint_input),
                    errorText:
                        (state is RequestErrorState) ? state.message : null,
                  ),
                  style: Theme.of(context).textTheme.headline6,
                  validator: _validate,
                ),
                SizedBox(height: 20),
                FloatingButtonLoading(
                  heroTag: "app_btn",
                  loading: state is RequestLoadingState,
                  onPressed: _submit,
                  icon: Icon(Icons.search),
                  label: Text(translate(Keys.label_request_submit_button)),
                ),
                SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: RichText(
                    text: TextSpan(
                      text: translate(Keys.label_no_nif_label_text),
                      style: Theme.of(context).textTheme.bodyText2,
                      children: [
                        TextSpan(
                          text: translate(Keys.label_no_nif_label_button),
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = widget.onNew,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
