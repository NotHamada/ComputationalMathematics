using StatsPlots, DataFrames

global Numbers = []
global Diferences = []

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
        e = floor(log2(number))
        f = (number / (2^e)) - 1

        squareRootE = sqrt(2^e)
        squareRootF = (1 + f / 2) * (1 - (f / (4 + 2 * f)))

        realRoot = squareRootE * squareRootF

        diff = sqrt(number) - realRoot
        push!(Diferences, diff)
    end
end

Generator()
Calculate()

df = DataFrame(B=Diferences)
plot = @df df StatsPlots.plot(:B)
savefig(plot, "sqrt.png")