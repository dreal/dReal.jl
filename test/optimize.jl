using dReal
using Base.Test
# x = Var(Float64,"x",-100.0,100.0)
# f = Var(Float64, "f", -100.0,100.0)
# add!(f == 0 - x * x)
# dReal.optimize(f,x;lb=-100.0,ub=100.0)


## Optimisation Functinos
## ======================
# n = 3

# Ackley's: bounds -5 <= x,y <= 5, min: f(0,0) = 0
ackleys(x::Array) = -20*exp(-0.2*sqrt(0.5(x[1]*x[1] + x[2]*x[2]))) - exp(0.5(cos(2πx[1])+cos(2πx[2]))) + e + 20
# x = Var(Float64,"x",-5.12,5.12)
# y = Var(Float64,"y",-5.12,5.12)
# f = Var(Float64,"f",-10.,10.)
# add!(f == ackleys([x,y]))
# cost, model = minimize(f,x,y; lb=-10.,ub = 10.)
# @test cost


beale(x::Array) =  (1.5 - x[1] + x[1]x[2])^2 +
                (2.25 - x[1] + x[1]x[2]^2)^2 +
                (2.625 - x[1] + x[1]x[2]^3)^2
x = Var(Float64,"x",-5.12,5.12)
y = Var(Float64,"y",-5.12,5.12)
f = Var(Float64,"f",-10.,10.)
add!(f == beale([x,y]))
cost, model = minimize(f,x,y; lb=-10.,ub = 10.)
@show cost, model

# n = 4
function powell(x::Vector)
    return (x[1] + 10.0 * x[2])^2 + 5.0 * (x[3] - x[4])^2 +
            (x[2] - 2.0 * x[3])^4 + 10.0 * (x[1] - x[4])^4
end

#  n = n
rastrigin(x::Array) = 10 * length(x) + sum([xi*xi - 10*cos(2pi*xi) for xi in x])
rosenbrock(x::Array) = sum([100(x[i+1] - x[i]^2)^2 + (x[i]-1)^2 for i=1:length(x)-1])
sphere(x::Array) = sum([xi^2 for xi in x])

# rastrigin
# x = Var(Float64,"x",-5.12,5.12)
# y = Var(Float64,"y",-5.12,5.12)
# f = Var(Float64,"f",-10.,10.)
# println(rastrigin([x,y]))
# add!(f == rastrigin([x,y]))
# @show minimize(f,x,y; lb=-10.,ub = 10.)