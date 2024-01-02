part of 'venue_card.dart';

final class _VenueLikeButton extends StatelessWidget {
  const _VenueLikeButton({super.key, required this.isSaved});

  final bool isSaved;

  @override
  Widget build(BuildContext context) {
    return AppPadding.allPrettySmall(
      child: SizedBox(
        height: Sizes.veryBig.value + Sizes.ultraSmall.value,
        width: Sizes.veryBig.value + Sizes.ultraSmall.value,
        child: LikeButton(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          isLiked: isSaved,
          likeBuilder: (isLiked) {
            return Container(
              padding: AppEdgeInsets.all(Sizes.extraSmall),
              decoration: _buildDecoration(isLiked, context),
              child: AssetsConstants.instance.getSvgImages.icBookmark.svg(
                height: Sizes.smallerThanBig.value,
                width: Sizes.smallerThanBig.value,
                colorFilter: ColorFilter.mode(
                  isLiked ? context.colorScheme.background : context.colorScheme.secondary,
                  BlendMode.srcIn,
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  AppBoxDecoration _buildDecoration(bool isLiked, BuildContext context) {
    return AppBoxDecoration.circularContainer(
      borderColor: Colors.transparent,
      backgroundColor: isLiked ? context.colorScheme.secondary : context.colorScheme.background,
      size: Sizes.verySmallerThanJumbo,
    );
  }
}
