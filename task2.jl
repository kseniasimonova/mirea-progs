using HorizonSideRobots
function mark_innerrectangle_perimetr!(r::Robot)
    num_steps=fill(0,3)
    for (i,side) in enumerate((Sud,West,Sud))
        num_steps[i]=moves!(r,side)
    end
    side = find_border!(r,Ost,side)
    mark_perimetr!(r,side)
    moves!(r,Sud)
    moves!(r,West)
    for (i,side) in enumerate((Nord,Ost,Nord))
        moves!(r,side, num_steps[i])
    end
end