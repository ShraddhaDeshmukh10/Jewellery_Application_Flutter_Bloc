import 'package:flutter/material.dart';
import 'package:flutter01/Model/model.dart';
import 'package:flutter01/Widgets/custom_text_feild.dart';
import 'package:flutter01/Widgets/data_table.dart';
import 'package:flutter01/blocs/item_bloc.dart';
import 'package:flutter01/blocs/item_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SelectedItemDetails extends StatelessWidget {
  final Item item;

  const SelectedItemDetails({required this.item});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width / 1.2;

    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  height: size.height * 0.25, // Adjusted for responsiveness
                  child: GridView.count(
                    crossAxisCount: 5,
                    childAspectRatio: (itemWidth / itemHeight),
                    crossAxisSpacing: 8.0,
                    mainAxisSpacing: 8.0,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    children: [
                      CustomTextField(
                          label: 'Barcode No.', value: item.barcode),
                      CustomTextField(label: 'Location', value: item.location),
                      CustomTextField(label: 'Branch', value: item.branch),
                      CustomTextField(label: 'Status', value: item.status),
                      CustomTextField(
                          label: 'Counter', value: item.counter.toString()),
                      CustomTextField(label: 'Source', value: item.source),
                      CustomTextField(label: 'Category', value: item.category),
                      CustomTextField(
                          label: 'Collection', value: item.collection),
                      CustomTextField(
                          label: 'Description', value: item.description),
                      CustomTextField(
                          label: 'Metal Group', value: item.metalGrp),
                      CustomTextField(
                          label: 'Stock Section', value: item.stkSection),
                      CustomTextField(
                          label: 'Manufactured By', value: item.mfgdBy),
                      CustomTextField(label: 'Notes', value: item.notes),
                      CustomTextField(
                          label: 'In Stock Since', value: item.inStkSince),
                      CustomTextField(label: 'Cert No', value: item.certNo),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                flex: 1,
                child: Container(
                  width: size.width * 0.2,
                  height: size.height * 0.23,
                  child: Image.network(item.imageLink, fit: BoxFit.cover),
                ),
              ),
            ],
          ),
          Container(
            height: size.height * 0.26, // Adjusted for responsiveness
            child: GridView.count(
              crossAxisCount: 7,
              childAspectRatio: (itemWidth / itemHeight),
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              children: [
                CustomTextField(label: 'HUID No', value: item.huidNo),
                CustomTextField(
                    label: 'Order No.', value: item.orderNo.toString()),
                CustomTextField(label: 'Customer Name', value: item.cusName),
                CustomTextField(label: 'Size', value: item.size),
                CustomTextField(label: 'Quality', value: item.quality),
                CustomTextField(label: 'KT', value: item.kt.toString()),
                CustomTextField(label: 'Pcs', value: item.pcs.toString()),
                CustomTextField(
                    label: 'Gross Wt', value: item.grossWt.toString()),
                CustomTextField(label: 'Net Wt', value: item.netWt.toString()),
                CustomTextField(
                    label: 'Dia Pcs', value: item.diaPcs.toString()),
                CustomTextField(label: 'Dia Wt', value: item.diaWt.toString()),
                CustomTextField(
                    label: 'Cls Pcs', value: item.clsPcs.toString()),
                CustomTextField(label: 'Cls Wt', value: item.clsWt.toString()),
                CustomTextField(
                    label: 'Chain Wt', value: item.chainWt.toString()),
                CustomTextField(label: 'M Rate', value: item.mRate.toString()),
                CustomTextField(
                    label: 'M Value', value: item.mValue.toString()),
                CustomTextField(label: 'L Rate', value: item.lRate.toString()),
                CustomTextField(
                    label: 'L Charges', value: item.lCharges.toString()),
                CustomTextField(
                    label: 'R Charges', value: item.rCharges.toString()),
                CustomTextField(
                    label: 'O Charges', value: item.oCharges.toString()),
                CustomTextField(label: 'MRP', value: item.mrp.toString()),
              ],
            ),
          ),
          DataTableWidget(tableData: item.tableData),
          SizedBox(height: 0.05 * itemHeight),
          Center(
            child: TextButton(
              onPressed: () {
                BlocProvider.of<ItemBloc>(context).add(ClearSelection());
              },
              child: Text('Clear', style: TextStyle(color: Colors.blue)),
            ),
          ),
        ],
      ),
    );
  }
}
