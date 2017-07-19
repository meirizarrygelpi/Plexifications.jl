using Plexifications
using Base.Test: @test, @test_throws

@test_throws ErrorException begin
    inv(TriNilplex(0, 0.0))
end

@test begin
    iszerodivisor(TriNilplex(0,0,1,2))
end

@test begin
    iszerodivisor(TriNilplex(0,2,0,1))
end

@test begin
    !iszerodivisor(TriNilplex(1,2,3,5))
end

@test begin
    a = Plexifications.randomBigFloat()
    isreal(TriNilplex(a))
end

@test begin
    a = 1
    !isreal(TriNilplex(a, a))
end

@test begin
    z = random(TriNilplex{Int})
    z == +(z)
end

@test begin
    a = Plexifications.randomBigFloat()
    real(TriNilplex(a)) == a
end

@test begin
    io = IOBuffer()
    show(io, TriNilplex(1, 2, 3, 4, 5, 6, 7, 8))
    l = String(take!(io))
    r = "[1: 1, A: 2, B: 3, AB: 4, C: 5, AC: 6, BC: 7, ABC: 8]"
    l == r
end

@test begin
    x = random(TriNilplex{BigFloat})
    y = random(TriNilplex{BigFloat})
    x != y
end

@test begin
    a = Plexifications.randomBigInt()
    z = random(TriNilplex{BigInt})
    l = a + z
    r = z + a
    l == r
end

@test begin
    a = Plexifications.randomBigInt()
    z = random(TriNilplex{BigInt})
    l = a - z
    r = -(z - a)
    l == r
end

@test begin
    x = random(TriNilplex{BigInt})
    y = random(TriNilplex{BigInt})
    l = x + y
    r = y + x
    l == r
end

@test begin
    x = random(BiNilplex{BigInt})
    y = random(TriNilplex{BigInt})
    l = x + y
    r = y + x
    l == r
end

@test begin
    x = random(TriNilplex{BigInt})
    y = random(TriNilplex{BigInt})
    l = x * y
    r = y * x
    l == r
end

@test begin
    x = random(BiNilplex{BigInt})
    y = random(TriNilplex{BigInt})
    l = x * y
    r = y * x
    l == r
end

@test begin
    x = random(TriNilplex{BigInt})
    y = random(TriNilplex{BigInt})
    l = x - y
    r = -(y - x)
    l == r
end

@test begin
    x = random(BiNilplex{BigInt})
    y = random(TriNilplex{BigInt})
    l = x - y
    r = -(y - x)
    l == r
end


@test begin
    x = random(TriNilplex{BigInt})
    y = random(TriNilplex{BigInt})
    z = random(TriNilplex{BigInt})
    l = (x + y) + z
    r = x + (y + z)
    l == r
end

@test begin
    x = random(TriNilplex{BigInt})
    y = random(TriNilplex{BigInt})
    z = random(TriNilplex{BigInt})
    l = (x * y) * z
    r = x * (y * z)
    l == r
end

@test begin
    x = random(TriNilplex{BigInt})
    barA(barA(x)) == x
end

@test begin
    x = random(TriNilplex{BigInt})
    barB(barB(x)) == x
end

@test begin
    x = random(TriNilplex{BigInt})
    barC(barC(x)) == x
end

@test begin
    x = random(TriNilplex{BigInt})
    barB(barA(x)) == barA(barB(x))
end

@test begin
    x = random(TriNilplex{BigInt})
    barC(barA(x)) == barA(barC(x))
end

@test begin
    x = random(TriNilplex{BigInt})
    barB(barC(x)) == barC(barB(x))
end

@test begin
    x = random(TriNilplex{Rational{BigInt}})
    inv(inv(x)) == x
end

@test begin
    x = random(TriNilplex{BigInt})
    y = random(TriNilplex{BigInt})
    l = barA(x * y)
    r = barA(x) * barA(y)
    l == r
end

@test begin
    x = random(TriNilplex{BigInt})
    y = random(TriNilplex{BigInt})
    l = barA(x + y)
    r = barA(x) + barA(y)
    l == r
end

@test begin
    x = random(TriNilplex{BigInt})
    y = random(TriNilplex{BigInt})
    l = barA(x - y)
    r = barA(x) - barA(y)
    l == r
end

@test begin
    x = random(TriNilplex{BigInt})
    y = random(TriNilplex{BigInt})
    l = barB(x * y)
    r = barB(x) * barB(y)
    l == r
end

@test begin
    x = random(TriNilplex{BigInt})
    y = random(TriNilplex{BigInt})
    l = barB(x + y)
    r = barB(x) + barB(y)
    l == r
end

@test begin
    x = random(TriNilplex{BigInt})
    y = random(TriNilplex{BigInt})
    l = barB(x - y)
    r = barB(x) - barB(y)
    l == r
end

@test begin
    x = random(TriNilplex{BigInt})
    y = random(TriNilplex{BigInt})
    l = barC(x * y)
    r = barC(x) * barC(y)
    l == r
end

@test begin
    x = random(TriNilplex{BigInt})
    y = random(TriNilplex{BigInt})
    l = barC(x + y)
    r = barC(x) + barC(y)
    l == r
end

@test begin
    x = random(TriNilplex{BigInt})
    y = random(TriNilplex{BigInt})
    l = barC(x - y)
    r = barC(x) - barC(y)
    l == r
end

@test begin
    x = random(TriNilplex{Rational{BigInt}})
    y = random(TriNilplex{Rational{BigInt}})
    l = inv(x * y)
    r = inv(y) * inv(x)
    l == r
end

@test begin
    x = random(TriNilplex{Rational{BigInt}})
    y = random(TriNilplex{Rational{BigInt}})
    l = inv(x / y)
    r = y / x
    l == r
end

@test begin
    x = random(TriNilplex{Rational{BigInt}})
    y = random(TriNilplex{Rational{BigInt}})
    l = inv(x \ y)
    r = y \ x
    l == r
end

@test begin
    x = random(TriNilplex{BigInt})
    y = random(TriNilplex{BigInt})
    z = random(TriNilplex{BigInt})
    l = x * (y + z)
    r = (x * y) + (x * z)
    l == r
end

@test begin
    a = Plexifications.randomBigInt()
    x = random(TriNilplex{BigInt})
    y = random(TriNilplex{BigInt})
    l = a * (x + y)
    r = (a * x) + (a * y)
    l == r
end

@test begin
    a = Plexifications.randomBigInt()
    x = random(TriNilplex{BigInt})
    l = a * x
    r = x * a
    l == r
end

@test begin
    x = random(TriNilplex{BigInt})
    y = random(TriNilplex{BigInt})
    z = random(TriNilplex{BigInt})
    l = (x + y) * z
    r = (x * z) + (y * z)
    l == r
end

@test begin
    x = random(TriNilplex{BigInt})
    y = random(TriNilplex{BigInt})
    z = random(TriNilplex{BigInt})
    l = x * (y - z)
    r = (x * y) - (x * z)
    l == r
end

@test begin
    x = random(TriNilplex{BigInt})
    y = random(TriNilplex{BigInt})
    z = random(TriNilplex{BigInt})
    l = (x - y) * z
    r = (x * z) - (y * z)
    l == r
end

@test begin
    x = random(TriNilplex{BigInt})
    n = norm(x)
    n > big(0) || n == big(0)
end

@test begin
    x = random(TriNilplex{BigInt})
    y = random(TriNilplex{BigInt})
    l = norm(x * y)
    r = norm(x) * norm(y)
    l == r
end

@test_throws ErrorException begin
    inv(TriNilplex(0, 0.0))
end

@test_throws ErrorException begin
    random(TriNilplex{Int}) / 0
end

@test_throws ErrorException begin
    0 \ random(TriNilplex{Int})
end

@test begin
    a = Plexifications.randomBigRational()
    z = random(TriNilplex{Rational{BigInt}})
    l = z / a
    r = a \ z
    l == r
end

@test begin
    a = Plexifications.randomBigRational()
    z = random(TriNilplex{Rational{BigInt}})
    l = a / z
    r = z \ a
    l == r
end

@test begin
    z = random(TriNilplex{BigInt})
    z == z + zero(TriNilplex{BigInt})
end

@test begin
    z = random(TriNilplex{BigInt})
    z == z * one(TriNilplex{BigInt})
end

@test begin
    z = random(TriNilplex{BigInt})
    z == z + zero(z)
end

@test begin
    z = random(TriNilplex{BigInt})
    z == z * one(z)
end

@test begin
    x = random(TriNilplex{BigInt})
    y = random(TriNilplex{BigInt})
    l = commutator(x, y)
    r = zero(TriNilplex{BigInt})
    l == r
end

@test begin
    x = random(TriNilplex{BigInt})
    y = random(TriNilplex{BigInt})
    l = alternatorL(x, y)
    r = zero(TriNilplex{BigInt})
    l == r
end

@test begin
    x = random(TriNilplex{BigInt})
    y = random(TriNilplex{BigInt})
    l = alternatorR(x, y)
    r = zero(TriNilplex{BigInt})
    l == r
end

@test begin
    x = random(TriNilplex{BigInt})
    y = random(TriNilplex{BigInt})
    l = flexator(x, y)
    r = zero(TriNilplex{BigInt})
    l == r
end

@test begin
    x = random(TriNilplex{BigInt})
    y = random(TriNilplex{BigInt})
    z = random(TriNilplex{BigInt})
    l = associator(x, y, z)
    r = zero(TriNilplex{BigInt})
    l == r
end

@test begin
    x = random(TriNilplex{BigInt})
    y = random(TriNilplex{BigInt})
    z = random(TriNilplex{BigInt})
    l = jacobiator(x, y, z)
    r = 3 * x * y * z
    l == r
end

@test begin
    l = TriNilplex(Nlplex(1,2))
    r = TriNilplex(1,2)
    l == r
end

@test begin
    l = TriNilplex(BiNilplex(1,2))
    r = TriNilplex(1,2,0)
    l == r
end

@test begin
    l = TriNilplex(1, 2, 3.0)
    r = TriNilplex(1.0, 2.0, 3.0)
    l == r
end

@test begin
    l = TriNilplex(1, 2, 3, 4.0)
    r = TriNilplex(1.0, 2.0, 3.0, 4.0)
    l == r
end

@test begin
    l = TriNilplex(1, 2, 3, 4, 5.0)
    r = TriNilplex(1.0, 2.0, 3.0, 4.0, 5.0)
    l == r
end

@test begin
    l = TriNilplex(1, 2, 3, 4, 5, 6.0)
    r = TriNilplex(1.0, 2.0, 3.0, 4.0, 5.0, 6.0)
    l == r
end

@test begin
    l = TriNilplex(1, 2, 3, 4, 5, 6, 7.0)
    r = TriNilplex(1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0)
    l == r
end

@test begin
    l = TriNilplex(1, 2, 3, 4, 5, 6, 7, 8.0)
    r = TriNilplex(1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0)
    l == r
end
