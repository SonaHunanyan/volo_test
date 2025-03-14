class AppStrings {
  static const timesheets = 'Timesheets';
  static const somethingWentWrong = 'Something went wrong';
  static const recent = 'Recent';
  static const oldest = 'Oldest';
  static const sortBy = 'Sort by';
  static const createTimer = 'Create Timer';
  static const project = 'Project';
  static const task = 'Task';
  static const description = 'Description';
  static const makeFavorite = 'Make Favorite';
  static const allFeildsAreRequired = 'All fields are required';
  static const failToGetTimers = 'Fail to get timers';
  static const failToCreateTimer = 'Fail to create timer';
  static const failToUpdateTimer = 'Fail to update timer';

  static timersCount(int count) =>
      count == 1 ? 'You have $count Timer' : 'You have $count Timers';

  static deadline(String date) => 'Deadline $date';
  static const completedRecords = 'Completed Records';
}
