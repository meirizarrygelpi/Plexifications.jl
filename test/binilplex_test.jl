using Plexifications
using Base.Test: @test, @test_throws

@test_throws ErrorException begin
    inv(BiNilplex(0, 0.0))
end

@test begin
    !iszerodivisor(BiNilplex(1,2,3,4))
end

@test begin
    iszerodivisor(BiNilplex(0,0,3,4))
end

@test begin
    iszerodivisor(BiNilplex(0,3,0,4))
end

@test begin
    a = Plexifications.randomBigFloat()
    isreal(BiNilplex(a))
end

@test begin
    a = 1
    !isreal(BiNilplex(a, a))
end

@test begin
    z = random(BiNilplex{Int})
    z == +(z)
end

@test begin
    a = Plexifications.randomBigFloat()
    real(BiNilplex(a)) == a
end

@test begin
    io = IOBuffer()
    show(io, BiNilplex(1, 2, 3, 4))
    l = String(take!(io))
    r = "[1: 1, A: 2, B: 3, AB: 4]"
    l == r
end

@test begin
    x = random(BiNilplex{BigFloat})
    y = random(BiNilplex{BigFloat})
    x != y
end

@test begin
    a = Plexifications.randomBigInt()
    z = random(BiNilplex{BigInt})
    l = a + z
    r = z + a
    l == r
end

@test begin
    a = Plexifications.randomBigInt()
    z = random(BiNilplex{BigInt})
    l = a - z
    r = -(z - a)
    l == r
end

@test begin
    x = random(BiNilplex{BigInt})
    y = random(BiNilplex{BigInt})
    l = x + y
    r = y + x
    l == r
end

@test begin
    x = random(Nlplex{BigInt})
    y = random(BiNilplex{BigInt})
    l = x + y
    r = y + x
    l == r
end

@test begin
    x = random(BiNilplex{BigInt})
    y = random(BiNilplex{BigInt})
    l = x * y
    r = y * x
    l == r
end

@test begin
    x = random(Nlplex{BigInt})
    y = random(BiNilplex{BigInt})
    l = x * y
    r = y * x
    l == r
end

@test begin
    x = random(BiNilplex{BigInt})
    y = random(BiNilplex{BigInt})
    l = x - y
    r = -(y - x)
    l == r
end

@test begin
    x = random(Nlplex{BigInt})
    y = random(BiNilplex{BigInt})
    l = x - y
    r = -(y - x)
    l == r
end


@test begin
    x = random(BiNilplex{BigInt})
    y = random(BiNilplex{BigInt})
    z = random(BiNilplex{BigInt})
    l = (x + y) + z
    r = x + (y + z)
    l == r
end

@test begin
    x = random(BiNilplex{BigInt})
    y = random(BiNilplex{BigInt})
    z = random(BiNilplex{BigInt})
    l = (x * y) * z
    r = x * (y * z)
    l == r
end

@test begin
    x = random(BiNilplex{BigInt})
    barA(barA(x)) == x
end

@test begin
    x = random(BiNilplex{BigInt})
    barB(barB(x)) == x
end

@test begin
    x = random(BiNilplex{BigInt})
    barB(barA(x)) == barA(barB(x))
end

@test begin
    x = random(BiNilplex{Rational{BigInt}})
    inv(inv(x)) == x
end

@test begin
    x = random(BiNilplex{BigInt})
    y = random(BiNilplex{BigInt})
    l = barA(x * y)
    r = barA(x) * barA(y)
    l == r
end

@test begin
    x = random(BiNilplex{BigInt})
    y = random(BiNilplex{BigInt})
    l = barA(x + y)
    r = barA(x) + barA(y)
    l == r
end

@test begin
    x = random(BiNilplex{BigInt})
    y = random(BiNilplex{BigInt})
    l = barA(x - y)
    r = barA(x) - barA(y)
    l == r
end

@test begin
    x = random(BiNilplex{BigInt})
    y = random(BiNilplex{BigInt})
    l = barB(x * y)
    r = barB(x) * barB(y)
    l == r
end

@test begin
    x = random(BiNilplex{BigInt})
    y = random(BiNilplex{BigInt})
    l = barB(x + y)
    r = barB(x) + barB(y)
    l == r
end

@test begin
    x = random(BiNilplex{BigInt})
    y = random(BiNilplex{BigInt})
    l = barB(x - y)
    r = barB(x) - barB(y)
    l == r
end

@test begin
    x = random(BiNilplex{Rational{BigInt}})
    y = random(BiNilplex{Rational{BigInt}})
    l = inv(x * y)
    r = inv(y) * inv(x)
    l == r
end

@test begin
    x = random(BiNilplex{Rational{BigInt}})
    y = random(BiNilplex{Rational{BigInt}})
    l = inv(x / y)
    r = y / x
    l == r
end

@test begin
    x = random(BiNilplex{Rational{BigInt}})
    y = random(BiNilplex{Rational{BigInt}})
    l = inv(x \ y)
    r = y \ x
    l == r
end

@test begin
    x = random(BiNilplex{BigInt})
    y = random(BiNilplex{BigInt})
    z = random(BiNilplex{BigInt})
    l = x * (y + z)
    r = (x * y) + (x * z)
    l == r
end

@test begin
    a = Plexifications.randomBigInt()
    x = random(BiNilplex{BigInt})
    y = random(BiNilplex{BigInt})
    l = a * (x + y)
    r = (a * x) + (a * y)
    l == r
end

@test begin
    a = Plexifications.randomBigInt()
    x = random(BiNilplex{BigInt})
    l = a * x
    r = x * a
    l == r
end

@test begin
    x = random(BiNilplex{BigInt})
    y = random(BiNilplex{BigInt})
    z = random(BiNilplex{BigInt})
    l = (x + y) * z
    r = (x * z) + (y * z)
    l == r
end

@test begin
    x = random(BiNilplex{BigInt})
    y = random(BiNilplex{BigInt})
    z = random(BiNilplex{BigInt})
    l = x * (y - z)
    r = (x * y) - (x * z)
    l == r
end

@test begin
    x = random(BiNilplex{BigInt})
    y = random(BiNilplex{BigInt})
    z = random(BiNilplex{BigInt})
    l = (x - y) * z
    r = (x * z) - (y * z)
    l == r
end

@test begin
    x = random(BiNilplex{BigInt})
    n = norm(x)
    n > big(0) || n == big(0)
end

@test begin
    x = random(BiNilplex{BigInt})
    y = random(BiNilplex{BigInt})
    l = norm(x * y)
    r = norm(x) * norm(y)
    l == r
end

@test_throws ErrorException begin
    inv(BiNilplex(0, 0.0))
end

@test_throws ErrorException begin
    random(BiNilplex{Int}) / 0
end

@test_throws ErrorException begin
    0 \ random(BiNilplex{Int})
end

@test begin
    a = Plexifications.randomBigRational()
    z = random(BiNilplex{Rational{BigInt}})
    l = z / a
    r = a \ z
    l == r
end

@test begin
    a = Plexifications.randomBigRational()
    z = random(BiNilplex{Rational{BigInt}})
    l = a / z
    r = z \ a
    l == r
end

@test begin
    z = random(BiNilplex{BigInt})
    z == z + zero(BiNilplex{BigInt})
end

@test begin
    z = random(BiNilplex{BigInt})
    z == z * one(BiNilplex{BigInt})
end

@test begin
    z = random(BiNilplex{BigInt})
    z == z + zero(z)
end

@test begin
    z = random(BiNilplex{BigInt})
    z == z * one(z)
end

@test begin
    x = random(BiNilplex{BigInt})
    y = random(BiNilplex{BigInt})
    l = commutator(x, y)
    r = zero(BiNilplex{BigInt})
    l == r
end

@test begin
    x = random(BiNilplex{BigInt})
    y = random(BiNilplex{BigInt})
    l = alternatorL(x, y)
    r = zero(BiNilplex{BigInt})
    l == r
end

@test begin
    x = random(BiNilplex{BigInt})
    y = random(BiNilplex{BigInt})
    l = alternatorR(x, y)
    r = zero(BiNilplex{BigInt})
    l == r
end

@test begin
    x = random(BiNilplex{BigInt})
    y = random(BiNilplex{BigInt})
    l = flexator(x, y)
    r = zero(BiNilplex{BigInt})
    l == r
end

@test begin
    x = random(BiNilplex{BigInt})
    y = random(BiNilplex{BigInt})
    z = random(BiNilplex{BigInt})
    l = associator(x, y, z)
    r = zero(BiNilplex{BigInt})
    l == r
end

@test begin
    x = random(BiNilplex{BigInt})
    y = random(BiNilplex{BigInt})
    z = random(BiNilplex{BigInt})
    l = jacobiator(x, y, z)
    r = 3 * x * y * z
    l == r
end

@test begin
    l = BiNilplex(Nlplex(1,2))
    r = BiNilplex(1,2,0)
    l == r
end

@test begin
    l = BiNilplex(1, 2, 3, 4.0)
    r = BiNilplex(1.0, 2.0, 3.0, 4.0)
    l == r
end
