function mark_frame_perimetr!(r::Robot)
    num_vert,num_hor = ugol(r)
    for side in (Nord,Ost,Sud,West)
        while isborder(r,side)==false
            putmarkers!(r,side)
        end
    end
    moves!(r, Ost, num_hor)
    moves1!(r, Nord, num_vert)
end
function moves!(r::Robot,side::HorizonSide)
    num_steps=0
    while isborder(r,side)==false
        move!(r,side)
        num_steps+=1
    end
    return num_steps
end
function moves!(r::Robot,side::HorizonSide,num_steps::Int)
    for _ in 1:num_steps 
        move!(r,side)
    end
end
function moves1!(r::Robot,side::HorizonSide,num_steps::Int)
    q=0
    while q<num_steps 
        if isborder(r,Nord)==true
            while isborder(r,side)==true
                move!(r,Ost)
            end
            move!(r,Nord)
            q+=1
            if isborder(r,West)==true
                while isborder(r,West)==true
                    move!(r,Nord)
                    q+=1
                end
            end
            move!(r,West)
        end
        if q<num_steps
        move!(r,side)
        q+=1
        end
    end
end
function putmarkers!(r::Robot, side::HorizonSide)
    while isborder(r,side)==false
        move!(r,side)
        putmarker!(r)
    end
    if isborder(r,side)==true
        putmarker!(r)
    end
end
function ugol(r::Robot)
    num_vert=0
    num_hor=0
    while (isborder(r,Sud)==false || isborder(r,West)==false)
        num_vert+= moves!(r, Sud)
        num_hor+= moves!(r, West)
        repeat
    end
    return num_vert,num_hor
end