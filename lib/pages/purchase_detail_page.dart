import 'package:flutter/material.dart';
import '../models/user.dart';
import '../models/purchase.dart';
import '../helpers/database_helper.dart';
import 'edit_purchase_page.dart';

class PurchaseDetailPage extends StatefulWidget {
  final int purchaseId;
  final User user;

  const PurchaseDetailPage({
    super.key,
    required this.purchaseId,
    required this.user,
  });

  @override
  State<PurchaseDetailPage> createState() => _PurchaseDetailPageState();
}

class _PurchaseDetailPageState extends State<PurchaseDetailPage> {
  Purchase? _purchase;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadPurchase();
  }

  Future<void> _loadPurchase() async {
    setState(() => _isLoading = true);
    final dbHelper = DatabaseHelper();
    final purchase = await dbHelper.getPurchaseById(widget.purchaseId);
    setState(() {
      _purchase = purchase;
      _isLoading = false;
    });
  }

  Future<void> _deletePurchase() async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: const Text(
          'Cancel Purchase',
          style: TextStyle(
            color: Color(0xFF8B0000),
            fontWeight: FontWeight.bold,
          ),
        ),
        content: const Text(
          'Are you sure you want to cancel this purchase? This action cannot be undone.',
          style: TextStyle(fontSize: 14),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text(
              'No',
              style: TextStyle(
                color: Colors.black54,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(context, true),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF8B0000),
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              elevation: 0,
            ),
            child: const Text(
              'Yes, Cancel',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );

    if (confirmed == true) {
      final dbHelper = DatabaseHelper();
      await dbHelper.deletePurchase(widget.purchaseId);
      if (mounted) {
        Navigator.pop(context, true);
      }
    }
  }

  String _maskCardNumber(String cardNumber) {
    if (cardNumber.length < 4) return cardNumber;
    return '**** **** **** ${cardNumber.substring(cardNumber.length - 4)}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAF7F5),
      appBar: AppBar(
        backgroundColor: const Color(0xFF8B0000),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Purchase Detail',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.5,
          ),
        ),
      ),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF8B0000)),
              ),
            )
          : _purchase == null
          ? const Center(
              child: Text(
                'Purchase not found',
                style: TextStyle(fontSize: 16, color: Colors.black54),
              ),
            )
          : SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    color: Colors.white,
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.network(
                            _purchase!.moviePoster,
                            height: 300,
                            width: 200,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                height: 300,
                                width: 200,
                                color: const Color(0xFF8B0000).withOpacity(0.1),
                                child: const Icon(
                                  Icons.movie,
                                  size: 64,
                                  color: Color(0xFF8B0000),
                                ),
                              );
                            },
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          _purchase!.movieTitle,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF8B0000),
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 2),
                  Container(
                    color: Colors.white,
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Booking Information',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF8B0000),
                          ),
                        ),
                        const SizedBox(height: 16),
                        _buildInfoRow(
                          'Schedule',
                          _purchase!.movieSchedule,
                          Icons.access_time,
                        ),
                        _buildInfoRow(
                          'Buyer Name',
                          _purchase!.buyerName,
                          Icons.person,
                        ),
                        _buildInfoRow(
                          'Number of Tickets',
                          '${_purchase!.quantity}',
                          Icons.confirmation_number,
                        ),
                        _buildInfoRow(
                          'Purchase Date',
                          _purchase!.purchaseDate,
                          Icons.calendar_today,
                        ),
                        _buildInfoRow(
                          'Payment Method',
                          _purchase!.paymentMethod,
                          Icons.payment,
                        ),
                        if (_purchase!.cardNumber != null)
                          _buildInfoRow(
                            'Card Number',
                            _maskCardNumber(_purchase!.cardNumber!),
                            Icons.credit_card,
                          ),
                        const Divider(height: 32, color: Color(0xFFE0E0E0)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Total Amount',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF8B0000),
                              ),
                            ),
                            Text(
                              'Rp ${_purchase!.totalPrice.toStringAsFixed(0)}',
                              style: const TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF8B0000),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: const Color(0xFF8B0000).withOpacity(0.1),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                _purchase!.status == 'completed'
                                    ? Icons.check_circle
                                    : Icons.cancel,
                                color: const Color(0xFF8B0000),
                                size: 20,
                              ),
                              const SizedBox(width: 8),
                              Text(
                                'Status: ${_purchase!.status.toUpperCase()}',
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF8B0000),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        if (_purchase!.status == 'completed')
                          SizedBox(
                            width: double.infinity,
                            height: 50,
                            child: ElevatedButton.icon(
                              onPressed: () async {
                                final result = await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => EditPurchasePage(
                                      purchase: _purchase!,
                                      user: widget.user,
                                    ),
                                  ),
                                );
                                if (result == true) {
                                  _loadPurchase();
                                }
                              },
                              icon: const Icon(Icons.edit, size: 20),
                              label: const Text(
                                'Edit Purchase',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF8B0000),
                                foregroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                elevation: 0,
                              ),
                            ),
                          ),
                        const SizedBox(height: 12),
                        SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: OutlinedButton.icon(
                            onPressed: _deletePurchase,
                            icon: const Icon(Icons.cancel, size: 20),
                            label: const Text(
                              'Cancel Purchase',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            style: OutlinedButton.styleFrom(
                              foregroundColor: const Color(0xFF8B0000),
                              side: const BorderSide(
                                color: Color(0xFF8B0000),
                                width: 2,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
    );
  }

  Widget _buildInfoRow(String label, String value, IconData icon) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 20, color: const Color(0xFF8B0000)),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: const TextStyle(
                    fontSize: 13,
                    color: Colors.black54,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 15,
                    color: Colors.black87,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
