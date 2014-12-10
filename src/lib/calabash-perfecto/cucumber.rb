require 'calabash-perfecto/color_helper'
require 'calabash-perfecto/operations'

World(Calabash::Android::ColorHelper)
World(Calabash::Android::Operations)

AfterConfiguration do
  require 'calabash-perfecto/calabash_steps'
end
