class AgeDuration {
  int years;
  int months;
  int days;

  AgeDuration({this.years = 0, this.months = 0, this.days = 0});

  @override
  String toString() {
    return "years:${this.years} months:${this.months} days:${this.days}";
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
}
