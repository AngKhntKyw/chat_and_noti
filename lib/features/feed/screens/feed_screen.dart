import 'dart:convert';
import 'package:chat_and_noti/core/constant/townships.dart';
import 'package:flutter/material.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({super.key});

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  List<dynamic> allTownships = [];
  List<String> nrcCodes = [];
  String? selectedNrcCode;
  String? selectedTownship;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() {
    final jsonResult = json.decode(jsonData);
    allTownships = jsonResult['data'];

    // Extract unique NRC codes
    nrcCodes =
        allTownships
            .map((township) => township['nrc_code'].toString())
            .toSet()
            .toList()
          ..sort((a, b) => int.parse(a).compareTo(int.parse(b)));

    // Select first NRC code by default if available
    if (nrcCodes.isNotEmpty) {
      selectedNrcCode = nrcCodes.first;
    }
  }

  List<dynamic> getFilteredTownships() {
    if (selectedNrcCode == null) return [];
    return allTownships
        .where((township) => township['nrc_code'] == selectedNrcCode)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('NRC Township Selection')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // NRC Code Dropdown
            DropdownButtonFormField<String>(
              value: selectedNrcCode,
              decoration: InputDecoration(
                labelText: 'Select NRC Code',
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 16,
                ),
              ),
              isExpanded: true,
              items:
                  nrcCodes.map((code) {
                    return DropdownMenuItem<String>(
                      value: code,
                      child: Text('$code /'),
                    );
                  }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  selectedNrcCode = newValue;
                  selectedTownship = null;
                });
              },
            ),

            SizedBox(height: 20),

            // Township Dropdown
            DropdownButtonFormField<String>(
              value: selectedTownship,
              decoration: InputDecoration(
                labelText: 'Select Township',
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 16,
                ),
              ),
              isExpanded: true,
              items:
                  getFilteredTownships().map((township) {
                    return DropdownMenuItem<String>(
                      value: township['name_mm'],
                      child: Text(
                        township['name_mm'],
                        overflow: TextOverflow.ellipsis,
                      ),
                    );
                  }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  selectedTownship = newValue;
                });
              },
            ),

            SizedBox(height: 30),

            // Display selected values

            // if (selectedNrcCode != null && selectedTownship != null)
            Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Selected NRC Code:'),
                    Text('NRC $selectedNrcCode'),
                    SizedBox(height: 10),
                    Text('Selected Township:'),
                    Text(selectedTownship ?? "NULL"),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
