using HorizonSideRobots
r=Robot("untitled.sit",animate=true)
function way_to_edge!(r::Robot,Status)
    numsteps_sud=0
    while !isborder(r, Sud)
        move!(r, Sud)
        numsteps_sud+=1
    end
    numsteps_west=0
    while !isborder(r, West)
        move!(r, West)
        numsteps_west+=1
    end
    if !isborder(r,Sud)
        while !isborder(r, Sud)
            move!(r, Sud)
            numsteps_sud+=1
        end
    end
    if Status==true
        for i in 1:numsteps_sud
            move!(r,Nord)
        end
        for n in 1:numsteps_west
            move!(r,Ost)
        end
    end
end

function task6!(r::Robot)
    while !isborder(r,Nord)
        while !isborder(r,Ost)
            move!(r,Ost)
            if isborder(r,Nord)
                mark_perimetr!(r,Ost)
                return 0
            end
        end
        move!(r,Nord)
        while !isborder(r,West)
            move!(r,West)
            if isborder(r,Nord)
                mark_perimetr!(r,West)
                return 0
            end
        end
        move!(r,Nord)
    end
end

function putmarkers!(r::Robot, direction_of_movement::HorizonSide, direction_to_border::HorizonSide)
    while isborder(r,direction_to_border)
        putmarker!(r)
        move!(r,direction_of_movement)
    end
    move!(r,direction_to_border)
end

function mark_perimetr!(r::Robot,Side::HorizonSide)
    if Side == Ost
        direction_of_move=(Ost,Nord,West,Sud)
        border=(Nord,West,Sud,Ost)
    else
        direction_of_move=(West,Nord,Ost,Sud)
        border=(Nord,Ost,Sud,West)
    end
    for i in (1,2,3,4)  
        putmarkers!(r, direction_of_move[i], border[i])
    end
    way_to_edge!(r,true)
end
way_to_edge!(r,false)
task6!(r)