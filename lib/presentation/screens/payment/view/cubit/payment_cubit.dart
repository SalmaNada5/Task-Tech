import 'package:equatable/equatable.dart';
import 'package:task_tech/utils/exports.dart';

part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit() : super(PaymentInitial());

  TextEditingController cardNumberController = TextEditingController();
  TextEditingController cardHolderNameController = TextEditingController();
  TextEditingController cvvController = TextEditingController();
  TextEditingController expirationDateController = TextEditingController();
//? success payment page logic
  TextEditingController reviewController = TextEditingController();
  num? rate;
  void onRatingChanged(double rating) {
    emit(PaymentInitial());
    rate = rating;
    emit(RateChangedState());
  }
}
