require_relative "room"

class Hotel
attr_reader  :rooms
  def initialize(name,hash)
    @name= name
    @rooms= {}
    hash.each {|room_name,capacity| @rooms[room_name]= Room.new(capacity)}
    # will's understanding
  end
  def name
    @name.split(" ").map(&:capitalize).join(" ")
  end
  def room_exists?(r_name)
    @rooms.has_key?(r_name)
    
  end
  def check_in(p_name,r_name)
    if !room_exists?(r_name)
        p "sorry, room doesn't exist"
    else 
        if @rooms[r_name].add_occupant(p_name)
            p 'check in successful'
        else
            p 'sorry, room is full'
        end
    end
  end

  def has_vacancy?
    @rooms.any? do |room_name, room_instance|
      !room_instance.full?
    end
  end

  def list_rooms 
    @rooms.each do |room_name, room_instance|
      print "#{room_name}.*#{room_instance.available_space}\n"
    end
  end
end
