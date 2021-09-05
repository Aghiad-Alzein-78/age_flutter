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

  static AgeDuration dateDifference(
      {required DateTime startDate, required DateTime endDate}) {
    int years = 0, months = 0, days = 0;
    if (startDate.day > endDate.day) {
      final monthNumber = (endDate.month - 1) == 0 ? 12 : endDate.month - 1;
      months = -1;
      final monthDays = daysInMonth(endDate.year, monthNumber);
      days = endDate.day + monthDays! - startDate.day;
    } else {
      days = endDate.day - startDate.day;
    }
    if (startDate.month > endDate.month) {
      years = -1;
      months += ((12 + endDate.month) - startDate.month);
    } else {
      months = endDate.month - startDate.month;
    }
    years += (endDate.year - startDate.year);
    return AgeDuration(years: years, months: months, days: days);
  }
}

void main() {
  print(Age.dateDifference(
      startDate: DateTime(1978, 01, 15), endDate: DateTime.now()));
}
