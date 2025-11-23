TaskFlow – Simple Task Manager (Flutter Project)
-------------------------------------------------

TaskFlow is a clean and lightweight task management application built using Flutter.
It allows users to create, edit, manage, and track tasks without using any database.
All data is stored temporarily in memory, making the project simple and perfect for
university-level submissions.

-------------------------------------------------
Features
-------------------------------------------------
1. Add New Tasks
   - Title (required)
   - Description (optional)
   - Due date selection
   - Priority selection (Low, Medium, High)

2. Edit Existing Tasks
   - Update all fields of a task
   - Form is pre-filled with old values

3. Task Completion Toggle
   - Mark tasks as completed or incomplete using a checkbox

4. Delete Tasks
   - Remove tasks instantly with a single tap

5. Task Summary
   - Shows: "Completed X of Y tasks" at the top

6. In-Memory Storage
   - No database is used
   - Good for simple academic projects

7. Reminder SnackBar
   - When a task has a due date, a temporary reminder is shown

-------------------------------------------------
Project Structure
-------------------------------------------------
/lib
  ├── main.dart                 -> App entry point
  ├── models/
  │     └── task.dart           -> Task model (title, description, date, priority, completed)
  └── screens/
        ├── task_list_screen.dart -> Main UI screen (list, delete, edit, complete tasks)
        └── add_task_screen.dart  -> Add & edit task form screen

-------------------------------------------------
How It Works
-------------------------------------------------
- The app uses a simple List<Task> to store all tasks in memory.
- Screens communicate using Navigator.push() and Navigator.pop().
- setState() is used to update UI when changes occur.
- No external packages are required (only Flutter material library).

-------------------------------------------------
How To Run
-------------------------------------------------
1. Install Flutter SDK
2. Run: flutter pub get
3. Start the app with: flutter run

-------------------------------------------------
Why This Project?
-------------------------------------------------
TaskFlow was created as a university Flutter project that demonstrates:
- Basic UI design
- Form handling
- Navigation between screens
- State management with setState
- Simple and clean architecture

-------------------------------------------------
Future Improvements (optional)
-------------------------------------------------
- Add local database (Hive or SQLite)
- Dark mode theme
- Notifications for due dates
- Filtering and sorting tasks

-------------------------------------------------
Contributors
-------------------------------------------------
1. AbedAlkader Alhanafi 
2. Ragheed Salika 


