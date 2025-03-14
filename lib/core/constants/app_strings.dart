class AppStrings {
  static const timesheets = 'Timesheets';
  static const somethingWentWrong = 'Something went wrong';
  static const recent = 'Recent';
  static const oldest = 'Oldest';
  static const sortBy = 'Sort by';

  static timersCount(int count) =>
      count == 1 ? 'You have $count Timer' : 'You have $count Timers';

  static deadline(String date) => 'Deadline $date';
}
