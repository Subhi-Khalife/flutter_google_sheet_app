import 'package:cyborgs/view/sheet/bloc/sheet_info_bloc.dart';
import 'package:cyborgs/widget/TextFieldApp.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cyborgs/provider/product_provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:cyborgs/widget/button_view.dart';

class AddNewProductView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AddNewProductView();
  }
}

class _AddNewProductView extends State<AddNewProductView> {
  ProductProvider productProvider;
  @override
  void initState() {
    super.initState();
    productProvider = Provider.of<ProductProvider>(context, listen: false);
    productProvider.initValue();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.only(left: 16, right: 16),
      child: ListView(
        children: [
          TextFieldApp(
            controller: productProvider.nameController,
            isTextFieldPassword: false,
            withIcon: false,
            hintText: "name",
          ),
          TextFieldApp(
            controller: productProvider.emailController,
            isTextFieldPassword: false,
            withIcon: false,
            hintText: "email",
          ),
          TextFieldApp(
            controller: productProvider.mobileController,
            isTextFieldPassword: false,
            withIcon: false,
            hintText: "mobile number",
          ),
          TextFieldApp(
            controller: productProvider.modelNumberController,
            isTextFieldPassword: false,
            withIcon: false,
            hintText: "model number",
          ),
          SizedBox(height: 70),
          raisedButton(
            function: () {
              BlocProvider.of<SheetInfoBloc>(context)..add(AddNewProductToGoogleSheet(context: context));
            },
            textButton: "Add New Product",
          )
        ],
      ),
    ));
  }
}
