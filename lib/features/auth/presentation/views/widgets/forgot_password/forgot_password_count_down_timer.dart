import '/features/auth/presentation/manager/forgot_password_cubit/forgot_password_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import '/core/constant/colors.dart';
import '/core/constant/style.dart';
import 'dart:async';

class ForgotPasswordCountdownTimer extends StatefulWidget {
  const ForgotPasswordCountdownTimer({super.key});

  @override
  State<ForgotPasswordCountdownTimer> createState() =>
      _ForgotPasswordCountdownTimerState();
}

class _ForgotPasswordCountdownTimerState
    extends State<ForgotPasswordCountdownTimer> {
  int _start = 180; // 3 minutes = 180 seconds
  Timer? _timer;
  bool _isTimeUp = false;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _isTimeUp = false;
    _timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      if (_start == 0) {
        setState(() {
          _isTimeUp = true;
        });
        timer.cancel();
      } else {
        setState(() {
          _start--;
        });
      }
    });
  }

  void _resetTimer() {
    setState(() {
      _start = 180;
      _isTimeUp = false;
      _startTimer();
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  String get _formattedTime {
    int minutes = _start ~/ 60;
    int seconds = _start % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<ForgotPasswordCubit>();
    return Visibility(
      visible: !_isTimeUp,
      replacement: GestureDetector(
        onTap: () {
          cubit.reSendVerificationCode(
            email: cubit.getEmail.text,
          );
          _resetTimer();
        },
        child: Text(
          'Time is up. Click to resend',
          style: AppStyle.kTextStyle16.copyWith(
            color: AppColors.kPrimaryVariantColor,
            decoration: TextDecoration.underline,
          ),
        ),
      ),
      child: Text(
        _formattedTime,
        style: AppStyle.kTextStyle16.copyWith(
          color: AppColors.kPrimaryVariantColor,
        ),
      ),
    );
  }
}
