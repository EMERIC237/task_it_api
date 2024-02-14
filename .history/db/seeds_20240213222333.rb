# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# Create sample users
users = User.create([
  { username: 'UserOne', email: 'userone@example.com', password: 'password123' },
  { username: 'UserTwo', email: 'usertwo@example.com', password: 'password123' }
])

# Create tasks for the first user
tasks = Task.create([
  { title: 'Task 1', description: 'Description for Task 1', priority: 'High', status: 'Pending', deadline: '2024-03-01', user_id: users.first.id },
  { title: 'Task 2', description: 'Description for Task 2', priority: 'Medium', status: 'In Progress', deadline: '2024-03-15', user_id: users.first.id }
])

# Create time entries for the first task
time_entries = TimeEntry.create([
  { task_id: tasks.first.id, start_time: '2024-02-15 09:00', end_time: '2024-02-15 11:00', duration: 120 },
  { task_id: tasks.first.id, start_time: '2024-02-16 10:00', end_time: '2024-02-16 12:00', duration: 120 }
])

# Create reviews for the first user
reviews = Review.create([
  { user_id: users.first.id, date: '2024-02-20', summary: 'First review summary', action_items: 'Action item 1, Action item 2' },
  { user_id: users.first.id, date: '2024-02-25', summary: 'Second review summary', action_items: 'Action item 3, Action item 4' }
])

# Create daily plans for the first user
daily_plans = DailyPlan.create([
  { user_id: users.first.id, date: '2024-02-15' },
  { user_id: users.first.id, date: '2024-02-16' }
])

# Associate tasks with daily plans (Optional, if you have implemented DailyPlanTasks)
daily_plan_tasks = DailyPlanTask.create([
  { plan_id: daily_plans.first.id, task_id: tasks.first.id, time_slot_start: '2024-02-15 09:00', time_slot_end: '2024-02-15 11:00' },
  { plan_id: daily_plans.second.id, task_id: tasks.second.id, time_slot_start: '2024-02-16 10:00', time_slot_end: '2024-02-16 12:00' }
])
