import '/features/auth/presentation/manager/forgot_password_cubit/forgot_password_cubit.dart';
import '/features/auth/presentation/manager/forgot_password_cubit/forgot_password_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import '/core/utils/show_toast.dart';

class ForgotPasswordCheckEmailLinearProgress extends StatelessWidget {
  const ForgotPasswordCheckEmailLinearProgress({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: BlocConsumer<ForgotPasswordCubit, ForgotPasswordState>(
        buildWhen: (previous, current) =>
            current is ReSendVerificationCodeSuccess ||
            current is ReSendVerificationCodeLoading ||
            current is ReSendVerificationCodeFailure,
        listener: (context, state) {
          if (state is ReSendVerificationCodeFailure) {
            ShowToast.show(msg: state.errMessage);
          }
        },
        builder: (context, state) {
          return Visibility(
            visible: state is ReSendVerificationCodeLoading,
            child: const LinearProgressIndicator(),
          );
        },
      ),
    );
  }
}
