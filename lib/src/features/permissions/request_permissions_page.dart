import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wallet_exp/src/features/permissions/permissions_request.dart';
import 'package:wallet_exp/src/shared/bottom_nav_container.dart';
import 'package:wallet_exp/src/shared/grid.dart';

@RoutePage()
class RequestPermissionsPage extends StatelessWidget {
  final logger = Logger('RequestPermissionsPage');

  final Uri uri;
  RequestPermissionsPage({required this.uri, super.key});

  @override
  Widget build(BuildContext context) {
    final permissions =
        PermissionsRequest.fromBase64(uri.queryParameters['req']!);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Request Permissions'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Grid.xs),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: Grid.sm),
              Center(
                child: Text(
                  'From',
                  style: Theme.of(context).textTheme.headlineMedium,
                  textAlign: TextAlign.center,
                ),
              ),
              Center(child: Text(uri.host)),
              Center(
                child: Text(
                  '${permissions.descriptor["description"]}',
                  style: Theme.of(context).textTheme.bodyLarge,
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: Grid.sm),
              Center(
                child: Text(
                  'Granted by: ${permissions.descriptor["grantedBy"]}',
                  style: Theme.of(context).textTheme.bodyLarge,
                  textAlign: TextAlign.center,
                ),
              ),
              Center(
                child: Text(
                  'Granted to: ${permissions.descriptor["grantedTo"]}',
                  style: Theme.of(context).textTheme.bodyLarge,
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: Grid.sm),
              Center(
                child: Text(
                  'Scope: ${permissions.descriptor["scope"]["interface"]}:${permissions.descriptor["scope"]["method"]}',
                  style: Theme.of(context).textTheme.bodyLarge,
                  textAlign: TextAlign.center,
                ),
              ),
              Center(
                child: Text(
                  'Scope: ${permissions.descriptor["scope"]["schema"]}',
                  style: Theme.of(context).textTheme.bodySmall,
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: Grid.sm),
              Center(
                child: Text(
                  'Payload: ${permissions.authorization["payload"]}',
                  style: Theme.of(context).textTheme.bodyLarge,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavContainer(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: FilledButton(
                onPressed: () => _accept(context),
                child: const Text('Accept'),
              ),
            ),
            const SizedBox(width: Grid.sm),
            Expanded(
              child: FilledButton(
                onPressed: () => _reject(context),
                style: FilledButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.error),
                child: const Text('Reject'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _accept(BuildContext context) {
    final acceptUri = uri.queryParameters['x-success'];
    logger.info('Accept: $acceptUri');

    if (acceptUri == null) {
      logger.severe('No accept uri');
      return;
    }

    final jsonString = jsonEncode(acceptJson);
    final encodedString = base64.encode(utf8.encode(jsonString));
    final response = Uri.parse(acceptUri).replace(queryParameters: {
      'resp': encodedString,
    });

    if (context.mounted) {
      context.router.pop().then((value) async {
        if (await canLaunchUrl(response)) {
          launchUrl(response, mode: LaunchMode.externalApplication);
        } else {
          logger.warning('Cannot launch accept uri: $acceptUri');
        }
      });
    }
  }

  Future<void> _reject(BuildContext context) async {
    final errorUri = uri.queryParameters['x-error'];
    logger.warning('Error: $errorUri');
    if (errorUri == null) {
      logger.severe('No error uri');
      return;
    }

    if (context.mounted) {
      context.router.pop().then((value) async {
        if (await canLaunchUrl(Uri.parse(errorUri))) {
          launchUrl(Uri.parse(errorUri), mode: LaunchMode.externalApplication);
        } else {
          logger.warning('Cannot launch error uri: $errorUri');
        }
      });
    }
  }

  Map<String, dynamic> get acceptJson => jsonDecode('''
 {
  "descriptor": {
    "interface": "Permissions",
    "method": "Grant",
    "permissionGrantId": "f45wve-5b56v5w-5657b4e-56gqf35v",
    "permissionRequestId": "b6464162-84af-4aab-aff5-f1f8438dfc1e",
    "grantedBy": "did:example:bob",
    "grantedTo": "did:example:carol",
    "expiry": 1575606941,
    "delegatedFrom": "PARENT_PERMISSION_GRANT",
    "scope": {
      "method": "RecordsWrite",
      "schema": "https://schema.org/MusicPlaylist",
      "recordId": "f45wve-5b56v5w-5657b4e-56gqf35v"
    },
    "conditions": {
      "delegation": true,
      "publication": true,
      "sharedAccess": true,
      "encryption": "optional",
      "attestation": "prohibited"
    }
  },
  "authorization": {
    "payload": "89f5hw458fhw958fq094j9jdq0943j58jfq09j49j40f5qj30jf",
    "signatures": [{
      "protected": "4d093qj5h3f9j204fq8h5398hf9j24f5q9h83402048h453q",
      "signature": "49jq984h97qh3a49j98cq5h38j09jq9853h409jjq09h5q9j4"
    }]
  },
  "encryptionKey": { 
    "protected": "protected",
    "recipients": "recipients",
    "ciphertext": "ciphertext",
    "iv": "iv",
    "tag": "tag"
  }
}
''');
}
