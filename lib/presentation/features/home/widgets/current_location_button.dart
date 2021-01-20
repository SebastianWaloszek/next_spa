import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spa_coding_exercise/common/util/extensions/widget_extensions.dart';
import 'package:spa_coding_exercise/presentation/features/user_location/bloc/user_location_bloc.dart';
import 'package:spa_coding_exercise/presentation/theme/app_theme_constants.dart';
import 'package:spa_coding_exercise/presentation/theme/color/app_colors.dart';

class CurrentLocationButton extends StatelessWidget {
  final UserLocationBloc _userLocationBloc;
  final VoidCallback onPressed;

  const CurrentLocationButton(
    this._userLocationBloc, {
    Key key,
    @required this.onPressed,
  })  : assert(_userLocationBloc != null),
        assert(onPressed != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final size =
        MediaQuery.of(context).size.width * AppThemeConstants.scaleFactor;
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        borderRadius: AppThemeConstants.borderRadius,
        color: AppColors.primaryAccent(context),
        boxShadow: cellBoxShadow(context),
        border: Border.all(
          color: AppColors.buttonContent(context),
          width: 2,
        ),
      ),
      child: BlocBuilder<UserLocationBloc, UserLocationState>(
        cubit: _userLocationBloc,
        builder: (context, state) {
          if (state is LoadedUserLocationState) {
            return IconButton(
              onPressed: onPressed,
              iconSize: 28,
              icon: Icon(
                Icons.my_location,
                color: AppColors.buttonContent(context),
              ),
            );
          } else {
            return Padding(
              padding: const EdgeInsets.all(15),
              child: CircularProgressIndicator(
                backgroundColor: AppColors.buttonContent(context),
              ),
            );
          }
        },
      ),
    );
  }
}
