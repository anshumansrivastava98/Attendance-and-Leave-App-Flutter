import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class ApplyLeave extends StatefulWidget {
  const ApplyLeave({Key? key}) : super(key: key);

  @override
  _ApplyLeaveState createState() => _ApplyLeaveState();
}

class _ApplyLeaveState extends State<ApplyLeave> {
  late String fromDate;
  late String toDate;
  DateRangePickerController _dateRangePickerController =
      DateRangePickerController();

  String typeLeave = "Select Leave Type";
  List<String> leaveList = [
    "CL/Contigency Leave",
    " Optional Holidays",
    " Special Privilege Leave ",
    " Work From Home",
    " Casual Leave",
    " Others",
  ];
  String? typeReason = "Select Reason Type";
  List<String> reasonList = [
    "Health Issues",
    "Personal Affairs",
    "Doctor Appointment",
    "Travel",
    "Family Issues",
    "Others",
  ];

  var checkbox = false;

  @override
  void initState() {
    super.initState();
    fromDate = DateFormat.yMd().format(DateTime.now());
    toDate = DateFormat.yMd().format(DateTime.now());
  }

  @override
  Widget build(BuildContext context) {
    final maxHeight = MediaQuery.of(context).size.height;
    final maxWidth = MediaQuery.of(context).size.width;
    final DateFormat formatter = DateFormat('dd/MM/yyyy');

    void _onSelectionChanged(DateRangePickerSelectionChangedArgs dateArgs) {
      print(dateArgs.value);
    }

    void _updateDates(dynamic value) {
      setState(() {
        fromDate = formatter.format(value.startDate);

        toDate = formatter.format(value.endDate);
      });
    }

    Widget TextFieldContainer(String title, String date) {
      return Container(
        height: maxHeight * 0.11,
        width: maxWidth * 0.9,
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.only(left: 20, top: 10),
              child: Text(
                title,
                style: TextStyle(
                    color: Colors.blue[700],
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20, top: 5),
              alignment: Alignment.bottomLeft,
              child: Text(
                date,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
              ),
            )
          ],
        ),
      );
    }

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.centerLeft,
                child: const Text(
                  'Leave & Attendance',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
              Container(
                alignment: Alignment.topLeft,
                child: Text(
                  'Apply leave',
                  style: TextStyle(fontSize: 13),
                ),
              )
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              //1st part
              Container(
                margin: EdgeInsets.fromLTRB(15, 20, 15, 0),
                padding: EdgeInsets.all(15),
                child: Text(
                  'Apply Leave',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                ),
                width: double.infinity,
              ),

              //2nd part
              Container(
                margin: EdgeInsets.fromLTRB(15, 15, 15, 0),
                padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: SfDateRangePicker(
                  
                  view: DateRangePickerView.month,
                  selectionMode: DateRangePickerSelectionMode.range,
                  onSelectionChanged: _onSelectionChanged,
                  showActionButtons: true,
                  controller: _dateRangePickerController,
                  onSubmit: _updateDates,
                  onCancel: () {
                    _dateRangePickerController.selectedRange = null;
                  },
                ),
              ),
              //3rd part
              Container(
                margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 15,
                    ),
                    TextFieldContainer("From Date*", fromDate),
                    SizedBox(
                      height: 15,
                    ),
                    TextFieldContainer("To Date*", toDate),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      height: maxHeight * 0.13,
                      width: maxWidth * 0.9,
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 10, left: 20),
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Type of Leave*",
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                color: Colors.blue,
                              ),
                            ),
                          ),
                          Container(
                            alignment: Alignment.bottomLeft,
                            margin: EdgeInsets.only(left: 15),
                            child: DropdownButton(
                              dropdownColor: Colors.white,
                              icon: Icon(
                                Icons.arrow_drop_down_outlined,
                                size: 30,
                                color: Colors.black,
                              ),
                              hint: Text(
                                typeLeave.toString(),
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w300),
                              ),
                              onChanged: (newValue) {
                                setState(() {
                                  typeLeave = newValue.toString();
                                });
                              },
                              items: leaveList.map((value) {
                                return DropdownMenuItem(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Transform.scale(
                          scale: 1.3,
                          child: Checkbox(
                              side: BorderSide(
                                width: 2,
                              ),
                              activeColor: Colors.blue[700],
                              value: checkbox,
                              onChanged: (value) {
                                setState(
                                  () {
                                    checkbox = !checkbox;
                                  },
                                );
                              }),
                        ),
                        SizedBox(
                          width: maxWidth * 0.04,
                        ),
                        Text(
                          "Apply for Half - Day",
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w300),
                        ),
                      ],
                    ),
                    Container(
                      height: maxHeight * 0.13,
                      width: maxWidth * 0.9,
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 10, left: 20),
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Type of Reason*",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                                color: Colors.blue[700],
                              ),
                            ),
                          ),
                          Container(
                            alignment: Alignment.bottomLeft,
                            margin: EdgeInsets.only(left: 15),
                            child: DropdownButton(
                              dropdownColor: Colors.white,
                              icon: Icon(
                                Icons.arrow_drop_down_outlined,
                                size: 30,
                                color: Colors.black,
                              ),
                              hint: Text(
                                typeReason.toString(),
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w300),
                              ),
                              onChanged: (newValue) {
                                setState(() {
                                  typeReason = newValue.toString();
                                });
                              },
                              items: reasonList.map((value) {
                                return DropdownMenuItem(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 30,
                          ),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.white,
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text(
                              "Cancel",
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.blue,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 35,
                          ),
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text(
                              "Confirm",
                              style:
                                  TextStyle(fontSize: 15, color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
