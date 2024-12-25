import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'gen_l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en')
  ];

  /// No description provided for @connectionTimeout.
  ///
  /// In en, this message translates to:
  /// **'Connection timed out. Please check your internet connection and try again.'**
  String get connectionTimeout;

  /// No description provided for @sendTimeout.
  ///
  /// In en, this message translates to:
  /// **'Sending data timed out. Please try again later.'**
  String get sendTimeout;

  /// No description provided for @receiveTimeout.
  ///
  /// In en, this message translates to:
  /// **'Receiving data timed out. Please check your connection.'**
  String get receiveTimeout;

  /// No description provided for @badCertificate.
  ///
  /// In en, this message translates to:
  /// **'The server\'s certificate is not trusted. Please check your network security.'**
  String get badCertificate;

  /// No description provided for @connectionError.
  ///
  /// In en, this message translates to:
  /// **'Connection failed. Please check your network connection.'**
  String get connectionError;

  /// No description provided for @unknown.
  ///
  /// In en, this message translates to:
  /// **'An unknown error occurred. Please try again'**
  String get unknown;

  /// No description provided for @badRequest.
  ///
  /// In en, this message translates to:
  /// **'Invalid request. Please check the data and try again.'**
  String get badRequest;

  /// No description provided for @unauthorized.
  ///
  /// In en, this message translates to:
  /// **'Unauthorized access. Please log in and try again.'**
  String get unauthorized;

  /// No description provided for @conflict.
  ///
  /// In en, this message translates to:
  /// **'conflict detected. The resource already exists or conflicts with the current state.'**
  String get conflict;

  /// No description provided for @notFount.
  ///
  /// In en, this message translates to:
  /// **'Resource not found. The requested item does not exist'**
  String get notFount;

  /// No description provided for @internalServerError.
  ///
  /// In en, this message translates to:
  /// **'Internal server error. Please try again later'**
  String get internalServerError;

  /// No description provided for @helloWorld.
  ///
  /// In en, this message translates to:
  /// **'hello World'**
  String get helloWorld;

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @enterYourEmail.
  ///
  /// In en, this message translates to:
  /// **'Enter your email'**
  String get enterYourEmail;

  /// No description provided for @enterYourPassword.
  ///
  /// In en, this message translates to:
  /// **'Enter your password'**
  String get enterYourPassword;

  /// No description provided for @notValidEmail.
  ///
  /// In en, this message translates to:
  /// **'This Email is not valid'**
  String get notValidEmail;

  /// No description provided for @rememberMe.
  ///
  /// In en, this message translates to:
  /// **'Remember me'**
  String get rememberMe;

  /// No description provided for @forgetPassword.
  ///
  /// In en, this message translates to:
  /// **'Forget password?'**
  String get forgetPassword;

  /// No description provided for @continueAsGuest.
  ///
  /// In en, this message translates to:
  /// **'Continue as guest'**
  String get continueAsGuest;

  /// No description provided for @dontHaveAccount.
  ///
  /// In en, this message translates to:
  /// **'Don\'t have account? '**
  String get dontHaveAccount;

  /// No description provided for @signUp.
  ///
  /// In en, this message translates to:
  /// **'Sign up'**
  String get signUp;

  /// No description provided for @emailNotValid.
  ///
  /// In en, this message translates to:
  /// **'Email is not valid'**
  String get emailNotValid;

  /// No description provided for @categories.
  ///
  /// In en, this message translates to:
  /// **'Categories'**
  String get categories;

  /// No description provided for @best_Seller.
  ///
  /// In en, this message translates to:
  /// **'Best Seller'**
  String get best_Seller;

  /// No description provided for @occasions.
  ///
  /// In en, this message translates to:
  /// **'Occasions'**
  String get occasions;

  /// No description provided for @search.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get search;

  /// No description provided for @noProducts.
  ///
  /// In en, this message translates to:
  /// **'No products available'**
  String get noProducts;

  /// No description provided for @somethingWentWrong.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong'**
  String get somethingWentWrong;

  /// No description provided for @giftNow.
  ///
  /// In en, this message translates to:
  /// **'Gift Now'**
  String get giftNow;

  /// No description provided for @discoverNew.
  ///
  /// In en, this message translates to:
  /// **'Discover something new'**
  String get discoverNew;

  /// No description provided for @invalidPassword.
  ///
  /// In en, this message translates to:
  /// **'invalid Password'**
  String get invalidPassword;

  /// No description provided for @addToCart.
  ///
  /// In en, this message translates to:
  /// **'Add to cart'**
  String get addToCart;

  /// No description provided for @description.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get description;

  /// No description provided for @allPricesIncludeTax.
  ///
  /// In en, this message translates to:
  /// **'All prices include Tax'**
  String get allPricesIncludeTax;

  /// No description provided for @bouquetInclude.
  ///
  /// In en, this message translates to:
  /// **'Bouquet include'**
  String get bouquetInclude;

  /// No description provided for @egp.
  ///
  /// In en, this message translates to:
  /// **'EGP'**
  String get egp;

  /// No description provided for @statue.
  ///
  /// In en, this message translates to:
  /// **'Statue'**
  String get statue;

  /// No description provided for @viewAll.
  ///
  /// In en, this message translates to:
  /// **'View All'**
  String get viewAll;

  /// No description provided for @bestSeller.
  ///
  /// In en, this message translates to:
  /// **'Best seller'**
  String get bestSeller;

  /// No description provided for @notification.
  ///
  /// In en, this message translates to:
  /// **'Notification'**
  String get notification;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @aboutUs.
  ///
  /// In en, this message translates to:
  /// **'About Us'**
  String get aboutUs;

  /// No description provided for @termsAndConditions.
  ///
  /// In en, this message translates to:
  /// **'Terms & Conditions'**
  String get termsAndConditions;

  /// No description provided for @myOrders.
  ///
  /// In en, this message translates to:
  /// **'My Orders'**
  String get myOrders;

  /// No description provided for @savedAddresses.
  ///
  /// In en, this message translates to:
  /// **'Saved Addresses'**
  String get savedAddresses;

  /// No description provided for @logout.
  ///
  /// In en, this message translates to:
  /// **'Log Out'**
  String get logout;

  /// No description provided for @logOut.
  ///
  /// In en, this message translates to:
  /// **'LOGOUT'**
  String get logOut;

  /// No description provided for @bloomWithOurExquisiteBestSellers.
  ///
  /// In en, this message translates to:
  /// **'Bloom with our exquisite best sellers'**
  String get bloomWithOurExquisiteBestSellers;

  /// No description provided for @english.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get english;

  /// No description provided for @changePassword.
  ///
  /// In en, this message translates to:
  /// **'Change Password'**
  String get changePassword;

  /// No description provided for @success.
  ///
  /// In en, this message translates to:
  /// **'Success'**
  String get success;

  /// No description provided for @profileUpdated.
  ///
  /// In en, this message translates to:
  /// **'Profile updated Successfully'**
  String get profileUpdated;

  /// No description provided for @enterYourFirstName.
  ///
  /// In en, this message translates to:
  /// **'Enter your first name'**
  String get enterYourFirstName;

  /// No description provided for @enterYourLastName.
  ///
  /// In en, this message translates to:
  /// **'Enter your last name'**
  String get enterYourLastName;

  /// No description provided for @enterYourPhone.
  ///
  /// In en, this message translates to:
  /// **'Enter your phone'**
  String get enterYourPhone;

  /// No description provided for @firstName.
  ///
  /// In en, this message translates to:
  /// **'First name'**
  String get firstName;

  /// No description provided for @lastName.
  ///
  /// In en, this message translates to:
  /// **'Last name'**
  String get lastName;

  /// No description provided for @phone.
  ///
  /// In en, this message translates to:
  /// **'Phone'**
  String get phone;

  /// No description provided for @phoneError.
  ///
  /// In en, this message translates to:
  /// **'Phone number must be at least 10 characters'**
  String get phoneError;

  /// No description provided for @occasion.
  ///
  /// In en, this message translates to:
  /// **'Occasion'**
  String get occasion;

  /// No description provided for @confirmLogout.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to logout?'**
  String get confirmLogout;

  /// No description provided for @resetPassword.
  ///
  /// In en, this message translates to:
  /// **'Reset Password'**
  String get resetPassword;

  /// No description provided for @currentPassword.
  ///
  /// In en, this message translates to:
  /// **'Current password'**
  String get currentPassword;

  /// No description provided for @newPassword.
  ///
  /// In en, this message translates to:
  /// **'New password'**
  String get newPassword;

  /// No description provided for @confirmPassword.
  ///
  /// In en, this message translates to:
  /// **'Confirm password'**
  String get confirmPassword;

  /// No description provided for @passwordNotMatch.
  ///
  /// In en, this message translates to:
  /// **'Password not match'**
  String get passwordNotMatch;

  /// No description provided for @passwordChangedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Password changed successfully'**
  String get passwordChangedSuccessfully;

  /// No description provided for @passwordNotChanged.
  ///
  /// In en, this message translates to:
  /// **'Password not changed'**
  String get passwordNotChanged;

  /// No description provided for @passwordChangedFailed.
  ///
  /// In en, this message translates to:
  /// **'Password changed failed'**
  String get passwordChangedFailed;

  /// No description provided for @update.
  ///
  /// In en, this message translates to:
  /// **'Update'**
  String get update;

  /// No description provided for @cartAddedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Cart Added Successfully'**
  String get cartAddedSuccessfully;

  /// No description provided for @error.
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get error;

  /// No description provided for @unauthorizedAccessPleaseLogin.
  ///
  /// In en, this message translates to:
  /// **'Unauthorized access. Please login'**
  String get unauthorizedAccessPleaseLogin;

  /// No description provided for @addressDeleted.
  ///
  /// In en, this message translates to:
  /// **'Address deleted successfully'**
  String get addressDeleted;

  /// No description provided for @noAddressFound.
  ///
  /// In en, this message translates to:
  /// **'No Addresses Found'**
  String get noAddressFound;

  /// No description provided for @addNewAddress.
  ///
  /// In en, this message translates to:
  /// **'Add a new address to get started!'**
  String get addNewAddress;

  /// No description provided for @addAddress.
  ///
  /// In en, this message translates to:
  /// **'Add new address'**
  String get addAddress;

  /// No description provided for @addressAddedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Address added successfully'**
  String get addressAddedSuccessfully;

  /// No description provided for @street.
  ///
  /// In en, this message translates to:
  /// **'Street'**
  String get street;

  /// No description provided for @enterYourStreet.
  ///
  /// In en, this message translates to:
  /// **'Enter your Street'**
  String get enterYourStreet;

  /// No description provided for @city.
  ///
  /// In en, this message translates to:
  /// **'City'**
  String get city;

  /// No description provided for @enterYourCity.
  ///
  /// In en, this message translates to:
  /// **'Enter your City'**
  String get enterYourCity;

  /// No description provided for @aboutUsContent.
  ///
  /// In en, this message translates to:
  /// **'Welcome to Elevate Flower App! We specialize in helping you celebrate lifes most cherished moments with the perfect bouquet. Whether its a birthday, anniversary, wedding, or any special occasion, we believe every event deserves a touch of floral beauty. Our thoughtfully curated flower collections make it easy to express love, joy, and gratitude. With seamless ordering and timely delivery, were here to turn every occasion into a lasting memory.'**
  String get aboutUsContent;

  /// No description provided for @termsAndConditionsContent.
  ///
  /// In en, this message translates to:
  /// **'Welcome to Elevate Flower App! By using our mobile application, you agree to these Terms & Conditions. Please read them carefully before accessing or using our services.\n\n1. Acceptance of Terms\nBy accessing or using the Elevate Flower App application (\"Service\"), you agree to be bound by these Terms. If you do not agree with these Terms, you may not use our Service.\n\n2. User Accounts\nAccount Creation: To access certain features, you may be required to create an account. You must provide accurate and complete information.\nAccount Responsibility: You are responsible for maintaining the confidentiality of your account credentials and for all activities under your account.\nAccount Termination: We reserve the right to terminate accounts that violate these Terms.\n\n3. Orders & Payments\nOrder Acceptance: All orders are subject to acceptance and availability. We reserve the right to cancel or refuse any order at our discretion.\nPricing: Prices listed are in [currency]. We reserve the right to update prices without notice.\nPayment: Payment must be made at the time of order through our supported payment methods.\n\n4. Delivery Policy\nDelivery Areas: We deliver to locations specified in the app. Delivery times may vary depending on location and availability.\nDelayed Delivery: We are not responsible for delays due to circumstances beyond our control (e.g., weather, holidays, technical issues).\n\n5. Refund & Cancellation Policy\nCancellations: Orders may be canceled up to [time frame] before the scheduled delivery.\nRefunds: Refunds are subject to our refund policy, which is detailed in the app.\n\n6. Use of the Service\nYou agree not to misuse the Service, including but not limited to:\nViolating any laws or regulations.\nAttempting to disrupt or hack the Service.\nUsing the Service for unauthorized purposes.\n\n7. Intellectual Property\nAll content in the app, including text, images, logos, and design, is owned by Elevate Flower App or its licensors. You may not copy, modify, or distribute any content without permission.\n\n8. Limitation of Liability\nTo the maximum extent permitted by law, Elevate Flower App is not liable for any direct, indirect, or incidental damages arising from your use of the Service.\n\n9. Changes to Terms\nWe reserve the right to update these Terms at any time. Continued use of the Service after changes constitutes acceptance of the new Terms.'**
  String get termsAndConditionsContent;

  /// No description provided for @chooseLanguage.
  ///
  /// In en, this message translates to:
  /// **'Choose Language '**
  String get chooseLanguage;

  /// No description provided for @arabic.
  ///
  /// In en, this message translates to:
  /// **'Arabic'**
  String get arabic;

  /// No description provided for @pleaseEnterLogin.
  ///
  /// In en, this message translates to:
  /// **'please enter login'**
  String get pleaseEnterLogin;

  /// No description provided for @subTotal.
  ///
  /// In en, this message translates to:
  /// **'Sub Total'**
  String get subTotal;

  /// No description provided for @deliveryFee.
  ///
  /// In en, this message translates to:
  /// **'Delivery Fee'**
  String get deliveryFee;

  /// No description provided for @total.
  ///
  /// In en, this message translates to:
  /// **'Total'**
  String get total;

  /// No description provided for @cart.
  ///
  /// In en, this message translates to:
  /// **'Cart'**
  String get cart;

  /// No description provided for @items.
  ///
  /// In en, this message translates to:
  /// **'items'**
  String get items;

  /// No description provided for @yourCartIsEmpty.
  ///
  /// In en, this message translates to:
  /// **'Your cart is empty'**
  String get yourCartIsEmpty;

  /// No description provided for @addCart.
  ///
  /// In en, this message translates to:
  /// **'Add Cart'**
  String get addCart;

  /// No description provided for @checkout.
  ///
  /// In en, this message translates to:
  /// **'Checkout'**
  String get checkout;

  /// No description provided for @schedule.
  ///
  /// In en, this message translates to:
  /// **'Schedule'**
  String get schedule;

  /// No description provided for @deliveryTime.
  ///
  /// In en, this message translates to:
  /// **'Delivery Time'**
  String get deliveryTime;

  /// No description provided for @instant.
  ///
  /// In en, this message translates to:
  /// **'Instant,'**
  String get instant;

  /// No description provided for @deliveryAddress.
  ///
  /// In en, this message translates to:
  /// **'Delivery address'**
  String get deliveryAddress;

  /// No description provided for @addNew.
  ///
  /// In en, this message translates to:
  /// **'Add new'**
  String get addNew;

  /// No description provided for @paymentMethod.
  ///
  /// In en, this message translates to:
  /// **'Payment method'**
  String get paymentMethod;

  /// No description provided for @cashOnDelivery.
  ///
  /// In en, this message translates to:
  /// **'Cash on delivery'**
  String get cashOnDelivery;

  /// No description provided for @creditCard.
  ///
  /// In en, this message translates to:
  /// **'Credit card'**
  String get creditCard;

  /// No description provided for @payment.
  ///
  /// In en, this message translates to:
  /// **'Payment'**
  String get payment;

  /// No description provided for @arriveBy.
  ///
  /// In en, this message translates to:
  /// **'Arrive by'**
  String get arriveBy;

  /// No description provided for @name.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get name;

  /// No description provided for @phoneNumber.
  ///
  /// In en, this message translates to:
  /// **'Phone number'**
  String get phoneNumber;

  /// No description provided for @enterYourName.
  ///
  /// In en, this message translates to:
  /// **'Enter your name'**
  String get enterYourName;

  /// No description provided for @enterYourPhoneNumber.
  ///
  /// In en, this message translates to:
  /// **'Enter your phone number'**
  String get enterYourPhoneNumber;

  /// No description provided for @placeOrder.
  ///
  /// In en, this message translates to:
  /// **'Place Order'**
  String get placeOrder;

  /// No description provided for @itsGift.
  ///
  /// In en, this message translates to:
  /// **'It\'s a gift'**
  String get itsGift;

  /// No description provided for @failedToLoadAddress.
  ///
  /// In en, this message translates to:
  /// **'Failed to load address'**
  String get failedToLoadAddress;

  /// No description provided for @notifications.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get notifications;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar': return AppLocalizationsAr();
    case 'en': return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
