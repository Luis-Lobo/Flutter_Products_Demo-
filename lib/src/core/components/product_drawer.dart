import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_products_demo/src/core/theme/application_colors.dart';
import 'package:flutter_products_demo/src/features/authentication/domain/model/user_model.dart';

class ProductDrawer extends StatelessWidget {
  final UserModel userModel;
  final GestureTapCallback? onLogoutTap;

  const ProductDrawer({
    required this.userModel,
    this.onLogoutTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final textTheme = Theme.of(context).textTheme;
    return Drawer(
      backgroundColor: ApplicationColors.grey700,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                child: ListView(
              shrinkWrap: false,
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              children: [
                ListTile(
                  title: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: ApplicationColors.white,
                        width: 4.0,
                      ),
                    ),
                    child: CircleAvatar(
                      backgroundImage: userModel.photoUrl != null && userModel.photoUrl!.isNotEmpty ? NetworkImage(userModel.photoUrl!) : null,
                      backgroundColor: ApplicationColors.darkBlue,
                      radius: 48,
                      child: const Icon(Icons.person),
                    ),
                  ),
                ),
                ListTile(
                  title: Text(
                    "${l10n.name} ${userModel.name}",
                    style: textTheme.titleMedium?.copyWith(color: ApplicationColors.white),
                  ),
                ),
                ListTile(
                  title: Text(
                    "${l10n.email} ${userModel.email}",
                    style: textTheme.titleMedium?.copyWith(color: ApplicationColors.white),
                  ),
                ),
                const Divider(
                  color: ApplicationColors.white,
                  indent: 16,
                  endIndent: 16,
                ),
                ListTile(
                  leading: const Icon(
                    Icons.keyboard_return,
                    color: ApplicationColors.white,
                    size: 24,
                  ),
                  title: Text(
                    l10n.logout,
                    style: textTheme.titleMedium?.copyWith(
                      color: ApplicationColors.white,
                    ),
                  ),
                  onTap: onLogoutTap,
                ),
              ],
            )),
          ],
        ),
      ),
    );
  }
}
