/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

/// this TripType is used to identify the trip type,
/// *[gridCircleTile] is used for oneway trip.
/// *[gridCircleTile] is used for scrollable Grid.
/// *[sliderBanner_1dot2] is used for slider banner
enum WidgetType {
  gridCircleTile,
  gridScrollTile,
  gridScrollTileWithBorder,
  sliderBanner_1dot2,
  sliderBanner_2dot2,
  sliderBanner_3dot2,
  sliderBanner_4dot2,
  sliderBanner_1dot2Text,
  sliderBanner_1dot2WithBorder,
  sliderBanner_1dot2Pager,
  image,
  grid,
  slider,
  imageWithText,
  newInElectronics,
  tabsSlider,
  tabsSliderBackground,
  howToShop,
  banner_1,
  flightBanner,
  covidBanner,
  carousel_1dot2,
  pranaamPackage,
  serviceBookingForm,
  porterService,
  departureService,
  howItWorks,
  addOnsService,
  straightHeart,
  videoCard,
  videoView,
  bags,
  ExclusiveProducts,
  pranaamCovidBanner,
  notAvailable,
  storyView,
  adaniMissionBanner,
  moreServices,
  imageTextList,
  experienceAirportWidget,
  exclusivePartnersWidget,
  horizontalProductSlider,
  gridServicesTile,
  helpUsImproveWidget,
  homeTileWidget,
  howItWorkSteps,
  ourAirports,
  pranaamFooterIllustration,
  aboutPranaam,
  savedFlightWidget,
  dutyFreeIllustration,
  faqWidget,
  cabVideoWidget,
  offerBannerWidget,
  selectLocationDestinationWidget,
  cabBenefitWidget,
  videoWithTitleWidget,
  weather,
  //Republic
  rewardBanner,
  exploreServices,
  rewardTerms,
  illustration,
  loyaltyStrip,
}

///this used to handle view of different type.
const kOurAirports = 'ourAirports';
const image = 'image';
const kSliderBanner_1dot2 = 'sliderBanner_1dot2';
const kTabsSlider = 'tabs_slider';
const kTabsSliderBackground = 'tabs_slider_background';
const kSliderBanner_2dot2 = 'sliderBanner_2dot2';
const kSliderBanner_3dot2 = 'sliderBanner_3dot2';
const kSliderBanner_4dot2 = 'sliderBanner_4dot2';
const kSliderBanner_1dot2Text = 'sliderBanner_1dot2Text';
const kSliderBanner_1dot2WithBorder = 'sliderBanner_1dot2WithBorder';
const kSliderBanner_1dot2Pager = 'sliderBanner_1dot2Pager';
const kCarousel = 'carousel_1dot2';
const kImageText = 'image_text';
const kGridCircleTile = 'gridCircleTile';
const kGridScrollTile = 'gridScrollTile';
const kGridScrollTileWithBorder = 'gridScrollTileWithBorder';
const kNewInElectronics = 'newInElectronics';
const kHowToShop = 'howToShop';
const kBanner = 'banner';
const kFlightBanner = 'flightBanner';
const kCovidBanner = 'covidBanner';
const kServiceBookingForm = 'serviceBookingForm';
const kPranaamPackage = 'pranaamPackage';
const kPorterService = 'porterService';
const kDepartureService = 'departureService';
const kHowItWorks = 'howItWorks';
const kAddOnService = 'addOnsService';
const kStraightHeart = 'straightHeart';
const kVideoView = 'videoView';
const kBags = 'bags';
const kExclusiveProducts = 'ExclusiveProducts';
const kGrid = 'grid';
const kImage = 'image';
const kMoreServices = 'moreServices';
const kStoryView = 'storyView';
const kAdaniMissionBanner = 'adaniMissionBanner';
const kImageTextList = 'imageTextList';
const kExperienceAirportWidget = 'experienceAirportWidget';
const kExclusivePartnersWidget = 'exclusivePartnersWidget';
const kHorizontalProductSlider = 'horizontalProductSlider';
const kGridServicesTile = 'gridServicesTile';
const kHelpUsImproveWidget = 'helpUsImproveWidget';
const kHomeTileWidget = 'homeTileWidget';
const kSavedFlightWidget = 'savedFlightWidget';
const kDutyFreeIllustration = 'duty_free_illustration';
const kFaqWidget = 'faqWidget';
const kCabVideoWidget = 'cabVideoWidget';
const kOfferBannerWidget = 'offerBannerWidget';
const kSelectLocationDestinationWidget = 'selectLocationDestinationWidget';
const kCabBenefitWidget = 'cabBenefitWidget';
const kVideoWithTitleWidget = 'videoWithTitleWidget';
const kWeather = 'Weather';
const kRewardBanner = 'rewardBanner';
const kExploreServices = 'exploreServices';
const kRewardTerms = 'rewardTerms';
const kIllustration = 'illustration';
