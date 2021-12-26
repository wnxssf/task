function main5!(r::Robot)
    path = leftDown(r)
    
    putmarker!(r)
    moveSide!(r, Nord)
    putmarker!(r)
    moveSide!(r, Ost)
    putmarker!(r)
    moveSide!(r, Sud)
    putmarker!(r)
    moveSide!(r, West)

    leftDown!(r, path) 
end

function leftDown(r::Robot)
    path = []
    while isborder(r, West) == false || isborder(r, Sud) == false
          if isborder(r, West) == false
                move!(r, West)
                push!(path, true)
          else
                move!(r, Sud)
                push!(path, false)
          end
    end
    
    return reverse!(path)
end


function leftDown!(r::Robot, path)
    for i in path
          if i move!(r, Ost)
          else move!(r, Nord)
          end
    end
end


function moveSide!(r::Robot, side::HorizonSide)
    while isborder(r, side) == false
          move!(r, side)
    end
end