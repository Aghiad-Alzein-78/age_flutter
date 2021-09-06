class AgeDuration {
  int years;
  int months;
  int days;

  AgeDuration({this.years = 0, this.months = 0, this.days = 0});

  @override
  String toString() {
    return "Years: ${this.years} , Months: ${this.months} , Days: ${this.days}";
  }
}

class Age {
  static const List<int> _daysInMonth = [
    31,
    28,
    31,
    30,
    31,
    30,
    31,
    31,
    30,
    31,
    30,
    31
  ];

  static bool isLeapYear(int year) {
    return (year % 4 == 0) && ((year % 100 != 0 || year % 400 == 0));
  }

  static int? daysInMonth(int? year, int? month) {
    if (year != null && month != null) {
      if (isLeapYear(year) && month == DateTime.february) {
        return 29;
      } else {
        return _daysInMonth[month - 1];
      }
    } else {
      return null;
    }
  }

  static AgeDuration? dateDifference(
      {required DateTime? fromDate, required DateTime? toDate}) {
    if (startDate != null && endDate != null) {
      int years = 0, months = 0, days = 0;
      if (startDate.day > endDate.day) {
        final monthNumber = (endDate.month - 1) == 0 ? 12 : endDate.month - 1;
        months = -1;
        final monthDays = daysInMonth(endDate.year, monthNumber);
        days = endDate.day + monthDays! - startDate.day;
      } else {
        days = endDate.day - startDate.day;
      }
      if (startDate.month > endDate.month + months) {
        years = -1;
        months += ((12 + endDate.month) - startDate.month);
      } else {
        months += endDate.month - startDate.month;
      }
      years += (endDate.year - startDate.year);
      return AgeDuration(years: years, months: months, days: days);
    } else {
      return null;
    }
  }

  static DateTime? add(
      {required DateTime? date, required AgeDuration? duration}) {
    if (date != null && duration != null) {
      int years =
          date.year + duration.years + ((date.month + duration.months) ~/ 12);
      int months = (date.month + duration.months) % 12;
      int days = date.day + duration.days - 1;
      return DateTime(years, months, 1).add(Duration(days: days));
    } else {
      return null;
    }
  }

  static DateTime? subtract(
      {required DateTime? date, required AgeDuration? duration}) {
    if (date != null && duration != null) {
      duration.days *= -1;
      duration.months *= -1;
      duration.years *= -1;
      return add(date: date, duration: duration);
    } else {
      return null;
    }
  }
}
