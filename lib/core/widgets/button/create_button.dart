import 'package:money_manager/core/constants/app_theme.dart';
import 'package:money_manager/core/widgets/button/button_factory.dart';

class CreateButton extends ButtonFactory {
  const CreateButton({
    super.key,
    required super.onPressed,
    required super.label,
    super.backgrounColor = AppTheme.primaryColor,
    super.fullsize,
    super.labelColor,
  });
}
