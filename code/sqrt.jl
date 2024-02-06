using StatsPlots, DataFrames

global Numbers = []
global Diferences = []
global Sqrt2 = 1.4142135623730950488016887242097

function K(number)
    if number == 0.0
        return 0.0
    else
        exp = exponent(number) - 1
        return exp
    end
end

function RealLog2(value)
    global Sqrt2

    if value < 0
        return (1 / RealLog2(abs(value)))
    end
    if value == 0
        return 1
    end
    if value == 1
        return Sqrt2
    end
    if value % 2 == 0
        return (2^(value / 2))
    else
        return (Sqrt2 * (2^((value - 1) / 2)))
    end
end

function Generator()
    start = 0
    limit = 10

    while start < limit
        start = start + 0.05
        push!(Numbers, start)
    end
end

function Calculate()
    for number in Numbers
        e = K(number)
        f = (number / (2^float(e))) - 1

        squareRootE = RealLog2(e)
        squareRootF = 1 + (f / 2) * (1 - (f / (4 + (2 * f))))

        realRoot = squareRootE * squareRootF

        diff = abs(sqrt(number) - realRoot)
        push!(Diferences, diff)
    end
end

Generator()
Calculate()

df = DataFrame(B=Diferences)
plot = @df df StatsPlots.plot(:B,title="Real square root x Machine square root", label=["machine sqrt - real sqrt"])

savefig(plot, "Sqrt.png")