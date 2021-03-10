import 'package:flutter/material.dart';

class DashboardCard extends StatelessWidget {
  DashboardCard(
      {@required this.color,
      @required this.icon,
      @required this.label,
      @required this.value});
  final Color color;
  final IconData icon;
  final String label;
  final dynamic value;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 90,
        width: 250,
        margin: const EdgeInsets.only(top: 15, bottom: 15, right: 15),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(12)),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: Offset.zero)
            ]),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: Container(
                height: 90,
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(12),
                    bottomRight: Radius.circular(2),
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(2),
                  ),
                ),
                child: Icon(
                  icon,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ),
            Expanded(
                flex: 2,
                child: ListTile(
                  title: SelectableText(
                    "$label",
                    style: TextStyle(
                      fontSize: 13,
                    ),
                  ),
                  subtitle: SelectableText(
                    '$value',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
