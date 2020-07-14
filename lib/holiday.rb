require 'pry'

def second_supply_for_fourth_of_july(holiday_hash)
  # given that holiday_hash looks like this:
  # {
  #   :winter => {
  #     :christmas => ["Lights", "Wreath"],
  #     :new_years => ["Party Hats"]
  #   },
  #   :summer => {
  #     :fourth_of_july => ["Fireworks", "BBQ"]
  #   },
  #   :fall => {
  #     :thanksgiving => ["Turkey"]
  #   },
  #   :spring => {
  #     :memorial_day => ["BBQ"]
  #   }
  # }
  holiday_hash[:summer][:fourth_of_july][1]
end

def add_supply_to_winter_holidays(holiday_hash, supply)
  # holiday_hash is identical to the one above
  # add the second argument, which is a supply, to BOTH the
  # Christmas AND the New Year's arrays

  holiday_hash[:winter][:christmas][2] = supply
  holiday_hash[:winter][:new_years][1] = supply
  holiday_hash
end


def add_supply_to_memorial_day(holiday_hash, supply)
  # again, holiday_hash is the same as the ones above
  # add the second argument to the memorial day array
  holiday_hash[:spring][:memorial_day][1] = supply
  holiday_hash
end

def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
  # code here
  # remember to return the updated hash
  # Adds a new holiday and its associated supplies to any season
  holiday_hash[season][holiday_name] = supply_array
  holiday_hash
end

def all_winter_holiday_supplies(holiday_hash)
  # return an array of all of the supplies that are used in the winter season
  new_arr = []
  new_arr << holiday_hash[:winter][:christmas][0]
  new_arr << holiday_hash[:winter][:christmas][1]
  new_arr << holiday_hash[:winter][:new_years][0]   
  new_arr
end

def all_supplies_in_holidays(holiday_hash)
  # iterate through holiday_hash and print items such that your readout resembles:
  # Winter:
  #   Christmas: Lights, Wreath
  #   New Years: Party Hats
  # Summer:
  #   Fourth Of July: Fireworks, BBQ
  # etc.
  new_hash = holiday_hash.each do |season, holiday|
    # Convert season to string and capitalize
    puts "#{season.to_s.capitalize}:"
    # Loop through holidays
    holiday.map do |hol, supply|
      hol = hol.to_s
      # For each holiday, split strings if they are more than two words
      # Capitalize each first letter of each word
      # Join words back together
        if hol.include? ("_")
          new_holiday= hol.split('_')
            final_holiday = new_holiday.map do |day|
              day.capitalize
            end
          final_holiday
          final_holiday = final_holiday.join(" ")
        else
          final_holiday= hol.capitalize!
        end
        final_holiday
      # Loop through supplies
      # Capitalize the first letter of each word
      # Join words back together

      new_supply = supply.each do |item|
        item.capitalize
      end
      new_supply = new_supply.join(", ")
      # Print list of seasons, holidays, and supplies
      puts "  #{final_holiday}: #{new_supply}"
    end
  end
end

def all_holidays_with_bbq(holiday_hash)
  # return an array of holiday names (as symbols) where supply lists
  # include the string BBQ"
  all_holidays = []
  holiday_hash.each do |season, holiday| 
    holiday.each do |day, supply|
      supply.each do |item|
        if item == "BBQ"
          all_holidays << day
        end
      end
  end
  
end
all_holidays
end







