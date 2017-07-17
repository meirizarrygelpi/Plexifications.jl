using Plexifications
using Base.Test: @test, @test_throws

@test begin
    length(unreal(1)) == 0
end

@test begin
    a = Plexifications.randomBigFloat()
    isreal(Cmplex(a))
end

@test begin
    a = 1
    !isreal(Cmplex(a, a))
end

@test begin
    z = random(Cmplex{Int})
    z == +(z)
end

@test begin
    a = Plexifications.randomBigFloat()
    real(Cmplex(a)) == a
end

@test begin
    io = IOBuffer()
    show(io, Cmplex(1, 2))
    l = String(take!(io))
    r = "[1: 1, H: 2]"
    l == r
end

@test begin
    x = random(Cmplex{BigFloat})
    y = random(Cmplex{BigFloat})
    x != y
end

@test begin
    a = Plexifications.randomBigInt()
    z = random(Cmplex{BigInt})
    l = a + z
    r = z + a
    l == r
end

@test begin
    a = Plexifications.randomBigInt()
    z = random(Cmplex{BigInt})
    l = a - z
    r = -(z - a)
    l == r
end

@test begin
    x = random(Cmplex{BigInt})
    y = random(Cmplex{BigInt})
    l = x + y
    r = y + x
    l == r
end

@test begin
    x = random(Cmplex{BigInt})
    y = random(Cmplex{BigInt})
    l = x * y
    r = y * x
    l == r
end

@test begin
    x = random(Cmplex{BigInt})
    y = random(Cmplex{BigInt})
    l = x - y
    r = -(y - x)
    l == r
end

@test begin
    x = random(Cmplex{BigInt})
    y = random(Cmplex{BigInt})
    z = random(Cmplex{BigInt})
    l = (x + y) + z
    r = x + (y + z)
    l == r
end

@test begin
    x = random(Cmplex{BigInt})
    y = random(Cmplex{BigInt})
    z = random(Cmplex{BigInt})
    l = (x * y) * z
    r = x * (y * z)
    l == r
end

@test begin
    x = random(Cmplex{BigInt})
    barH(barH(x)) == x
end

@test begin
    x = random(Cmplex{Rational{BigInt}})
    inv(inv(x)) == x
end

@test begin
    x = random(Cmplex{BigInt})
    y = random(Cmplex{BigInt})
    l = barH(x * y)
    r = barH(y) * barH(x)
    l == r
end

@test begin
    x = random(Cmplex{BigInt})
    y = random(Cmplex{BigInt})
    l = barH(x + y)
    r = barH(x) + barH(y)
    l == r
end

@test begin
    x = random(Cmplex{BigInt})
    y = random(Cmplex{BigInt})
    l = barH(x - y)
    r = barH(x) - barH(y)
    l == r
end

@test begin
    x = random(Cmplex{Rational{BigInt}})
    y = random(Cmplex{Rational{BigInt}})
    l = inv(x * y)
    r = inv(y) * inv(x)
    l == r
end

@test begin
    x = random(Cmplex{Rational{BigInt}})
    y = random(Cmplex{Rational{BigInt}})
    l = inv(x / y)
    r = y / x
    l == r
end

@test begin
    x = random(Cmplex{Rational{BigInt}})
    y = random(Cmplex{Rational{BigInt}})
    l = inv(x \ y)
    r = y \ x
    l == r
end

@test begin
    x = random(Cmplex{BigInt})
    y = random(Cmplex{BigInt})
    z = random(Cmplex{BigInt})
    l = x * (y + z)
    r = (x * y) + (x * z)
    l == r
end

@test begin
    a = Plexifications.randomBigInt()
    x = random(Cmplex{BigInt})
    y = random(Cmplex{BigInt})
    l = a * (x + y)
    r = (a * x) + (a * y)
    l == r
end

@test begin
    a = Plexifications.randomBigInt()
    x = random(Cmplex{BigInt})
    l = a * x
    r = x * a
    l == r
end

@test begin
    x = random(Cmplex{BigInt})
    y = random(Cmplex{BigInt})
    z = random(Cmplex{BigInt})
    l = (x + y) * z
    r = (x * z) + (y * z)
    l == r
end

@test begin
    x = random(Cmplex{BigInt})
    y = random(Cmplex{BigInt})
    z = random(Cmplex{BigInt})
    l = x * (y - z)
    r = (x * y) - (x * z)
    l == r
end

@test begin
    x = random(Cmplex{BigInt})
    y = random(Cmplex{BigInt})
    z = random(Cmplex{BigInt})
    l = (x - y) * z
    r = (x * z) - (y * z)
    l == r
end

@test begin
    x = random(Cmplex{BigInt})
    abs2(x) > big(0)
end

@test begin
    x = random(Cmplex{BigInt})
    y = random(Cmplex{BigInt})
    l = abs2(x * y)
    r = abs2(x) * abs2(y)
    l == r
end

@test_throws ErrorException begin
    inv(Cmplex(0, 0.0))
end

@test_throws ErrorException begin
    random(Cmplex{Int}) / 0
end

@test_throws ErrorException begin
    0 \ random(Cmplex{Int})
end

@test begin
    a = Plexifications.randomBigRational()
    z = random(Cmplex{Rational{BigInt}})
    l = z / a
    r = a \ z
    l == r
end

@test begin
    a = Plexifications.randomBigRational()
    z = random(Cmplex{Rational{BigInt}})
    l = a / z
    r = z \ a
    l == r
end

@test begin
    z = random(Cmplex{BigInt})
    z == z + zero(Cmplex{BigInt})
end

@test begin
    z = random(Cmplex{BigInt})
    z == z * one(Cmplex{BigInt})
end

@test begin
    z = random(Cmplex{BigInt})
    z == z + zero(z)
end

@test begin
    z = random(Cmplex{BigInt})
    z == z * one(z)
end
