import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:onlyfood_mo/models/campaign.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CreateCampaignScreen extends StatefulWidget {
  final Function()? onCampaignSuccess;

  const CreateCampaignScreen({Key? key, this.onCampaignSuccess})
      : super(key: key);

  @override
  _CreateCampaignScreenState createState() => _CreateCampaignScreenState();
}

class _CreateCampaignScreenState extends State<CreateCampaignScreen> {
  String? chefID;
  DateTime? _selectedStartDate;
  DateTime? _selectedEndDate;
  String? campaignId;

  TextEditingController campaignNameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController startDateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();

  Future<void> _selectStartDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != _selectedStartDate) {
      setState(() {
        _selectedStartDate = picked;
        startDateController.text = _selectedStartDate!.toString();
      });
    }
  }

  Future<void> _selectEndDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != _selectedEndDate) {
      setState(() {
        _selectedEndDate = picked;
        endDateController.text = _selectedEndDate!.toString();
      });
    }
  }

  @override
  void initState() {
    super.initState();

    getAccountId();
  }

  Future<void> getAccountId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? accountId = prefs.getString('chefID');
    setState(() {
      chefID = accountId;
    });
  }

  Future<Campaign> createCampaign(
    String campaignName,
    String description,
    DateTime startDate,
    DateTime endDate,
    String chefID,
    int status,
  ) async {
    try {
      var url =
          Uri.parse("https://onlyfoods.azurewebsites.net/api/v1/campaigns");

      // Tạo dữ liệu JSON từ các trường cần gửi
      var request = {
        'campaignName': campaignName,
        'description': description,
        'startDate': startDate.toIso8601String(),
        'endDate': endDate.toIso8601String(),
        'chefID': chefID,
        'status': status.toString(),
      };

      // Chuyển đổi Map thành chuỗi JSON
      var jsonData = json.encode(request);

      // Tạo yêu cầu HTTP
      var response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonData,
      );
      String data;
      print(request);
      if (response.statusCode == 200) {
        // Parse phản hồi từ máy chủ
        var responseBody = await response.body;
        Map<String, dynamic> jsonData = json.decode(responseBody);
        String dataValue = jsonData['data'];
        campaignId = dataValue;
        return Campaign.fromJson(json.decode(responseBody));
      } else {
        print(
            'Failed to create campaign. Server returned status ${response.statusCode}');
        print('Response body: ${await response.body}');
        throw Exception(
            'Failed to create campaign. Server returned status ${response.statusCode}');
      }
    } catch (e) {
      print('Error occurred while creating campaign: $e');
      throw Exception('Error occurred while creating campaign: $e');
    }
  }

  Future<void> submitCampaign() async {
    if (campaignNameController.text.isEmpty ||
        descriptionController.text.isEmpty ||
        chefID == null ||
        _selectedStartDate == null ||
        _selectedEndDate == null) {
      return;
    }

    try {
      await createCampaign(
        campaignNameController.text,
        descriptionController.text,
        _selectedStartDate!,
        _selectedEndDate!,
        chefID!,
        0,
      );

      _showSuccessDialog(campaignId!);
    } catch (e) {
      print('Error submitting campaign: $e');
      // You might want to show an error dialog here.
    }
  }

  void _showSuccessDialog(String campaignId) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return _buildSuccessDialog(campaignId);
      },
    );
  }

  Widget _buildSuccessDialog(String campaignId) {
    return AlertDialog(
      title: const Text('Campaign Successful'),
      content: const Text('Your campaign has been added successfully.'),
      actions: [
        ElevatedButton(
          onPressed: () async {
            Navigator.of(context).pop(); // Close the dialog

            // Call createMenu with the campaignId
            await createMenu(campaignId);

            Navigator.of(context).pop(); // Navigate back to the previous screen
            widget.onCampaignSuccess?.call(); // Call the callback
          },
          child: const Text('OK'),
        ),
      ],
    );
  }

  Future<void> createMenu(String campaignId) async {
    try {
      var url = Uri.parse(
          "https://onlyfoods.azurewebsites.net/api/v1/menus"); // Replace with your actual menu API URL

      // Your menu creation logic here, you can use the campaignId obtained from the response

      // Example: Creating a menu request
      var menuRequest = {
        'campaignId': campaignId,
        'isDeleted': 0,
        'isEdited': 0
      };

      // Convert menu request to JSON
      var menuJsonData = json.encode(menuRequest);

      // Send a POST request to create the menu
      var menuResponse = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: menuJsonData,
      );

      if (menuResponse.statusCode == 200) {
        print('Menu created successfully.');
      } else {
        print(
            'Failed to create menu. Server returned status ${menuResponse.statusCode}');
        print('Response body: ${await menuResponse.body}');
      }
    } catch (e) {
      print('Error occurred while creating menu: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title:
            const Text('New Campaign', style: TextStyle(color: Colors.black)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.fromLTRB(0, 5, 0, 5),
              child: const Text(
                "Create a new Campaign!",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: campaignNameController,
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                hintText: 'CampaignName',
                labelText: 'CampaignName',
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                labelStyle: const TextStyle(color: Colors.black),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: descriptionController,
              style: TextStyle(color: Colors.black),
              maxLines: 2,
              decoration: InputDecoration(
                hintText: 'Description',
                labelText: 'Description',
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                labelStyle: const TextStyle(color: Colors.black),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: startDateController,
              style: TextStyle(color: Colors.black),
              readOnly: true,
              onTap: () => _selectStartDate(context),
              decoration: InputDecoration(
                hintText: 'StartDate',
                labelText: 'StartDate',
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                labelStyle: const TextStyle(color: Colors.black),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: endDateController,
              style: TextStyle(color: Colors.black),
              readOnly: true,
              onTap: () => _selectEndDate(context),
              decoration: InputDecoration(
                hintText: 'EndDate',
                labelText: 'EndDate',
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                labelStyle: const TextStyle(color: Colors.black),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: submitCampaign,
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
              ),
              child:
                  const Text('Submit', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
