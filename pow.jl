function pow(x, y)
    if y == 0
        return 1
    end
    if y == 1
        return x
    end
    if y < 0
        return 1 / pow(x, -y)
    end
    if y % 2 == 0
        x = pow(x, y / 2)
        return x * x
    else
        return x * pow(x, y - 1)
    end
end