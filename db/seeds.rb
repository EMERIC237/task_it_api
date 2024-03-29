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
# db/seeds.rb

5.times do |i|
  user = User.create!(
    username: "user#{i}",
    email: "user#{i}@example.com",
    password_digest: "password#{i}",
    first_name: "FirstName#{i}",
    last_name: "LastName#{i}"
  )

  task = Task.create!(
    user: user,
    title: "Task#{i}",
    description: "Description of Task#{i}",
    priority: ["High", "Medium", "Low"].sample,
    status: ["New", "In Progress", "Completed"].sample,
    deadline: Time.now + (i+1).days
  )

  daily_plan = DailyPlan.create!(
    user: user,
    date: Date.today + i.days
  )

  DailyPlanTask.create!(
    daily_plan: daily_plan,
    task: task,
    time_slot_start: Time.now + (i*2).hours,
    time_slot_end: Time.now + (i*2 + 1).hours
  )

  review = Review.create!(
    user_id: [nil, user.id].sample, # Reflecting nullable user_id
    date: Time.now + i.days,
    summary: "Summary of review #{i}",
    action_items: "Action items for review #{i}",
    task: task
  )

  TimeEntry.create!(
    task: task,
    start_time: Time.now + (i*10).minutes,
    end_time: Time.now + (i*10 + 30).minutes,
    duration: 30
  )
end

puts 'Seed data created successfully!'
