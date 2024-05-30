using IntegrateSphericalPoly
using Test
using DynamicPolynomials

@polyvar x[1:10]

@testset "IntegrateSphericalPoly.jl" begin
    n = 2
    @test integrate(x[1]^2 * x[2]^4, n) ≈ 0.39269908169872414
end
