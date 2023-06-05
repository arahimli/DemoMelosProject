abstract class SubRoutes {
  /// checked
  static const createPin = 'create-pin';
  static const setBiometrics = 'set-biometrics';
  static const changePin = 'changePin';
  static const create = 'create';
  static const edit = 'edit';
  static const vacancyDetails = 'vacancyDetails';
  static const policyDetails = 'details';
  static const trashTodo = 'trash';
}

abstract class AppRoutes {
  /// checked
  static const splash = '/splash';
  static const onboarding = '/onboarding';
  static const login = '/login';
  static const terms = '/terms';
  static const createPin = '$login/create-pin';
  static const setBiometrics = '$createPin/set-biometrics';
  static const relogin = '/relogin';
  static const home = '/home';
  static const mySpace = '/my-space';
  static const news = '/news';
  static const announcements = '/announcements';
  static const events = '/events';
  static const vacancies = '/vacancies';
  static const outOfOffice = '/out-of-office';
  static const birthdays = '/birthdays';
  static const joinUs = '/joinUs';
  static const settings = '/settings';
  static const changePin = '$settings/changePin';
  static const leaveRequests = '/leave-requests';
  static const createLeaveRequest = '$leaveRequests/create';
  static const editLeaveRequest = '$leaveRequests/edit';
  static const success = '/success';
  static const failure = '/failure';
  static const changePinSuccess = '$success/${SubRoutes.changePin}';
  static const changePinFailure = '$failure/${SubRoutes.changePin}';
  static const more = '/more';
  static const aboutUs = '$more/about-us';
  static const structure = '$more/structure';
  static const salaryCalculation = '/salary-calculation';
  static const directory = '/directory';
  static const discounts = '/discounts';
  static const policies = '/policies';
  static const policyDetails = '$policies/details';
  static const discountDetails = '$discounts/discountDetails';
  static const bio = '$mySpace/bio';
  static const todo = '/to-do';
  static const createTodo = '$todo/create';
  static const editTodo = '$todo/edit';
  static const trashTodo = '$todo/trash';
  static const issues = '/issues';
  static const createIssue = '$issues/create';
  static const shareWith = '/share-with';
  static const issueFilters = '/filters';
  static const threatDetected = '/threatDetected';

  /// unchecked
  static const applyVacancy = '/applyVacancy';
  static const employeeChart = '/employee-chart';
}
