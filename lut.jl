using StatsPlots, DataFrames

global Numbers = []
global lut = []
global ys = []
function SearchLut(x, lut)
       y = 1
       for k in 1:53
              while x > lut[k]
                     x -= lut[k]
                     y *= (1/2^k) + 1
              end

              if x == 0
                     break
              end
       end

       if x < minimum(lut)
              y *= (1 + x)
       end

       println(y)

       return y
       # global values
       # global rests
       # global xs
       # global ys
       # global j

       # push!(xs, x)

       # if isempty(copy_lut)
       #        return
       # end

       # result = Inf
       # counter = 1
       # index = 0

       # for item in copy_lut
       #        new_result = x - item[2]
       #        if result > new_result && new_result >= 0.0
       #               result = new_result
       #               index = counter
       #               counter = counter + 1
       #        else
       #               counter = counter + 1
       #               continue
       #        end
       # end

       # if index == 0
       #        return
       # end

       # new_x = result
       # new_y = last(ys) * copy_lut[index][2]

       # push!(ys, new_y)

       # j = j + 1

       # rest = (1 + last(xs)) * last(ys)
       # push!(rests, rest)
       # popat!(copy_lut, index)

       # SearchLut(new_x, copy_lut)
end

function Generator()
       start = 1
       limit = 2

       while start < limit
              start = start + 0.05
              push!(Numbers, start)
       end
end

function GenerateLut()
       for i in 1:53
           push!(lut,log2((1/2^i)+1))
       end
end

Generator()
GenerateLut()

lut

for number in Numbers
       print(".")
       push!(ys, SearchLut(number, lut))
end

df = DataFrame(B=ys)
plot = @df df StatsPlots.plot(:B)
savefig(plot, "lut.png")