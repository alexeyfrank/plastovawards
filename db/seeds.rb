# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

admin = User.create!(email: 'admin@admin.com', password: '12345')

# region default settings
  Settings.site_name = 'Master IT'
  Settings.phone = "11 11 11"
  Settings.emergency_call = ""
  Settings.emergency_call_enabled = false
# endregion

# region default menu
  # menu = Menu.create!(name: "Top Menu")

  # menu_items = [
  #   {
  #     name: 'О нас',
  #     slug: 'center'
  #   }
  # ]

# endregion