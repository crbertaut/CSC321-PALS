# https://github.com/ankane/groupdate#for-sqlite
if Rails.env.development?
  Groupdate.time_zone = false
end