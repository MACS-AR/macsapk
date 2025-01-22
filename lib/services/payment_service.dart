import 'package:stripe_payment/stripe_payment.dart';

class PaymentService {
  PaymentService() {
    StripePayment.setOptions(StripeOptions(
      publishableKey: "YOUR_STRIPE_PUBLISHABLE_KEY",
      merchantId: "YOUR_MERCHANT_ID",
      androidPayMode: 'test',
    ));
  }

  Future<void> makePayment(double amount) async {
    final paymentMethod = await StripePayment.paymentRequestWithCardForm(
      CardFormPaymentRequest(),
    );
    print("Payment method: ${paymentMethod.id}");
  }
}
