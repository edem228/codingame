STDOUT.sync = true # DO NOT REMOVE
# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

@surface_n = gets.to_i # the number of points used to draw the surface of Mars.
@surface_n.times do
    # land_x: X coordinate of a surface point. (0 to 6999)
    # land_y: Y coordinate of a surface point. By linking all the points together in a sequential fashion, you form the surface of Mars.
    land_x, land_y = gets.split(" ").collect {|x| x.to_i}
end

max_thrust = 4
g = 3.711
max_deceleration = max_thrust - g
# game loop
loop do
    # h_speed: the horizontal speed (in m/s), can be negative.
    # v_speed: the vertical speed (in m/s), can be negative.
    # fuel: the quantity of remaining fuel in liters.
    # rotate: the rotation angle in degrees (-90 to 90).
    # power: the thrust power (0 to 4).
    x, y, h_speed, v_speed, fuel, rotate, power = gets.split(" ").collect {|x| x.to_i}
    
    ticks_until_impact = y  / (v_speed + 0.01)
    time_to_decelerate = (v_speed + 30) / max_deceleration # don't know why +30 and not +40 - perhaps because I'm calculating for the current tick rather than the next one.
    
    
    if  time_to_decelerate <= ticks_until_impact
        rotate = 4
    end
    # Write an action using puts
    # To debug: STDERR.puts "Debug messages..."
    
    puts "0 " + rotate.to_s # 2 integers: rotate power. rotate is the desired rotation angle (should be 0 for level 1), power is the desired thrust power (0 to 4).
end