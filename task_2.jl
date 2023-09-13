using HorizonSideRobots
r=Robot("untitled.sit",animate=true)
include("task1_code.jl")

function find_bord!(r::Robot, direction_bord::HorizonSide, direction_move::HorizonSide)
    while !isborder(r,direction_bord)  
        if !isborder(r,direction_move)
            move!(r,direction_move)
        else
            move!(r,direction_bord)
            direction_move=inverse(direction_move)
        end
    end
end

function mark_perimetr!(r::Robot, side::HorizonSideRobots)
    direction_move=(Nord,Ost,Sud, West)
    direction_bord=(Ost,Sud,West,Nord)
    for i in range(1,5)
        putmarkers!(r,  direction_move[i], direction_bord[i]) 

    end
end