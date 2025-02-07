import 'package:AdminApp/core/function/validinput.dart';
import 'package:AdminApp/core/shared(shortcuts)/customtextformglobal.dart';
import 'package:drop_down_list/drop_down_list.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDropdownlistSearch extends StatefulWidget {
  final String title;
  final List<SelectedListItem>? listdata;
  final TextEditingController dropDownNameController;
  final TextEditingController dropDownIdController;

  const CustomDropdownlistSearch({
    super.key,
    required this.title,
    required this.listdata,
    required this.dropDownNameController,
    required this.dropDownIdController,
  });

  @override
  State<CustomDropdownlistSearch> createState() =>
      _CustomDropdownlistSearchState();
}

class _CustomDropdownlistSearchState extends State<CustomDropdownlistSearch> {
  void showdropdownsearch() {
    DropDownState(
        dropDown: DropDown(
            isDismissible: true,
            bottomSheetTitle: Text(
              widget.title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0.sp,
              ),
            ),
            submitButtonText: 'Save',
            clearButtonText: 'Clear',
            data: widget.listdata ?? [],
            onSelected: (selectedItems) {
              SelectedListItem selectedListItem = selectedItems[0];
              widget.dropDownNameController.text = selectedListItem.data;
              widget.dropDownIdController.text = selectedListItem.data;
            })).showModal(context);
  }

  @override
  Widget build(BuildContext context) {
    return Customtextformglobal(
        readOnly: true,
        onTap: () {
          FocusScope.of(context).unfocus();
          showdropdownsearch();
        },
        hint: widget.dropDownNameController.text == ""
            ? "Click the row"
            : widget.dropDownNameController.text,
        label: "Choose Category",
        icon: EvaIcons.arrowDown,
        mycontroller: widget.dropDownNameController,
        validatores: (val) {
          return validinput(val!, 0, 100, "");
        },
        keyboardTypeform: TextInputType.text);
  }
}
