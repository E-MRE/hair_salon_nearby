import 'package:hair_salon_nearby/core/state_managers/bloc/cubit/base_data_cubit.dart';
import 'package:hair_salon_nearby/models/entity/venue_list_model.dart';
import 'package:hair_salon_nearby/models/entity/venue_model.dart';
import 'package:hair_salon_nearby/models/request/venue_list_request_model.dart';
import 'package:hair_salon_nearby/presentation/screens/menu/cubit/menu_state.dart';
import 'package:hair_salon_nearby/repositories/abstracts/venue_repository.dart';
import 'package:hair_salon_nearby/utils/enum/venue_type.dart';

final class MenuCubit extends BaseDataCubit<MenuState> {
  MenuCubit({required this.venueRepository}) : super(MenuState.initial());

  final VenueRepository venueRepository;

  Future<void> getVenues({
    int pageNumber = 1,
    String search = '',
    VenueType venueType = VenueType.man,
    int? cityCountyId,
  }) async {
    final futureApiResponse = venueRepository.getVenues(
      VenueListRequestModel(page: pageNumber, search: search, cityCountyId: cityCountyId, venueType: venueType),
    );

    await sendRequestApiResponse<VenueListModel, VenueModel>(futureApiResponse: futureApiResponse);
  }
}
