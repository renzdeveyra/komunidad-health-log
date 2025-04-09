import 'package:flutter/material.dart';

/// Widget that displays the sync status in the app bar
class SyncStatusIndicator extends StatelessWidget {
  final SyncStatus status;
  final DateTime? lastSyncTime;
  final VoidCallback? onTap;
  
  const SyncStatusIndicator({
    super.key,
    required this.status,
    this.lastSyncTime,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildIcon(),
            if (status != SyncStatus.syncing) const SizedBox(width: 4),
            if (status != SyncStatus.syncing)
              Text(
                _getStatusText(),
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Colors.white,
                ),
              ),
          ],
        ),
      ),
    );
  }
  
  Widget _buildIcon() {
    switch (status) {
      case SyncStatus.synced:
        return const Icon(Icons.cloud_done, color: Colors.white, size: 20);
      case SyncStatus.syncing:
        return const SizedBox(
          width: 20,
          height: 20,
          child: CircularProgressIndicator(
            strokeWidth: 2,
            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
          ),
        );
      case SyncStatus.pending:
        return const Icon(Icons.cloud_queue, color: Colors.white, size: 20);
      case SyncStatus.error:
        return const Icon(Icons.cloud_off, color: Colors.white, size: 20);
    }
  }
  
  String _getStatusText() {
    switch (status) {
      case SyncStatus.synced:
        if (lastSyncTime != null) {
          return _formatLastSyncTime(lastSyncTime!);
        }
        return 'Synced';
      case SyncStatus.syncing:
        return 'Syncing...';
      case SyncStatus.pending:
        return 'Pending';
      case SyncStatus.error:
        return 'Sync Failed';
    }
  }
  
  String _formatLastSyncTime(DateTime time) {
    final now = DateTime.now();
    final difference = now.difference(time);
    
    if (difference.inMinutes < 1) {
      return 'Just now';
    } else if (difference.inHours < 1) {
      return '${difference.inMinutes}m ago';
    } else if (difference.inDays < 1) {
      return '${difference.inHours}h ago';
    } else {
      return '${difference.inDays}d ago';
    }
  }
}

/// Sync status enum
enum SyncStatus {
  synced,
  syncing,
  pending,
  error,
}
