import 'package:flutter/material.dart';
import 'package:graduation_2/user.dart';

typedef OnDelete();

class UserForm extends StatefulWidget {
  final User user;
  final state = _UserFormState();
  final OnDelete onDelete;
  UserForm({required Key key, required this.user, required this.onDelete})
      : super(key: key);
  @override
  _UserFormState createState() => state;

  /*bool isValid() => state.validate();*/
}

class _UserFormState extends State<UserForm> {
  String valueChoose = "";
  List listItem = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday"];
  final form = GlobalKey<FormState>();
  String _selectedtime = '8:00 AM';
  Future<void> _openTimePicker(BuildContext context) async {
    final TimeOfDay? t =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());

    if (t != null) {
      setState(() {
        _selectedtime = t.format(context);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Material(
        elevation: 1,
        clipBehavior: Clip.antiAlias,
        borderRadius: BorderRadius.circular(8),
        child: Form(
          key: form,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              AppBar(
                leading: Icon(Icons.verified_user),
                elevation: 0,
                title: Text('Class Details'),
                backgroundColor: Colors.indigo[200],
                centerTitle: true,
                actions: <Widget>[
                  IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: widget.onDelete,
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 16, right: 16, top: 16),
                child: TextFormField(
                  initialValue: widget.user.fullName,
                  onSaved: (val) => widget.user.fullName = val!,
                  /*validator: (val) =>
                      val.length > 3 ? null : 'Full name is invalid',

                   */
                  decoration: InputDecoration(
                    labelText: 'Class time',
                    hintText: 'Enter Class time',
                    icon: Icon(Icons.timer),
                    isDense: true,
                  ),
                  onTap: () {
                    _openTimePicker(context);
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 45),
                child: DropdownButton<String>(
                  hint: Text('Monday'),
                  dropdownColor: Colors.white,
                  icon: Icon(Icons.arrow_drop_down_sharp),
                  iconSize: 36,
                  isExpanded: true,
                  underline: SizedBox(),
                  style: TextStyle(color: Colors.black, fontSize: 15),
                  items: listItem.map((valueItem) {
                    return DropdownMenuItem<String>(
                      value: valueChoose,
                      child: Text(valueItem),
                    );
                  }).toList(),
                  onChanged: (New_value) {
                    setState(() {
                      valueChoose = New_value!;
                    });
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
/*
  ///form validator
  bool validate() {
    var valid = form.currentState.validate();
    if (valid) form.currentState.save();
    return valid;
  }

 */
}
