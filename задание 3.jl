function getHorLen(r::Robot)
    cnt = 0
    while isborder(r, Ost) == false
        cnt += 1
        move!(r, Ost)
    end
    while isborder(r, West) == false
        move!(r, West)
    end
    return cnt
end

function setLeftDown!(r::Robot)
    x, y = 0, 0
    while isborder(r, Sud) == false
        move!(r, Sud)
        y += 1
    end
    while isborder(r, West) == false
        move!(r, West)
        x += 1
    end
    return x, y
end

function backToWest!(r::Robot)
    while isborder(r, West) == false
        move!(r, West)
    end
end

function markOstUntil!(r::Robot, n)
    while n > 0
        putmarker!(r)
        move!(r, Ost)
        n -= 1
    end
    putmarker!(r)
end

function main4!(r::Robot)
    x, y = setLeftDown!(r)
    n = getHorLen(r)
    
    while isborder(r, Nord) == false
        markOstUntil!(r, n)
        move!(r, Nord)
        n -= 1
        backToWest!(r)
    end

    markOstUntil!(r, n)

    setLeftDown!(r)

    while x > 0
        move!(r, Ost)
        x -= 1
    end

    while y > 0
        move!(r, Nord)
        y -= 1
    end
end