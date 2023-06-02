class ErsInvoice {
  String? bookingId;
  String? userId;

  ErsInvoice(
      this.bookingId, 
      this.userId,);

  Map toJson() => {
    'booking_id': bookingId,
    'user_id': userId,
  };


}