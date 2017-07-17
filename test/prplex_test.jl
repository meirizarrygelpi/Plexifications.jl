using Plexifications
using Base.Test: @test, @test_throws

@test begin
    length(unreal(1)) == 0
end

@test begin
    a = Plexifications.randomBigFloat()
    isreal(Prplex(a))
end

@test begin
    a = 1
    !isreal(Prplex(a, a))
end

@test begin
    z = random(Prplex{Int})
    z == +(z)
end

@test begin
    a = Plexifications.randomBigFloat()
    real(Prplex(a)) == a
end

@test begin
    io = IOBuffer()
    show(io, Prplex(1, 2))
    l = String(take!(io))
    r = "[1: 1, s: 2]"
    l == r
end

@test begin
    x = random(Prplex{BigFloat})
    y = random(Prplex{BigFloat})
    x != y
end

@test begin
    a = Plexifications.randomBigInt()
    z = random(Prplex{BigInt})
    l = a + z
    r = z + a
    l == r
end

@test begin
    a = Plexifications.randomBigInt()
    z = random(Prplex{BigInt})
    l = a - z
    r = -(z - a)
    l == r
end

@test begin
    x = random(Prplex{BigInt})
    y = random(Prplex{BigInt})
    l = x + y
    r = y + x
    l == r
end

@test begin
    x = random(Prplex{BigInt})
    y = random(Prplex{BigInt})
    l = x * y
    r = y * x
    l == r
end

@test begin
    x = random(Prplex{BigInt})
    y = random(Prplex{BigInt})
    l = x - y
    r = -(y - x)
    l == r
end

@test begin
    x = random(Prplex{BigInt})
    y = random(Prplex{BigInt})
    z = random(Prplex{BigInt})
    l = (x + y) + z
    r = x + (y + z)
    l == r
end

@test begin
    x = random(Prplex{BigInt})
    y = random(Prplex{BigInt})
    z = random(Prplex{BigInt})
    l = (x * y) * z
    r = x * (y * z)
    l == r
end

@test begin
    x = random(Prplex{BigInt})
    bars(bars(x)) == x
end

@test begin
    x = random(Prplex{Rational{BigInt}})
    inv(inv(x)) == x
end

@test begin
    x = random(Prplex{BigInt})
    y = random(Prplex{BigInt})
    l = bars(x * y)
    r = bars(y) * bars(x)
    l == r
end

@test begin
    x = random(Prplex{BigInt})
    y = random(Prplex{BigInt})
    l = bars(x + y)
    r = bars(x) + bars(y)
    l == r
end

@test begin
    x = random(Prplex{BigInt})
    y = random(Prplex{BigInt})
    l = bars(x - y)
    r = bars(x) - bars(y)
    l == r
end

@test begin
    x = random(Prplex{Rational{BigInt}})
    y = random(Prplex{Rational{BigInt}})
    l = inv(x * y)
    r = inv(y) * inv(x)
    l == r
end

@test begin
    x = random(Prplex{Rational{BigInt}})
    y = random(Prplex{Rational{BigInt}})
    l = inv(x / y)
    r = y / x
    l == r
end

@test begin
    x = random(Prplex{Rational{BigInt}})
    y = random(Prplex{Rational{BigInt}})
    l = inv(x \ y)
    r = y \ x
    l == r
end

@test begin
    x = random(Prplex{BigInt})
    y = random(Prplex{BigInt})
    z = random(Prplex{BigInt})
    l = x * (y + z)
    r = (x * y) + (x * z)
    l == r
end

@test begin
    a = Plexifications.randomBigInt()
    x = random(Prplex{BigInt})
    y = random(Prplex{BigInt})
    l = a * (x + y)
    r = (a * x) + (a * y)
    l == r
end

@test begin
    a = Plexifications.randomBigInt()
    x = random(Prplex{BigInt})
    l = a * x
    r = x * a
    l == r
end

@test begin
    x = random(Prplex{BigInt})
    y = random(Prplex{BigInt})
    z = random(Prplex{BigInt})
    l = (x + y) * z
    r = (x * z) + (y * z)
    l == r
end

@test begin
    x = random(Prplex{BigInt})
    y = random(Prplex{BigInt})
    z = random(Prplex{BigInt})
    l = x * (y - z)
    r = (x * y) - (x * z)
    l == r
end

@test begin
    x = random(Prplex{BigInt})
    y = random(Prplex{BigInt})
    z = random(Prplex{BigInt})
    l = (x - y) * z
    r = (x * z) - (y * z)
    l == r
end

@test begin
    x = random(Prplex{BigInt})
    abs2(x) > big(0) || abs2(x) < big(0) || abs2(x) == big(0)
end

@test begin
    x = random(Prplex{BigInt})
    y = random(Prplex{BigInt})
    l = abs2(x * y)
    r = abs2(x) * abs2(y)
    l == r
end

@test_throws ErrorException begin
    inv(Prplex(0, 0.0))
end

@test_throws ErrorException begin
    random(Prplex{Int}) / 0
end

@test_throws ErrorException begin
    0 \ random(Prplex{Int})
end

@test begin
    a = Plexifications.randomBigRational()
    z = random(Prplex{Rational{BigInt}})
    l = z / a
    r = a \ z
    l == r
end

@test begin
    a = Plexifications.randomBigRational()
    z = random(Prplex{Rational{BigInt}})
    l = a / z
    r = z \ a
    l == r
end

@test begin
    z = random(Prplex{BigInt})
    z == z + zero(Prplex{BigInt})
end

@test begin
    z = random(Prplex{BigInt})
    z == z * one(Prplex{BigInt})
end

@test begin
    z = random(Prplex{BigInt})
    z == z + zero(z)
end

@test begin
    z = random(Prplex{BigInt})
    z == z * one(z)
end
