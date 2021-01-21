abstract class HomePageKeys {
  static const homePageScaffold = 'HOME_PAGE_SCAFFOLD';
  static const loadingIndicator = 'HOME_PAGE_LOADING_INDICATOR';
  static const currentLocationButton = "HOME_PAGE_CURRENT_LOCATION_BUTTON";
  static const spaMap = "HOME_PAGE_SPA_MAP";
  static const placeDetailsModal = "HOME_PAGE_PLACE_DETAILS_MODAL";
  static const nearbyPlacesIndicator = "HOME_PAGE_NEARBY_PLACES_INDICATOR";
  static const userLocationIndicator = "SPA_MAP_USER_LOCATION_INDICATOR";
  static String spaIndicator(int dayIndex) => 'SPA_MAP_SPA_INDICATOR_$dayIndex';
}
