import 'package:cyborgs/helper/colors_app.dart';
import 'package:cyborgs/provider/product_provider.dart';
import 'package:cyborgs/view/sheet/add_new_product_view.dart';
import 'package:cyborgs/view/sheet/bloc/sheet_info_bloc.dart';
import 'package:cyborgs/widget/TextStyleApp.dart';
import 'package:cyborgs/widget/error_view.dart';
import 'package:cyborgs/widget/loading_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cyborgs/model/product_model.dart';
import 'package:provider/provider.dart';

class SheetInfoView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SheetInfoView();
  }
}

class _SheetInfoView extends State<SheetInfoView> {
  List<Product> product = List<Product>();
  ProductProvider productProvider;
  @override
  void initState() {
    super.initState();
    productProvider = Provider.of<ProductProvider>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocBuilder<SheetInfoBloc, SheetInfoState>(
          builder: (context, state) {
            if (state is LoadingDataFromApi) {
              return LoadingView();
            } else if (state is LoadingDataSuccess) {
              productProvider.setNewProductListArray(
                  productList: state.productList);
              return Column(
                children: [
                  SizedBox(
                    height: 15,
                  ),
                  showTapBar(),
                  showInfo(state.productList),
                ],
              );
            } else {
              return showError();
            }
          },
        ),
        floatingActionButton: showFloatingActionButton());
  }

  Widget showText(String text) {
    return Flexible(
        flex: 1,
        child: Center(
            child:Text(text, style: boldStyle(color: firstColor, fontSize: 12),textAlign: TextAlign.center,)));
  }

  Widget showTapBar() {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          showText("name"),
          Spacer(),
          showText("email"),
          Spacer(),
          showText("mobile"),
          Spacer(),
          showText("mobile number"),
          Spacer(),
          showText('pursheData'),
        ],
      ),
    );
  }

  Widget showInfo(List<Product> itemProduct) {
    return ListView.builder(
      shrinkWrap: true,
      physics: BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        return showDataFromCart(itemProduct[index], itemProduct);
      },
      itemCount: itemProduct.length,
    );
  }

  Widget showDataFromCart(Product product, List<Product> itemProduct) {
    return Stack(
      children: [
        Card(
          child: Padding(
            padding: EdgeInsets.only(top: 26, bottom: 6),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  showText(product.name),
                  Spacer(),
                  showText(product.email),
                  Spacer(),
                  showText(product.mobile),
                  Spacer(),
                  showText(product.modelNumber),
                  Spacer(),
                  showText(product.purchaseDate),
                ],
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: IconButton(
            icon: Icon(Icons.clear),
            onPressed: () {
              BlocProvider.of<SheetInfoBloc>(context)
                ..add(DeleteDataFromGoogleSheet(
                    product: product, productList: itemProduct,context: context));
            },
          ),
        )
      ],
    );
  }

  Widget showError() {
    return ErrorView(
      function: () {
        BlocProvider.of<SheetInfoBloc>(context)
          ..add(LoadingDataFromGoogleSheet());
      },
    );
  }

  Widget showFloatingActionButton() {
    return FloatingActionButton(
      backgroundColor: colorThemApp,
      onPressed: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => AddNewProductView()));
      },
      child: Center(
        child: Icon(Icons.add),
      ),
    );
  }
}
