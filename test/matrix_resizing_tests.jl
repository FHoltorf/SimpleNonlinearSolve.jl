using SimpleNonlinearSolve

ff(u, p) = u .* u .- p
u0 = rand(2, 2)
p = 2.0
vecprob = NonlinearProblem(ff, vec(u0), p)
prob = NonlinearProblem(ff, u0, p)

for alg in (Klement(), Broyden(), SimpleNewtonRaphson())
    @test vec(solve(prob, alg).u) == solve(vecprob, alg).u
end
