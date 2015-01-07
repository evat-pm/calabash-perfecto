require 'calabash-perfectomobile/color_helper'
require 'calabash-perfectomobile/operations'

World(Calabash::Android::ColorHelper)
World(Calabash::Android::Operations)

AfterConfiguration do
  require 'calabash-perfectomobile/calabash_steps'
end
