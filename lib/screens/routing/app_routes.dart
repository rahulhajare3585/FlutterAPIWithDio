import 'package:flutter/material.dart';
import 'package:flutter_api_intrgration/Cupertino/action_sheet_example.dart';
import 'package:flutter_api_intrgration/Cupertino/class_scroll_bar_example.dart';
import 'package:flutter_api_intrgration/Cupertino/context_menu.dart';
import 'package:flutter_api_intrgration/Cupertino/cupertino_alert_dialog.dart';
import 'package:flutter_api_intrgration/Cupertino/cupertino_button_example.dart';
import 'package:flutter_api_intrgration/Cupertino/cupertino_form_row_example.dart';
import 'package:flutter_api_intrgration/Cupertino/cupertino_indicator_example.dart';
import 'package:flutter_api_intrgration/Cupertino/cupertino_page_scaffold_example.dart';
import 'package:flutter_api_intrgration/Cupertino/cupertino_picker_example.dart';
import 'package:flutter_api_intrgration/Cupertino/cupertino_radio_example.dart';
import 'package:flutter_api_intrgration/Cupertino/cupertino_slider_example.dart';
import 'package:flutter_api_intrgration/Cupertino/cupertino_switch_example.dart';
import 'package:flutter_api_intrgration/Cupertino/cupertino_tab_bar_example.dart';
import 'package:flutter_api_intrgration/Cupertino/date_picker_example.dart';
import 'package:flutter_api_intrgration/Cupertino/editable_text_toolbar.dart';
import 'package:flutter_api_intrgration/Cupertino/list_section_example.dart';
import 'package:flutter_api_intrgration/Cupertino/refresh_control_example.dart';
import 'package:flutter_api_intrgration/Cupertino/search_text_field_example.dart';
import 'package:flutter_api_intrgration/Cupertino/segamented_control_widget.dart';
import 'package:flutter_api_intrgration/Cupertino/sliver_nav_bar_example.dart';
import 'package:flutter_api_intrgration/Cupertino/timer_picker_example.dart';
import 'package:flutter_api_intrgration/screens/login_screen.dart';
import 'package:flutter_api_intrgration/screens/patient_screen.dart';
import 'package:flutter_api_intrgration/screens/splash_screen.dart';
import 'package:flutter_api_intrgration/screens/surgery/foi_home_screen.dart';
import 'package:flutter_api_intrgration/screens/surgery/landing_screen.dart';

class AppRoutes {
  static Map<String, WidgetBuilder> getRoutes() {
    return {
      '/': (context) => SplashScreen(),
      '/landing_screen': (context) => LandingScreen(),
      '/foi_login_screen': (context) => const LoginScreen(),
      '/cupertino/action_sheet': (context) => const ActionSheetExample(),
      '/cupertino/scrollBar': (context) => const RawScrollbarExample(),
      '/cupertino/context_menu': (context) => const ContextMenuExample(),
      '/cupertino/alertDialog': (context) => const AlertDialogExample(),
      '/cupertino/buttons': (context) => const CupertinoButtonExample(),
      '/cupertino/form_rows': (context) => const CupertinoFormRowExample(),
      '/cupertino/indicator': (context) => const CupertinoIndicatorExample(),
      '/cupertino/page_scaffold': (context) =>
          const CupertinoPageScaffoldExample(),
      '/cupertino/picker': (context) => const CupertinoPickerExample(),
      '/cupertino/radio': (context) => const CupertinoRadioExample(),
      '/cupertino/slider': (context) => const CupertinoSliderExample(),
      '/cupertino/switch': (context) => const CupertinoSwitchExample(),
      '/cupertino/tabbar': (context) => const CupertinoTabBarExample(),
      '/cupertino/date_picker': (context) => const DatePickerExample(),
      '/cupertino/editable_text': (context) => const EditableTextToolbar(),
      '/cupertino/listsection': (context) => const ListSectionBaseExample(),
      '/cupertino/refresh_control': (context) => const RefreshControlExample(),
      '/cupertino/search_text_field': (context) =>
          const SearchTextFieldExample(),
      '/cupertino/segamented_control': (context) =>
          const SegmentedControlExample(),
      '/cupertino/sliver_nav_bar': (context) => const SliverNavBarExample(),
      '/cupertino/timer_picker': (context) => const TimerPickerExample(),
      '/home_screen': (context) => const FoiHomeScreen(),
      '/patient_screen': (context) => const PatientScreen(),
    };
  }
}
