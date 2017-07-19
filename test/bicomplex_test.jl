using Plexifications
using Base.Test: @test, @test_throws

@test_throws ErrorException begin
    inv(BiComplex(0, 0.0))
end

@test begin
    iszerodivisor(BiComplex(0,0))
end

@test begin
    !iszerodivisor(BiComplex(0,1))
end

@test begin
    length(unreal(1)) == 0
end

@test begin
    a = Plexifications.randomBigFloat()
    isreal(BiComplex(a))
end

@test begin
    a = 1
    !isreal(BiComplex(a, a))
end

@test begin
    z = random(BiComplex{Int})
    z == +(z)
end

@test begin
    a = Plexifications.randomBigFloat()
    real(BiComplex(a)) == a
end

@test begin
    io = IOBuffer()
    show(io, BiComplex(1, 2, 3, 4))
    l = String(take!(io))
    r = "[1: 1, H: 2, G: 3, GH: 4]"
    l == r
end

@test begin
    x = random(BiComplex{BigFloat})
    y = random(BiComplex{BigFloat})
    x != y
end

@test begin
    a = Plexifications.randomBigInt()
    z = random(BiComplex{BigInt})
    l = a + z
    r = z + a
    l == r
end

@test begin
    a = Plexifications.randomBigInt()
    z = random(BiComplex{BigInt})
    l = a - z
    r = -(z - a)
    l == r
end

@test begin
    x = random(BiComplex{BigInt})
    y = random(BiComplex{BigInt})
    l = x + y
    r = y + x
    l == r
end

@test begin
    x = random(BiComplex{BigInt})
    y = random(BiComplex{BigInt})
    l = x * y
    r = y * x
    l == r
end

@test begin
    x = random(BiComplex{BigInt})
    y = random(BiComplex{BigInt})
    l = x - y
    r = -(y - x)
    l == r
end

@test begin
    x = random(BiComplex{BigInt})
    y = random(BiComplex{BigInt})
    z = random(BiComplex{BigInt})
    l = (x + y) + z
    r = x + (y + z)
    l == r
end

@test begin
    x = random(BiComplex{BigInt})
    y = random(BiComplex{BigInt})
    z = random(BiComplex{BigInt})
    l = (x * y) * z
    r = x * (y * z)
    l == r
end

@test begin
    x = random(BiComplex{BigInt})
    barH(barH(x)) == x
end

@test begin
    x = random(BiComplex{BigInt})
    barG(barG(x)) == x
end

@test begin
    x = random(BiComplex{Rational{BigInt}})
    inv(inv(x)) == x
end

@test begin
    x = random(BiComplex{BigInt})
    y = random(BiComplex{BigInt})
    l = barH(x * y)
    r = barH(x) * barH(y)
    l == r
end

@test begin
    x = random(BiComplex{BigInt})
    y = random(BiComplex{BigInt})
    l = barH(x + y)
    r = barH(x) + barH(y)
    l == r
end

@test begin
    x = random(BiComplex{BigInt})
    y = random(BiComplex{BigInt})
    l = barH(x - y)
    r = barH(x) - barH(y)
    l == r
end

@test begin
    x = random(BiComplex{BigInt})
    y = random(BiComplex{BigInt})
    l = barG(x * y)
    r = barG(x) * barG(y)
    l == r
end

@test begin
    x = random(BiComplex{BigInt})
    y = random(BiComplex{BigInt})
    l = barG(x + y)
    r = barG(x) + barG(y)
    l == r
end

@test begin
    x = random(BiComplex{BigInt})
    y = random(BiComplex{BigInt})
    l = barG(x - y)
    r = barG(x) - barG(y)
    l == r
end

@test begin
    x = random(BiComplex{Rational{BigInt}})
    y = random(BiComplex{Rational{BigInt}})
    l = inv(x * y)
    r = inv(y) * inv(x)
    l == r
end

@test begin
    x = random(BiComplex{Rational{BigInt}})
    y = random(BiComplex{Rational{BigInt}})
    l = inv(x / y)
    r = y / x
    l == r
end

@test begin
    x = random(BiComplex{Rational{BigInt}})
    y = random(BiComplex{Rational{BigInt}})
    l = inv(x \ y)
    r = y \ x
    l == r
end

@test begin
    x = random(BiComplex{BigInt})
    y = random(BiComplex{BigInt})
    z = random(BiComplex{BigInt})
    l = x * (y + z)
    r = (x * y) + (x * z)
    l == r
end

@test begin
    a = Plexifications.randomBigInt()
    x = random(BiComplex{BigInt})
    y = random(BiComplex{BigInt})
    l = a * (x + y)
    r = (a * x) + (a * y)
    l == r
end

@test begin
    a = Plexifications.randomBigInt()
    x = random(BiComplex{BigInt})
    l = a * x
    r = x * a
    l == r
end

@test begin
    x = random(BiComplex{BigInt})
    y = random(BiComplex{BigInt})
    z = random(BiComplex{BigInt})
    l = (x + y) * z
    r = (x * z) + (y * z)
    l == r
end

@test begin
    x = random(BiComplex{BigInt})
    y = random(BiComplex{BigInt})
    z = random(BiComplex{BigInt})
    l = x * (y - z)
    r = (x * y) - (x * z)
    l == r
end

@test begin
    x = random(BiComplex{BigInt})
    y = random(BiComplex{BigInt})
    z = random(BiComplex{BigInt})
    l = (x - y) * z
    r = (x * z) - (y * z)
    l == r
end

@test begin
    x = random(BiComplex{BigInt})
    norm(x) > big(0)
end

@test begin
    x = random(BiComplex{BigInt})
    y = random(BiComplex{BigInt})
    l = norm(x * y)
    r = norm(x) * norm(y)
    l == r
end

@test_throws ErrorException begin
    inv(BiComplex(0, 0.0))
end

@test_throws ErrorException begin
    random(BiComplex{Int}) / 0
end

@test_throws ErrorException begin
    0 \ random(BiComplex{Int})
end

@test begin
    a = Plexifications.randomBigRational()
    z = random(BiComplex{Rational{BigInt}})
    l = z / a
    r = a \ z
    l == r
end

@test begin
    a = Plexifications.randomBigRational()
    z = random(BiComplex{Rational{BigInt}})
    l = a / z
    r = z \ a
    l == r
end

@test begin
    z = random(BiComplex{BigInt})
    z == z + zero(BiComplex{BigInt})
end

@test begin
    z = random(BiComplex{BigInt})
    z == z * one(BiComplex{BigInt})
end

@test begin
    z = random(BiComplex{BigInt})
    z == z + zero(z)
end

@test begin
    z = random(BiComplex{BigInt})
    z == z * one(z)
end

@test begin
    x = random(BiComplex{BigInt})
    y = random(BiComplex{BigInt})
    l = commutator(x, y)
    r = zero(BiComplex{BigInt})
    l == r
end

@test begin
    x = random(BiComplex{BigInt})
    y = random(BiComplex{BigInt})
    l = alternatorL(x, y)
    r = zero(BiComplex{BigInt})
    l == r
end

@test begin
    x = random(BiComplex{BigInt})
    y = random(BiComplex{BigInt})
    l = alternatorR(x, y)
    r = zero(BiComplex{BigInt})
    l == r
end

@test begin
    x = random(BiComplex{BigInt})
    y = random(BiComplex{BigInt})
    l = flexator(x, y)
    r = zero(BiComplex{BigInt})
    l == r
end

@test begin
    x = random(BiComplex{BigInt})
    y = random(BiComplex{BigInt})
    z = random(BiComplex{BigInt})
    l = associator(x, y, z)
    r = zero(BiComplex{BigInt})
    l == r
end

@test begin
    x = random(BiComplex{BigInt})
    y = random(BiComplex{BigInt})
    z = random(BiComplex{BigInt})
    l = jacobiator(x, y, z)
    r = 3 * x * y * z
    l == r
end
