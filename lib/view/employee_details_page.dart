import 'package:flutter/material.dart';
import 'package:zorro_test/util/text_styles.dart';

import '../models/employee.dart';
import 'widgets/helper_widgets.dart';

class EmployeeDetailsPage extends StatefulWidget {
  final Employee employee;

  const EmployeeDetailsPage(this.employee, {Key? key}) : super(key: key);

  @override
  _EmployeeDetailsPageState createState() => _EmployeeDetailsPageState();
}

class _EmployeeDetailsPageState extends State<EmployeeDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Employee Details"),
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 3,
              width: MediaQuery.of(context).size.height / 3,
              child: Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(
                      MediaQuery.of(context).size.height / 3),
                  child: Image.network(
                    widget.employee.imageUrl,
                    height: double.infinity,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    loadingBuilder: (BuildContext context, Widget child,
                        ImageChunkEvent? loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Center(
                        child: CircularProgressIndicator(
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded /
                                  loadingProgress.expectedTotalBytes!
                              : null,
                        ),
                      );
                    },
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: Colors.white,
                        alignment: Alignment.center,
                        child: const Text(
                          'oops!',
                          style: TextStyle(fontSize: 30),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
            Text(
              "${widget.employee.firstName} ${widget.employee.lastName}",
              style: txtStyleHeader,
            ),
            Text(
              widget.employee.email,
              style: txtStyleParagraph,
            ),
            verticalSpacer(),
            Text(
              widget.employee.contactNumber,
              style: txtStyleSubHeader,
            ),
            Text(
              widget.employee.address,
              style: txtStyleSubHeader,
            ),
            verticalSpacer(),
            Text(
              "Date of Birth ${widget.employee.dob}",
              style: txtStyleSubHeader,
            ),
            Text(
              "Age ${widget.employee.age}",
              style: txtStyleSubHeader,
            ),
            Text(
              "Salary ${widget.employee.salary}",
              style: txtStyleSubHeader,
            ),
          ],
        ),
      ),
    );
  }
}
