# frozen_string_literal: true

# All object are saved from the born!
class Tamagotchi
  attr_reader :id, :name, :food_level, :sleep_level, :activity_level

  @my_objects = {}
  @last_id = 0

  def self.give_id
    @last_id += 1
  end

  def self.save_it(my_object)
    @my_objects[my_object.id] = my_object
  end

  def self.clear
    @my_objects = {}
    @last_id = 0
  end

  def self.all
    @my_objects.values
  end

  def self.find(id)
    @my_objects[id]
  end

  def initialize(name)
    @name = name

    @id = self.class.give_id

    @food_level = 10
    @sleep_level = 10
    @activity_level = 10

    self.class.save_it self
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

  def to_json(*_args)
    {
      id: id,
      name: name,
      food_level: food_level,
      sleep_level: sleep_level,
      activity_level: activity_level
    }
  end

  def play
    @food_level -= 1
    @sleep_level -= 1
    @activity_level += 1
  end

  def eat
    @food_level += 1
    @sleep_level -= 1
    @activity_level -= 1
  end

  def sleep
    @food_level -= 1
    @sleep_level += 1
    @activity_level -= 1
  end
end
