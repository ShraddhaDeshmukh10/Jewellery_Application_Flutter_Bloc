import 'package:flutter/material.dart';
import 'package:flutter01/Model/model.dart';

class DataTableWidget extends StatelessWidget {
  final List<TableData> tableData;

  const DataTableWidget({required this.tableData});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        columns: [
          DataColumn(
            label: Container(
              color: Colors.grey[300],
              child: Text('Lot Description'),
            ),
          ),
          DataColumn(
            label: Container(
              color: Colors.grey[300],
              padding: EdgeInsets.all(8.0),
              child: Text('Group'),
            ),
          ),
          DataColumn(
            label: Container(
              color: Colors.grey[300],
              padding: EdgeInsets.all(8.0),
              child: Text('Units'),
            ),
          ),
          DataColumn(
            label: Container(
              color: Colors.grey[300],
              padding: EdgeInsets.all(8.0),
              child: Text('Pcs'),
            ),
          ),
          DataColumn(
            label: Container(
              color: Colors.grey[300],
              padding: EdgeInsets.all(8.0),
              child: Text('Weight'),
            ),
          ),
          DataColumn(
            label: Container(
              color: Colors.grey[300],
              padding: EdgeInsets.all(8.0),
              child: Text('Rate'),
            ),
          ),
          DataColumn(
            label: Container(
              color: Colors.grey[300],
              padding: EdgeInsets.all(8.0),
              child: Text('Value'),
            ),
          ),
          DataColumn(
            label: Container(
              color: Colors.grey[300],
              padding: EdgeInsets.all(8.0),
              child: Text('S Rate'),
            ),
          ),
          DataColumn(
            label: Container(
              color: Colors.grey[300],
              padding: EdgeInsets.all(8.0),
              child: Text('S Value'),
            ),
          ),
        ],
        rows: tableData.map((data) {
          return DataRow(
            color: MaterialStateProperty.all(Colors.grey[850]),
            cells: [
              DataCell(
                Container(
                  color: Colors.grey[850],
                  padding: EdgeInsets.all(8.0),
                  child: Text(data.lotDescription,
                      style: TextStyle(color: Colors.white)),
                ),
              ),
              DataCell(
                Container(
                  color: Colors.grey[850],
                  padding: EdgeInsets.all(8.0),
                  child:
                      Text(data.group, style: TextStyle(color: Colors.white)),
                ),
              ),
              DataCell(
                Container(
                  color: Colors.grey[850],
                  padding: EdgeInsets.all(8.0),
                  child:
                      Text(data.units, style: TextStyle(color: Colors.white)),
                ),
              ),
              DataCell(
                Container(
                  color: Colors.grey[850],
                  padding: EdgeInsets.all(8.0),
                  child: Text(data.pcs.toString(),
                      style: TextStyle(color: Colors.white)),
                ),
              ),
              DataCell(
                Container(
                  color: Colors.grey[850],
                  padding: EdgeInsets.all(8.0),
                  child: Text(data.weight.toString(),
                      style: TextStyle(color: Colors.white)),
                ),
              ),
              DataCell(
                Container(
                  color: Colors.grey[850],
                  padding: EdgeInsets.all(8.0),
                  child: Text(data.rate.toString(),
                      style: TextStyle(color: Colors.white)),
                ),
              ),
              DataCell(
                Container(
                  color: Colors.grey[850],
                  padding: EdgeInsets.all(8.0),
                  child: Text(data.value.toString(),
                      style: TextStyle(color: Colors.white)),
                ),
              ),
              DataCell(
                Container(
                  color: Colors.grey[850],
                  padding: EdgeInsets.all(8.0),
                  child: Text(data.sRate.toString(),
                      style: TextStyle(color: Colors.white)),
                ),
              ),
              DataCell(
                Container(
                  color: Colors.grey[850],
                  padding: EdgeInsets.all(8.0),
                  child: Text(data.sValue.toString(),
                      style: TextStyle(color: Colors.white)),
                ),
              ),
            ],
          );
        }).toList(),
      ),
    );
  }
}
