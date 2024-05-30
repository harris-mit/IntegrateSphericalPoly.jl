# utils to deal with a polynomial

using DynamicPolynomials
using SpecialFunctions

"""
    function integrate(p::DynamicPolynomials.Monomial, n)
Computes the integral of a monomial p over the sphere (surface)
in n dimenions
"""
function integrate(p::DynamicPolynomials.Monomial, n)
    i = 2 * prod([gamma(1/2 * (p.z[i] + 1)) for i = 1:lastindex(p.z)])
    i = i / gamma(1/2 * (sum(p.z) + n))
    return i
end
function integrate(p::Number, n) # catches the constant case
    @polyvar _var
    return integrate(_var^0, n)
end
