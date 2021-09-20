class Tamagotchi
  attr_reader :name, :food_level, :sleep_level, :activity_level
  def initialize(name)
    @name = name
    @food_level = 10
    @sleep_level = 10
    @activity_level = 10
  end

  def is_alive
    !@food_level.zero?
  end

  def set_food_level
    @food_level = 0
  end

  def time_passes
    @food_level -= 1
  end
end
