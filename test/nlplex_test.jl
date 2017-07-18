using Plexifications
using Base.Test: @test, @test_throws

@test_throws ErrorException begin
    inv(Nlplex(0, 2))
end

@test begin
    iszerodivisor(Nlplex(0,1))
end

@test begin
    !iszerodivisor(Nlplex(1,1))
end

@test begin
    length(unreal(1)) == 0
end

@test begin
    a = Plexifications.randomBigFloat()
    isreal(Nlplex(a))
end

@test begin
    a = 1
    !isreal(Nlplex(a, a))
end

@test begin
    z = random(Nlplex{Int})
    z == +(z)
end

@test begin
    a = Plexifications.randomBigFloat()
    real(Nlplex(a)) == a
end

@test begin
    io = IOBuffer()
    show(io, Nlplex(1, 2))
    l = String(take!(io))
    r = "[1: 1, A: 2]"
    l == r
end

@test begin
    x = random(Nlplex{BigFloat})
    y = random(Nlplex{BigFloat})
    x != y
end

@test begin
    a = Plexifications.randomBigInt()
    z = random(Nlplex{BigInt})
    l = a + z
    r = z + a
    l == r
end

@test begin
    a = Plexifications.randomBigInt()
    z = random(Nlplex{BigInt})
    l = a - z
    r = -(z - a)
    l == r
end

@test begin
    x = random(Nlplex{BigInt})
    y = random(Nlplex{BigInt})
    l = x + y
    r = y + x
    l == r
end

@test begin
    x = random(Nlplex{BigInt})
    y = random(Nlplex{BigInt})
    l = x * y
    r = y * x
    l == r
end

@test begin
    x = random(Nlplex{BigInt})
    y = random(Nlplex{BigInt})
    l = x - y
    r = -(y - x)
    l == r
end

@test begin
    x = random(Nlplex{BigInt})
    y = random(Nlplex{BigInt})
    z = random(Nlplex{BigInt})
    l = (x + y) + z
    r = x + (y + z)
    l == r
end

@test begin
    x = random(Nlplex{BigInt})
    y = random(Nlplex{BigInt})
    z = random(Nlplex{BigInt})
    l = (x * y) * z
    r = x * (y * z)
    l == r
end

@test begin
    x = random(Nlplex{BigInt})
    barA(barA(x)) == x
end

@test begin
    x = random(Nlplex{Rational{BigInt}})
    inv(inv(x)) == x
end

@test begin
    x = random(Nlplex{BigInt})
    y = random(Nlplex{BigInt})
    l = barA(x * y)
    r = barA(y) * barA(x)
    l == r
end

@test begin
    x = random(Nlplex{BigInt})
    y = random(Nlplex{BigInt})
    l = barA(x + y)
    r = barA(x) + barA(y)
    l == r
end

@test begin
    x = random(Nlplex{BigInt})
    y = random(Nlplex{BigInt})
    l = barA(x - y)
    r = barA(x) - barA(y)
    l == r
end

@test begin
    x = random(Nlplex{Rational{BigInt}})
    y = random(Nlplex{Rational{BigInt}})
    l = inv(x * y)
    r = inv(y) * inv(x)
    l == r
end

@test begin
    x = random(Nlplex{Rational{BigInt}})
    y = random(Nlplex{Rational{BigInt}})
    l = inv(x / y)
    r = y / x
    l == r
end

@test begin
    x = random(Nlplex{Rational{BigInt}})
    y = random(Nlplex{Rational{BigInt}})
    l = inv(x \ y)
    r = y \ x
    l == r
end

@test begin
    x = random(Nlplex{BigInt})
    y = random(Nlplex{BigInt})
    z = random(Nlplex{BigInt})
    l = x * (y + z)
    r = (x * y) + (x * z)
    l == r
end

@test begin
    a = Plexifications.randomBigInt()
    x = random(Nlplex{BigInt})
    y = random(Nlplex{BigInt})
    l = a * (x + y)
    r = (a * x) + (a * y)
    l == r
end

@test begin
    a = Plexifications.randomBigInt()
    x = random(Nlplex{BigInt})
    l = a * x
    r = x * a
    l == r
end

@test begin
    x = random(Nlplex{BigInt})
    y = random(Nlplex{BigInt})
    z = random(Nlplex{BigInt})
    l = (x + y) * z
    r = (x * z) + (y * z)
    l == r
end

@test begin
    x = random(Nlplex{BigInt})
    y = random(Nlplex{BigInt})
    z = random(Nlplex{BigInt})
    l = x * (y - z)
    r = (x * y) - (x * z)
    l == r
end

@test begin
    x = random(Nlplex{BigInt})
    y = random(Nlplex{BigInt})
    z = random(Nlplex{BigInt})
    l = (x - y) * z
    r = (x * z) - (y * z)
    l == r
end

@test begin
    x = random(Nlplex{BigInt})
    abs2(x) > big(0) || abs2(x) == big(0)
end

@test begin
    x = random(Nlplex{BigInt})
    y = random(Nlplex{BigInt})
    l = abs2(x * y)
    r = abs2(x) * abs2(y)
    l == r
end

@test_throws ErrorException begin
    inv(Nlplex(0, 0.0))
end

@test_throws ErrorException begin
    random(Nlplex{Int}) / 0
end

@test_throws ErrorException begin
    0 \ random(Nlplex{Int})
end

@test begin
    a = Plexifications.randomBigRational()
    z = random(Nlplex{Rational{BigInt}})
    l = z / a
    r = a \ z
    l == r
end

@test begin
    a = Plexifications.randomBigRational()
    z = random(Nlplex{Rational{BigInt}})
    l = a / z
    r = z \ a
    l == r
end

@test begin
    z = random(Nlplex{BigInt})
    z == z + zero(Nlplex{BigInt})
end

@test begin
    z = random(Nlplex{BigInt})
    z == z * one(Nlplex{BigInt})
end

@test begin
    z = random(Nlplex{BigInt})
    z == z + zero(z)
end

@test begin
    z = random(Nlplex{BigInt})
    z == z * one(z)
end
