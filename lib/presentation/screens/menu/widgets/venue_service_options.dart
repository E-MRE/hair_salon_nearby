part of '../index.dart';

final class _VenueServiceOptions extends StatelessWidget {
  const _VenueServiceOptions({super.key, required this.services});

  final List<String> services;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Sizes.extraExtraPrettyJumbo.value,
      child: ListView.separated(
        itemCount: services.length,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => EmptySpace.bigWidth(),
        itemBuilder: (context, index) {
          return SizedBox(
            width: Sizes.ultraJumbo.value,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ClipRRect(borderRadius: CircularBorderRadius(radius: Sizes.ultraJumbo), child: _buildImage()),
                EmptySpace.prettySmallHeight(),
                AppPadding.horizontalPrettySmall(
                  child: AppText.labelMediumSemiBold(services[index], context: context, align: TextAlign.center),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  CachedNetworkImage _buildImage() {
    return CachedNetworkImage(
      imageUrl: 'http://139.59.144.130:5006/images/venue/hairdresser.png',
      height: Sizes.ultraJumbo.value,
      width: Sizes.ultraJumbo.value,
      filterQuality: FilterQuality.medium,
      fit: BoxFit.fill,
    );
  }
}
