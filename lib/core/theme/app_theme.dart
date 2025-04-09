import 'package:flutter/material.dart';
import '../constants/theme_constants.dart';

/// Provides the application theme
class AppTheme {
  /// Get the light theme for the application
  static ThemeData getLightTheme() {
    return ThemeData(
      useMaterial3: true,
      
      // Color scheme
      colorScheme: ColorScheme(
        brightness: Brightness.light,
        primary: ThemeConstants.primaryColor,
        onPrimary: Colors.white,
        primaryContainer: ThemeConstants.primaryContainerColor,
        onPrimaryContainer: ThemeConstants.primaryDarkColor,
        secondary: ThemeConstants.secondaryColor,
        onSecondary: Colors.white,
        secondaryContainer: ThemeConstants.secondaryContainerColor,
        onSecondaryContainer: ThemeConstants.secondaryDarkColor,
        tertiary: ThemeConstants.primaryLightColor,
        onTertiary: Colors.white,
        tertiaryContainer: ThemeConstants.primaryContainerColor,
        onTertiaryContainer: ThemeConstants.primaryDarkColor,
        error: ThemeConstants.errorColor,
        onError: Colors.white,
        errorContainer: ThemeConstants.errorColor.withOpacity(0.1),
        onErrorContainer: ThemeConstants.errorColor,
        background: ThemeConstants.backgroundColor,
        onBackground: ThemeConstants.primaryTextColor,
        surface: ThemeConstants.surfaceColor,
        onSurface: ThemeConstants.primaryTextColor,
        surfaceVariant: ThemeConstants.backgroundColor,
        onSurfaceVariant: ThemeConstants.secondaryTextColor,
        outline: ThemeConstants.tertiaryTextColor,
        outlineVariant: ThemeConstants.tertiaryTextColor.withOpacity(0.5),
        shadow: Colors.black.withOpacity(0.1),
        scrim: Colors.black.withOpacity(0.3),
        inverseSurface: ThemeConstants.primaryTextColor,
        onInverseSurface: ThemeConstants.surfaceColor,
        inversePrimary: ThemeConstants.primaryLightColor,
        surfaceTint: ThemeConstants.primaryColor.withOpacity(0.05),
      ),
      
      // Base font family
      fontFamily: ThemeConstants.primaryFontFamily,
      
      // Text theme
      textTheme: TextTheme(
        // Display styles
        displayLarge: TextStyle(
          fontFamily: ThemeConstants.primaryFontFamily,
          fontSize: ThemeConstants.displayLargeSize,
          fontWeight: FontWeight.normal,
          color: ThemeConstants.primaryTextColor,
        ),
        displayMedium: TextStyle(
          fontFamily: ThemeConstants.primaryFontFamily,
          fontSize: ThemeConstants.displayMediumSize,
          fontWeight: FontWeight.normal,
          color: ThemeConstants.primaryTextColor,
        ),
        displaySmall: TextStyle(
          fontFamily: ThemeConstants.primaryFontFamily,
          fontSize: ThemeConstants.displaySmallSize,
          fontWeight: FontWeight.normal,
          color: ThemeConstants.primaryTextColor,
        ),
        
        // Headline styles
        headlineLarge: TextStyle(
          fontFamily: ThemeConstants.primaryFontFamily,
          fontSize: ThemeConstants.headlineLargeSize,
          fontWeight: FontWeight.bold,
          color: ThemeConstants.primaryTextColor,
        ),
        headlineMedium: TextStyle(
          fontFamily: ThemeConstants.primaryFontFamily,
          fontSize: ThemeConstants.headlineMediumSize,
          fontWeight: FontWeight.bold,
          color: ThemeConstants.primaryTextColor,
        ),
        headlineSmall: TextStyle(
          fontFamily: ThemeConstants.primaryFontFamily,
          fontSize: ThemeConstants.headlineSmallSize,
          fontWeight: FontWeight.bold,
          color: ThemeConstants.primaryTextColor,
        ),
        
        // Title styles
        titleLarge: TextStyle(
          fontFamily: ThemeConstants.primaryFontFamily,
          fontSize: ThemeConstants.titleLargeSize,
          fontWeight: FontWeight.w600,
          color: ThemeConstants.primaryTextColor,
        ),
        titleMedium: TextStyle(
          fontFamily: ThemeConstants.primaryFontFamily,
          fontSize: ThemeConstants.titleMediumSize,
          fontWeight: FontWeight.w600,
          color: ThemeConstants.primaryTextColor,
        ),
        titleSmall: TextStyle(
          fontFamily: ThemeConstants.primaryFontFamily,
          fontSize: ThemeConstants.titleSmallSize,
          fontWeight: FontWeight.w600,
          color: ThemeConstants.primaryTextColor,
        ),
        
        // Body styles - using secondary font for better readability
        bodyLarge: TextStyle(
          fontFamily: ThemeConstants.secondaryFontFamily,
          fontSize: ThemeConstants.bodyLargeSize,
          fontWeight: FontWeight.normal,
          color: ThemeConstants.primaryTextColor,
        ),
        bodyMedium: TextStyle(
          fontFamily: ThemeConstants.secondaryFontFamily,
          fontSize: ThemeConstants.bodyMediumSize,
          fontWeight: FontWeight.normal,
          color: ThemeConstants.primaryTextColor,
        ),
        bodySmall: TextStyle(
          fontFamily: ThemeConstants.secondaryFontFamily,
          fontSize: ThemeConstants.bodySmallSize,
          fontWeight: FontWeight.normal,
          color: ThemeConstants.secondaryTextColor,
        ),
        
        // Label styles
        labelLarge: TextStyle(
          fontFamily: ThemeConstants.primaryFontFamily,
          fontSize: ThemeConstants.labelLargeSize,
          fontWeight: FontWeight.w500,
          color: ThemeConstants.primaryTextColor,
        ),
        labelMedium: TextStyle(
          fontFamily: ThemeConstants.primaryFontFamily,
          fontSize: ThemeConstants.labelMediumSize,
          fontWeight: FontWeight.w500,
          color: ThemeConstants.primaryTextColor,
        ),
        labelSmall: TextStyle(
          fontFamily: ThemeConstants.primaryFontFamily,
          fontSize: ThemeConstants.labelSmallSize,
          fontWeight: FontWeight.w500,
          color: ThemeConstants.secondaryTextColor,
        ),
      ),
      
      // AppBar theme
      appBarTheme: AppBarTheme(
        backgroundColor: ThemeConstants.primaryColor,
        foregroundColor: Colors.white,
        elevation: 0,
        centerTitle: false,
        titleTextStyle: TextStyle(
          fontFamily: ThemeConstants.primaryFontFamily,
          fontSize: ThemeConstants.titleLargeSize,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      
      // Card theme
      cardTheme: CardTheme(
        color: ThemeConstants.surfaceColor,
        elevation: ThemeConstants.elevationMedium,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(ThemeConstants.borderRadiusMedium),
        ),
        margin: const EdgeInsets.all(ThemeConstants.spacingSmall),
      ),
      
      // Elevated button theme
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: ThemeConstants.primaryColor,
          foregroundColor: Colors.white,
          elevation: ThemeConstants.elevationSmall,
          padding: const EdgeInsets.symmetric(
            horizontal: ThemeConstants.spacingLarge,
            vertical: ThemeConstants.spacingMedium,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(ThemeConstants.borderRadiusMedium),
          ),
          textStyle: TextStyle(
            fontFamily: ThemeConstants.primaryFontFamily,
            fontSize: ThemeConstants.labelLargeSize,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      
      // Text button theme
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: ThemeConstants.primaryColor,
          padding: const EdgeInsets.symmetric(
            horizontal: ThemeConstants.spacingMedium,
            vertical: ThemeConstants.spacingSmall,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(ThemeConstants.borderRadiusMedium),
          ),
          textStyle: TextStyle(
            fontFamily: ThemeConstants.primaryFontFamily,
            fontSize: ThemeConstants.labelLargeSize,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      
      // Outlined button theme
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: ThemeConstants.primaryColor,
          side: BorderSide(color: ThemeConstants.primaryColor),
          padding: const EdgeInsets.symmetric(
            horizontal: ThemeConstants.spacingLarge,
            vertical: ThemeConstants.spacingMedium,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(ThemeConstants.borderRadiusMedium),
          ),
          textStyle: TextStyle(
            fontFamily: ThemeConstants.primaryFontFamily,
            fontSize: ThemeConstants.labelLargeSize,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      
      // Input decoration theme
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: ThemeConstants.surfaceColor,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: ThemeConstants.spacingMedium,
          vertical: ThemeConstants.spacingMedium,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(ThemeConstants.borderRadiusMedium),
          borderSide: BorderSide(color: ThemeConstants.tertiaryTextColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(ThemeConstants.borderRadiusMedium),
          borderSide: BorderSide(color: ThemeConstants.tertiaryTextColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(ThemeConstants.borderRadiusMedium),
          borderSide: BorderSide(color: ThemeConstants.primaryColor, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(ThemeConstants.borderRadiusMedium),
          borderSide: BorderSide(color: ThemeConstants.errorColor),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(ThemeConstants.borderRadiusMedium),
          borderSide: BorderSide(color: ThemeConstants.errorColor, width: 2),
        ),
        labelStyle: TextStyle(
          fontFamily: ThemeConstants.secondaryFontFamily,
          fontSize: ThemeConstants.bodyMediumSize,
          color: ThemeConstants.secondaryTextColor,
        ),
        hintStyle: TextStyle(
          fontFamily: ThemeConstants.secondaryFontFamily,
          fontSize: ThemeConstants.bodyMediumSize,
          color: ThemeConstants.tertiaryTextColor,
        ),
        errorStyle: TextStyle(
          fontFamily: ThemeConstants.secondaryFontFamily,
          fontSize: ThemeConstants.bodySmallSize,
          color: ThemeConstants.errorColor,
        ),
      ),
      
      // Checkbox theme
      checkboxTheme: CheckboxThemeData(
        fillColor: MaterialStateProperty.resolveWith<Color>((states) {
          if (states.contains(MaterialState.selected)) {
            return ThemeConstants.primaryColor;
          }
          return Colors.transparent;
        }),
        checkColor: MaterialStateProperty.all(Colors.white),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(ThemeConstants.borderRadiusSmall),
        ),
        side: BorderSide(color: ThemeConstants.tertiaryTextColor),
      ),
      
      // Radio button theme
      radioTheme: RadioThemeData(
        fillColor: MaterialStateProperty.resolveWith<Color>((states) {
          if (states.contains(MaterialState.selected)) {
            return ThemeConstants.primaryColor;
          }
          return ThemeConstants.tertiaryTextColor;
        }),
      ),
      
      // Switch theme
      switchTheme: SwitchThemeData(
        thumbColor: MaterialStateProperty.resolveWith<Color>((states) {
          if (states.contains(MaterialState.selected)) {
            return ThemeConstants.primaryColor;
          }
          return Colors.grey;
        }),
        trackColor: MaterialStateProperty.resolveWith<Color>((states) {
          if (states.contains(MaterialState.selected)) {
            return ThemeConstants.primaryColor.withOpacity(0.5);
          }
          return Colors.grey.withOpacity(0.5);
        }),
      ),
      
      // Slider theme
      sliderTheme: SliderThemeData(
        activeTrackColor: ThemeConstants.primaryColor,
        inactiveTrackColor: ThemeConstants.primaryColor.withOpacity(0.3),
        thumbColor: ThemeConstants.primaryColor,
        overlayColor: ThemeConstants.primaryColor.withOpacity(0.2),
        valueIndicatorColor: ThemeConstants.primaryColor,
        valueIndicatorTextStyle: const TextStyle(color: Colors.white),
      ),
      
      // Progress indicator theme
      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: ThemeConstants.primaryColor,
        circularTrackColor: ThemeConstants.primaryColor.withOpacity(0.2),
        linearTrackColor: ThemeConstants.primaryColor.withOpacity(0.2),
      ),
      
      // Tab bar theme
      tabBarTheme: TabBarTheme(
        labelColor: ThemeConstants.primaryColor,
        unselectedLabelColor: ThemeConstants.secondaryTextColor,
        indicatorColor: ThemeConstants.primaryColor,
        labelStyle: TextStyle(
          fontFamily: ThemeConstants.primaryFontFamily,
          fontSize: ThemeConstants.labelLargeSize,
          fontWeight: FontWeight.w600,
        ),
        unselectedLabelStyle: TextStyle(
          fontFamily: ThemeConstants.primaryFontFamily,
          fontSize: ThemeConstants.labelLargeSize,
          fontWeight: FontWeight.normal,
        ),
      ),
      
      // Divider theme
      dividerTheme: DividerThemeData(
        color: ThemeConstants.tertiaryTextColor.withOpacity(0.2),
        thickness: 1,
        space: ThemeConstants.spacingMedium,
      ),
      
      // Dialog theme
      dialogTheme: DialogTheme(
        backgroundColor: ThemeConstants.surfaceColor,
        elevation: ThemeConstants.elevationLarge,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(ThemeConstants.borderRadiusLarge),
        ),
        titleTextStyle: TextStyle(
          fontFamily: ThemeConstants.primaryFontFamily,
          fontSize: ThemeConstants.titleLargeSize,
          fontWeight: FontWeight.bold,
          color: ThemeConstants.primaryTextColor,
        ),
        contentTextStyle: TextStyle(
          fontFamily: ThemeConstants.secondaryFontFamily,
          fontSize: ThemeConstants.bodyLargeSize,
          color: ThemeConstants.primaryTextColor,
        ),
      ),
      
      // Bottom sheet theme
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: ThemeConstants.surfaceColor,
        elevation: ThemeConstants.elevationLarge,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(ThemeConstants.borderRadiusLarge),
            topRight: Radius.circular(ThemeConstants.borderRadiusLarge),
          ),
        ),
      ),
      
      // Snack bar theme
      snackBarTheme: SnackBarThemeData(
        backgroundColor: ThemeConstants.primaryTextColor,
        contentTextStyle: TextStyle(
          fontFamily: ThemeConstants.secondaryFontFamily,
          fontSize: ThemeConstants.bodyMediumSize,
          color: Colors.white,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(ThemeConstants.borderRadiusMedium),
        ),
        behavior: SnackBarBehavior.floating,
      ),
      
      // Chip theme
      chipTheme: ChipThemeData(
        backgroundColor: ThemeConstants.backgroundColor,
        disabledColor: ThemeConstants.backgroundColor.withOpacity(0.5),
        selectedColor: ThemeConstants.primaryColor,
        secondarySelectedColor: ThemeConstants.secondaryColor,
        padding: const EdgeInsets.symmetric(
          horizontal: ThemeConstants.spacingMedium,
          vertical: ThemeConstants.spacingExtraSmall,
        ),
        labelStyle: TextStyle(
          fontFamily: ThemeConstants.secondaryFontFamily,
          fontSize: ThemeConstants.bodySmallSize,
          color: ThemeConstants.primaryTextColor,
        ),
        secondaryLabelStyle: TextStyle(
          fontFamily: ThemeConstants.secondaryFontFamily,
          fontSize: ThemeConstants.bodySmallSize,
          color: Colors.white,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(ThemeConstants.borderRadiusExtraLarge),
        ),
      ),
      
      // Text selection theme
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: ThemeConstants.primaryColor,
        selectionColor: ThemeConstants.primaryColor.withOpacity(0.3),
        selectionHandleColor: ThemeConstants.primaryColor,
      ),
      
      // Tooltip theme
      tooltipTheme: TooltipThemeData(
        decoration: BoxDecoration(
          color: ThemeConstants.primaryTextColor.withOpacity(0.9),
          borderRadius: BorderRadius.circular(ThemeConstants.borderRadiusMedium),
        ),
        textStyle: TextStyle(
          fontFamily: ThemeConstants.secondaryFontFamily,
          fontSize: ThemeConstants.bodySmallSize,
          color: Colors.white,
        ),
      ),
      
      // Scaffold background color
      scaffoldBackgroundColor: ThemeConstants.backgroundColor,
      
      // Color density
      visualDensity: VisualDensity.adaptivePlatformDensity,
    );
  }
  
  /// Get the dark theme for the application
  static ThemeData getDarkTheme() {
    // For now, we'll just return the light theme
    // In a real app, you would implement a proper dark theme
    return getLightTheme();
  }
}
