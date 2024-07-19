class ShippingData {
  final String shippingId;
  final String dateCreated;
  final String trackingId;
  final String destination;
  final String shippingStatus;
  final String approvalStatus;
  final String paymentStatus;

  ShippingData(
      this.shippingId,
      this.dateCreated,
      this.trackingId,
      this.destination,
      this.shippingStatus,
      this.approvalStatus,
      this.paymentStatus);
}
