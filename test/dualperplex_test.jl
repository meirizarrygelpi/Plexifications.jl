using Plexifications
using Base.Test: @test, @test_throws

@test_throws ErrorException begin
    inv(DualPerplex(0, 0.0))
end

@test begin
    !iszerodivisor(DualPerplex(1,2,3,4))
end

@test begin
    iszerodivisor(DualPerplex(1,1,3,4))
end

@test begin
    a = Plexifications.randomBigFloat()
    isreal(DualPerplex(a))
end

@test begin
    a = 1
    !isreal(DualPerplex(a, a))
end

@test begin
    z = random(DualPerplex{Int})
    z == +(z)
end

@test begin
    a = Plexifications.randomBigFloat()
    real(DualPerplex(a)) == a
end

@test begin
    io = IOBuffer()
    show(io, DualPerplex(1, 2, 3, 4))
    l = String(take!(io))
    r = "[1: 1, R: 2, A: 3, RA: 4]"
    l == r
end

@test begin
    x = random(DualPerplex{BigFloat})
    y = random(DualPerplex{BigFloat})
    x != y
end

@test begin
    a = Plexifications.randomBigInt()
    z = random(DualPerplex{BigInt})
    l = a + z
    r = z + a
    l == r
end

@test begin
    a = Plexifications.randomBigInt()
    z = random(DualPerplex{BigInt})
    l = a - z
    r = -(z - a)
    l == r
end

@test begin
    x = random(DualPerplex{BigInt})
    y = random(DualPerplex{BigInt})
    l = x + y
    r = y + x
    l == r
end

@test begin
    x = random(Prplex{BigInt})
    y = random(DualPerplex{BigInt})
    l = x + y
    r = y + x
    l == r
end

@test begin
    x = random(DualPerplex{BigInt})
    y = random(DualPerplex{BigInt})
    l = x * y
    r = y * x
    l == r
end

@test begin
    x = random(Prplex{BigInt})
    y = random(DualPerplex{BigInt})
    l = x * y
    r = y * x
    l == r
end

@test begin
    x = random(DualPerplex{BigInt})
    y = random(DualPerplex{BigInt})
    l = x - y
    r = -(y - x)
    l == r
end

@test begin
    x = random(Prplex{BigInt})
    y = random(DualPerplex{BigInt})
    l = x - y
    r = -(y - x)
    l == r
end


@test begin
    x = random(DualPerplex{BigInt})
    y = random(DualPerplex{BigInt})
    z = random(DualPerplex{BigInt})
    l = (x + y) + z
    r = x + (y + z)
    l == r
end

@test begin
    x = random(DualPerplex{BigInt})
    y = random(DualPerplex{BigInt})
    z = random(DualPerplex{BigInt})
    l = (x * y) * z
    r = x * (y * z)
    l == r
end

@test begin
    x = random(DualPerplex{BigInt})
    barA(barA(x)) == x
end

@test begin
    x = random(DualPerplex{BigInt})
    barR(barR(x)) == x
end

@test begin
    x = random(DualPerplex{BigInt})
    barR(barA(x)) == barA(barR(x))
end

@test begin
    x = random(DualPerplex{Rational{BigInt}})
    inv(inv(x)) == x
end

@test begin
    x = random(DualPerplex{BigInt})
    y = random(DualPerplex{BigInt})
    l = barA(x * y)
    r = barA(x) * barA(y)
    l == r
end

@test begin
    x = random(DualPerplex{BigInt})
    y = random(DualPerplex{BigInt})
    l = barA(x + y)
    r = barA(x) + barA(y)
    l == r
end

@test begin
    x = random(DualPerplex{BigInt})
    y = random(DualPerplex{BigInt})
    l = barA(x - y)
    r = barA(x) - barA(y)
    l == r
end

@test begin
    x = random(DualPerplex{BigInt})
    y = random(DualPerplex{BigInt})
    l = barR(x * y)
    r = barR(x) * barR(y)
    l == r
end

@test begin
    x = random(DualPerplex{BigInt})
    y = random(DualPerplex{BigInt})
    l = barR(x + y)
    r = barR(x) + barR(y)
    l == r
end

@test begin
    x = random(DualPerplex{BigInt})
    y = random(DualPerplex{BigInt})
    l = barR(x - y)
    r = barR(x) - barR(y)
    l == r
end

@test begin
    x = random(DualPerplex{Rational{BigInt}})
    y = random(DualPerplex{Rational{BigInt}})
    l = inv(x * y)
    r = inv(y) * inv(x)
    l == r
end

@test begin
    x = random(DualPerplex{Rational{BigInt}})
    y = random(DualPerplex{Rational{BigInt}})
    l = inv(x / y)
    r = y / x
    l == r
end

@test begin
    x = random(DualPerplex{Rational{BigInt}})
    y = random(DualPerplex{Rational{BigInt}})
    l = inv(x \ y)
    r = y \ x
    l == r
end

@test begin
    x = random(DualPerplex{BigInt})
    y = random(DualPerplex{BigInt})
    z = random(DualPerplex{BigInt})
    l = x * (y + z)
    r = (x * y) + (x * z)
    l == r
end

@test begin
    a = Plexifications.randomBigInt()
    x = random(DualPerplex{BigInt})
    y = random(DualPerplex{BigInt})
    l = a * (x + y)
    r = (a * x) + (a * y)
    l == r
end

@test begin
    a = Plexifications.randomBigInt()
    x = random(DualPerplex{BigInt})
    l = a * x
    r = x * a
    l == r
end

@test begin
    x = random(DualPerplex{BigInt})
    y = random(DualPerplex{BigInt})
    z = random(DualPerplex{BigInt})
    l = (x + y) * z
    r = (x * z) + (y * z)
    l == r
end

@test begin
    x = random(DualPerplex{BigInt})
    y = random(DualPerplex{BigInt})
    z = random(DualPerplex{BigInt})
    l = x * (y - z)
    r = (x * y) - (x * z)
    l == r
end

@test begin
    x = random(DualPerplex{BigInt})
    y = random(DualPerplex{BigInt})
    z = random(DualPerplex{BigInt})
    l = (x - y) * z
    r = (x * z) - (y * z)
    l == r
end

@test begin
    x = random(DualPerplex{BigInt})
    n = norm(x)
    n > big(0) || n == big(0)
end

@test begin
    x = random(DualPerplex{BigInt})
    y = random(DualPerplex{BigInt})
    l = norm(x * y)
    r = norm(x) * norm(y)
    l == r
end

@test_throws ErrorException begin
    inv(DualPerplex(0, 0.0))
end

@test_throws ErrorException begin
    random(DualPerplex{Int}) / 0
end

@test_throws ErrorException begin
    0 \ random(DualPerplex{Int})
end

@test begin
    a = Plexifications.randomBigRational()
    z = random(DualPerplex{Rational{BigInt}})
    l = z / a
    r = a \ z
    l == r
end

@test begin
    a = Plexifications.randomBigRational()
    z = random(DualPerplex{Rational{BigInt}})
    l = a / z
    r = z \ a
    l == r
end

@test begin
    z = random(DualPerplex{BigInt})
    z == z + zero(DualPerplex{BigInt})
end

@test begin
    z = random(DualPerplex{BigInt})
    z == z * one(DualPerplex{BigInt})
end

@test begin
    z = random(DualPerplex{BigInt})
    z == z + zero(z)
end

@test begin
    z = random(DualPerplex{BigInt})
    z == z * one(z)
end

@test begin
    x = random(DualPerplex{BigInt})
    y = random(DualPerplex{BigInt})
    l = commutator(x, y)
    r = zero(DualPerplex{BigInt})
    l == r
end

@test begin
    x = random(DualPerplex{BigInt})
    y = random(DualPerplex{BigInt})
    l = alternatorL(x, y)
    r = zero(DualPerplex{BigInt})
    l == r
end

@test begin
    x = random(DualPerplex{BigInt})
    y = random(DualPerplex{BigInt})
    l = alternatorR(x, y)
    r = zero(DualPerplex{BigInt})
    l == r
end

@test begin
    x = random(DualPerplex{BigInt})
    y = random(DualPerplex{BigInt})
    l = flexator(x, y)
    r = zero(DualPerplex{BigInt})
    l == r
end

@test begin
    x = random(DualPerplex{BigInt})
    y = random(DualPerplex{BigInt})
    z = random(DualPerplex{BigInt})
    l = associator(x, y, z)
    r = zero(DualPerplex{BigInt})
    l == r
end

@test begin
    x = random(DualPerplex{BigInt})
    y = random(DualPerplex{BigInt})
    z = random(DualPerplex{BigInt})
    l = jacobiator(x, y, z)
    r = 3 * x * y * z
    l == r
end

@test begin
    l = DualPerplex(Prplex(1,2))
    r = DualPerplex(1,2,0)
    l == r
end

@test begin
    l = DualPerplex(1, 2, 3, 4.0)
    r = DualPerplex(1.0, 2.0, 3.0, 4.0)
    l == r
end
