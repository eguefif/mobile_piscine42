
enum LogInOut { login, logout }

class AddEntry{
  final Entry entry;

  AddEntry({required this.entry});
}

class Entry {
  final String entry;
  final DateTime date;

  const Entry({required this.entry, required this.date});
}

class AppState {
  final bool logged;
  final List<Entry> entries;

  const AppState({
    this.entries = const [],
    this.logged = false,
  });
}

AppState actionReducer(AppState state, dynamic action) {
  if (action is LogInOut){
    if (LogInOut == LogInOut.login){
      return AppState(entries: List.from(state.entries), logged: true); 
    }
    else {
      return AppState(entries: List.from(state.entries), logged: false); 
    }
  }
  else if (action == AddEntry){
    return AppState(entries: List.from(state.entries)..add(action.entry), logged: state.logged);
  }
  else {
    return state;
  }
}
