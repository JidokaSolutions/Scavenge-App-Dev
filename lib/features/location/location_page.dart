// widgets/location_widget.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:scavenge_hunt/features/location/location_provider.dart';

class LocationWidget extends ConsumerWidget {
  const LocationWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locationState = ref.watch(locationProvider);
    final locationNotifier = ref.read(locationProvider.notifier);
    final streamSettings = ref.watch(locationStreamSettingsProvider);

    return Scaffold(
      appBar: AppBar(backgroundColor: Theme.of(context).colorScheme.inversePrimary, title: const Text("Location Page")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Display current location
            if (locationState.hasData)
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Location Data', style: Theme.of(context).textTheme.titleMedium),
                          if (locationState.isStreaming)
                            const Row(
                              children: [
                                Icon(Icons.location_on, color: Colors.green, size: 16),
                                SizedBox(width: 4),
                                Text('Live', style: TextStyle(color: Colors.green)),
                              ],
                            ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      _buildInfoRow('Latitude', locationState.latitude?.toStringAsFixed(6)),
                      _buildInfoRow('Longitude', locationState.longitude?.toStringAsFixed(6)),
                      if (locationState.address != null) _buildInfoRow('Address', locationState.address),
                      _buildInfoRow('Updates', locationState.updateCount.toString()),
                      if (locationState.isStreaming) _buildInfoRow('Status', 'Streaming live location'),
                    ],
                  ),
                ),
              ),

            const SizedBox(height: 16),

            // Loading indicator
            if (locationState.isLoading) const Column(children: [CircularProgressIndicator(), SizedBox(height: 8), Text('Getting location...')]),

            // Error message
            if (locationState.hasError)
              Column(
                children: [
                  Card(
                    color: Colors.red[50],
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        children: [
                          const Icon(Icons.error, color: Colors.red),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text('Error: ${locationState.error}', style: const TextStyle(color: Colors.red)),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  ElevatedButton(onPressed: locationNotifier.clearError, child: const Text('Clear Error')),
                ],
              ),

            const SizedBox(height: 20),

            // Action buttons
            Column(
              children: [
                // Get single location button
                ElevatedButton(
                  onPressed: locationState.isLoading ? null : () => locationNotifier.getCurrentLocation(),
                  style: ElevatedButton.styleFrom(minimumSize: const Size(double.infinity, 48)),
                  child: const Text('Get Current Location'),
                ),

                const SizedBox(height: 12),

                // Start/Stop stream buttons
                if (!locationState.isStreaming)
                  ElevatedButton(
                    onPressed: locationState.isLoading
                        ? null
                        : () => locationNotifier.startLocationStream(
                      accuracy: streamSettings.accuracy,
                      distanceFilter: streamSettings.distanceFilter,
                      interval: streamSettings.interval,
                    ),
                    style: ElevatedButton.styleFrom(minimumSize: const Size(double.infinity, 48), backgroundColor: Colors.green),
                    child: const Text('Start Location Stream', style: TextStyle(color: Colors.white)),
                  )
                else
                  ElevatedButton(
                    onPressed: locationNotifier.stopLocationStream,
                    style: ElevatedButton.styleFrom(minimumSize: const Size(double.infinity, 48), backgroundColor: Colors.red),
                    child: const Text('Stop Location Stream', style: TextStyle(color: Colors.white)),
                  ),

                const SizedBox(height: 12),

                // Reset button
                if (locationState.hasData || locationState.hasError)
                  OutlinedButton(
                    onPressed: locationNotifier.reset,
                    style: OutlinedButton.styleFrom(minimumSize: const Size(double.infinity, 48)),
                    child: const Text('Reset All'),
                  ),
              ],
            ),

            const SizedBox(height: 20),

            // Stream settings (optional)
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Stream Settings', style: Theme.of(context).textTheme.titleSmall),
                    const SizedBox(height: 8),
                    Text('Accuracy: ${streamSettings.accuracy.name}'),
                    Text('Distance Filter: ${streamSettings.distanceFilter}m'),
                    Text('Interval: ${streamSettings.interval.inSeconds}s'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String? value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 80,
            child: Text('$label:', style: const TextStyle(fontWeight: FontWeight.bold)),
          ),
          const SizedBox(width: 8),
          Expanded(child: Text(value ?? 'N/A')),
        ],
      ),
    );
  }
}
