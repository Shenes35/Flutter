import 'dart:convert';

import 'package:http/http.dart' as http;

Future<void> sendPushNotificationcomplete(String taskTitle) async {
  const oneSignalAppId = 'db0ee442-1b04-4fbb-a7e2-e15668674bac'; // Your OneSignal App ID
  const oneSignalRestApiKey = 'os_v2_app_3mhoiqq3arh3xj7c4flgqz2lvq4ipmwg25tudjuy5fdnd3ctplxb2jr5lucmq67bqfu6xvsujswj6hrqcd5hfvcfjvlwmao2zbwn7mi'; // Your REST API Key

  final url = Uri.parse('https://onesignal.com/api/v1/notifications');

  final headers = {
    'Content-Type': 'application/json; charset=utf-8',
    'Authorization': 'Basic $oneSignalRestApiKey',
  };

  final body = jsonEncode({
    'app_id': oneSignalAppId,
    'included_segments': ['All'], // Send to all subscribed users
    'headings': {'en': 'Task completed'},
    'contents': {'en': '"$taskTitle" has been completed.'},
  });

  final response = await http.post(url, headers: headers, body: body);

  if (response.statusCode == 200) {
    print('✅ Broadcast notification sent successfully');
  } else {
    print('❌ Failed to send broadcast notification: ${response.statusCode} ${response.body}');
  }
}
Future<void> sendPushNotificationdelete(String taskTitle) async {
  const oneSignalAppId = 'db0ee442-1b04-4fbb-a7e2-e15668674bac'; // Your OneSignal App ID
  const oneSignalRestApiKey = 'os_v2_app_3mhoiqq3arh3xj7c4flgqz2lvq4ipmwg25tudjuy5fdnd3ctplxb2jr5lucmq67bqfu6xvsujswj6hrqcd5hfvcfjvlwmao2zbwn7mi'; // Your REST API Key

  final url = Uri.parse('https://onesignal.com/api/v1/notifications');

  final headers = {
    'Content-Type': 'application/json; charset=utf-8',
    'Authorization': 'Basic $oneSignalRestApiKey',
  };

  final body = jsonEncode({
    'app_id': oneSignalAppId,
    'included_segments': ['All'], // Send to all subscribed users
    'headings': {'en': 'Task deleted'},
    'contents': {'en': '"$taskTitle" has been deleted.'},
  });

  final response = await http.post(url, headers: headers, body: body);

  if (response.statusCode == 200) {
    print('✅ Broadcast notification sent successfully');
  } else {
    print('❌ Failed to send broadcast notification: ${response.statusCode} ${response.body}');
  }
}
Future<void> sendPushNotificationadd(String taskTitle) async {
  const oneSignalAppId = 'db0ee442-1b04-4fbb-a7e2-e15668674bac'; // Your OneSignal App ID
  const oneSignalRestApiKey = 'os_v2_app_3mhoiqq3arh3xj7c4flgqz2lvq4ipmwg25tudjuy5fdnd3ctplxb2jr5lucmq67bqfu6xvsujswj6hrqcd5hfvcfjvlwmao2zbwn7mi'; // Your REST API Key

  final url = Uri.parse('https://onesignal.com/api/v1/notifications');

  final headers = {
    'Content-Type': 'application/json; charset=utf-8',
    'Authorization': 'Basic $oneSignalRestApiKey',
  };

  final body = jsonEncode({
    'app_id': oneSignalAppId,
    'included_segments': ['All'], // Send to all subscribed users
    'headings': {'en': 'New Task Created'},
    'contents': {'en': '"$taskTitle" has been created.'},
  });

  final response = await http.post(url, headers: headers, body: body);

  if (response.statusCode == 200) {
    print('✅ Broadcast notification sent successfully');
  } else {
    print('❌ Failed to send broadcast notification: ${response.statusCode} ${response.body}');
  }
}

Future<void> sendPushNotificationupdate(String taskTitle) async {
  const oneSignalAppId = 'db0ee442-1b04-4fbb-a7e2-e15668674bac'; // Your OneSignal App ID
  const oneSignalRestApiKey = 'os_v2_app_3mhoiqq3arh3xj7c4flgqz2lvq4ipmwg25tudjuy5fdnd3ctplxb2jr5lucmq67bqfu6xvsujswj6hrqcd5hfvcfjvlwmao2zbwn7mi'; // Your REST API Key

  final url = Uri.parse('https://onesignal.com/api/v1/notifications');

  final headers = {
    'Content-Type': 'application/json; charset=utf-8',
    'Authorization': 'Basic $oneSignalRestApiKey',
  };

  final body = jsonEncode({
    'app_id': oneSignalAppId,
    'included_segments': ['All'], // Send to all subscribed users
    'headings': {'en': 'Task Updated'},
    'contents': {'en': '"$taskTitle" has been updated.'},
  });

  final response = await http.post(url, headers: headers, body: body);

  if (response.statusCode == 200) {
    print('✅ Broadcast notification sent successfully');
  } else {
    print('❌ Failed to send broadcast notification: ${response.statusCode} ${response.body}');
  }
}
