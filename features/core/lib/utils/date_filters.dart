import '../date_formats.dart';

enum DateFilters { all, thisWeek, thisMonth, thisYear }

extension DateFiltersExt on DateFilters {
  String? get convert {
    final now = DateTime.now();

    switch (this) {
      case DateFilters.all:
        return null;
      case DateFilters.thisWeek:
        return dashedDateFormat.format(now.subtract(
          Duration(days: now.weekday - 1),
        ));
      case DateFilters.thisMonth:
        return dashedDateFormat.format(
          DateTime(now.year, now.month, 1),
        );
      case DateFilters.thisYear:
        return dashedDateFormat.format(
          DateTime(now.year, 1, 1),
        );
    }
  }

  String? get convertTitle {
    switch (this) {
      case DateFilters.all:
        return null;
      case DateFilters.thisWeek:
        return 'THISWEEK';
      case DateFilters.thisMonth:
        return 'THISMONTH';
      case DateFilters.thisYear:
        return 'THISYEAR';
    }
  }
}
