require "date"

class EventList
  attr_accessor :elist
  
  class Event
    attr_accessor :date, :startTime, :endTime, :description, :conflict, :evt_conflicts

    def initialize
      @conflict = false
      @evt_conflicts = []
    end
  end

  def initialize
    @elist = []
  end

  def add_event
    event = Event.new
    
    print "Enter month of event: "
    month = gets.chomp.to_i
    print "Enter day of event:  "
    day = gets.chomp.to_i
    print "Enter year of event:  "
    year = gets.chomp.to_i
    print "Enter start time (0000-2359):  "
    startTime = gets.chomp.to_i
    print "Enter end time (0000-2359):  "
    endTime = gets.chomp.to_i
    print "Give your event a description:  "
    description = gets.chomp

    begin
      event.date = Date.new(year, month, day)
      event.startTime = startTime
      event.endTime = endTime

      if (endTime <= startTime)
        puts "Invalid times. Event not added"
        return
      end
    rescue ArgumentError
      puts "Date is invalid. Event not added"
      return
    end

    @elist.each do |evt|
      if event.startTime >= evt.startTime && event.startTime < evt.endTime
        event.conflict = true
        event.evt_conflicts << evt
      elsif event.endTime > evt.startTime && event.endTime <= evt.endTime
        event.conflict = true
        event.evt_conflicts << evt
      end
    end
    
    @elist << event
  end

  def list_events
    @elist.each do |event|
      puts "#{event.description}: #{event.date.month} #{event.date.day}, #{event.date.year} #{event.startTime} - #{event.endTime}"
      if event.conflict == true
        puts "Conflicts with: "
        event.evt_conflicts.each do |conf|
          puts "#{conf.description}: #{conf.date.month} #{conf.date.day}, #{conf.date.year} #{conf.startTime} - #{conf.endTime}"
        end
      end
    end
  end
end

$done = false
$eventList = EventList.new
$choice = 0

until $done
  puts "Event Calendar Options:"
  puts "1. Add Event"
  puts "2. Display Events"
  puts "3. Quit"
  print "\n"
  print "Enter choice: "

  $choice = gets.chomp.to_i
  if $choice == 1
    $eventList.add_event
  elsif $choice == 2
    $eventList.list_events
  elsif $choice == 3
    $done = true
  else
    puts "Invalid input"
  end

  print "\n"
end
