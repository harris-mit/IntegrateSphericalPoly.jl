# utils to deal with a polynomial

using DynamicPolynomials
using SpecialFunctions

"""
    function integrate(p::DynamicPolynomials.Monomial, n)
Computes the integral of a monomial p over the sphere (surface)
in n dimenions
"""
function integrate(p::DynamicPolynomials.Monomial, n)
    # evaluates to zero if any exponent is odd
    if any(p.z .% 2 .== 1)
        return 0
    end
    i = 2 * prod([gamma(1/2 * (p.z[i] + 1)) for i = 1:lastindex(p.z)])
    i = i / gamma(1/2 * (sum(p.z) + n))
    return i
end

"""
    function integrate(p::DynamicPolynomials.Polynomial, n) 
Computes the integral of a polynomial p over the sphere (surface)
in n dimenions
"""
function integrate(p::DynamicPolynomials.Polynomial, n)
    return sum([integrate(p.x[i], n) * p.a[i] for i = 1:lastindex(p.x)])
end
