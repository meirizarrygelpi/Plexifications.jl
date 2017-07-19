using Plexifications
using Base.Test: @test, @test_throws

@test_throws ErrorException begin
    inv(TriComplex(0, 0.0))
end

@test begin
    iszerodivisor(TriComplex(0,1,1,0))
end

@test begin
    !iszerodivisor(TriComplex(1,2,3,4))
end

@test begin
    a = Plexifications.randomBigFloat()
    isreal(TriComplex(a))
end

@test begin
    a = 1
    !isreal(TriComplex(a, a))
end

@test begin
    z = random(TriComplex{Int})
    z == +(z)
end

@test begin
    a = Plexifications.randomBigFloat()
    real(TriComplex(a)) == a
end

@test begin
    io = IOBuffer()
    show(io, TriComplex(1, 2, 3, 4, 5, 6, 7, 8))
    l = String(take!(io))
    r = "[1: 1, H: 2, G: 3, GH: 4, F: 5, FH: 6, FG: 7, FGH: 8]"
    l == r
end

@test begin
    x = random(TriComplex{BigFloat})
    y = random(TriComplex{BigFloat})
    x != y
end

@test begin
    a = Plexifications.randomBigInt()
    z = random(TriComplex{BigInt})
    l = a + z
    r = z + a
    l == r
end

@test begin
    a = Plexifications.randomBigInt()
    z = random(TriComplex{BigInt})
    l = a - z
    r = -(z - a)
    l == r
end

@test begin
    x = random(TriComplex{BigInt})
    y = random(TriComplex{BigInt})
    l = x + y
    r = y + x
    l == r
end

@test begin
    x = random(BiComplex{BigInt})
    y = random(TriComplex{BigInt})
    l = x + y
    r = y + x
    l == r
end

@test begin
    x = random(TriComplex{BigInt})
    y = random(TriComplex{BigInt})
    l = x * y
    r = y * x
    l == r
end

@test begin
    x = random(BiComplex{BigInt})
    y = random(TriComplex{BigInt})
    l = x * y
    r = y * x
    l == r
end

@test begin
    x = random(TriComplex{BigInt})
    y = random(TriComplex{BigInt})
    l = x - y
    r = -(y - x)
    l == r
end

@test begin
    x = random(BiComplex{BigInt})
    y = random(TriComplex{BigInt})
    l = x - y
    r = -(y - x)
    l == r
end


@test begin
    x = random(TriComplex{BigInt})
    y = random(TriComplex{BigInt})
    z = random(TriComplex{BigInt})
    l = (x + y) + z
    r = x + (y + z)
    l == r
end

@test begin
    x = random(TriComplex{BigInt})
    y = random(TriComplex{BigInt})
    z = random(TriComplex{BigInt})
    l = (x * y) * z
    r = x * (y * z)
    l == r
end

@test begin
    x = random(TriComplex{BigInt})
    barH(barH(x)) == x
end

@test begin
    x = random(TriComplex{BigInt})
    barG(barG(x)) == x
end

@test begin
    x = random(TriComplex{BigInt})
    barG(barH(x)) == barH(barG(x))
end

@test begin
    x = random(TriComplex{Rational{BigInt}})
    inv(inv(x)) == x
end

@test begin
    x = random(TriComplex{BigInt})
    y = random(TriComplex{BigInt})
    l = barH(x * y)
    r = barH(x) * barH(y)
    l == r
end

@test begin
    x = random(TriComplex{BigInt})
    y = random(TriComplex{BigInt})
    l = barH(x + y)
    r = barH(x) + barH(y)
    l == r
end

@test begin
    x = random(TriComplex{BigInt})
    y = random(TriComplex{BigInt})
    l = barH(x - y)
    r = barH(x) - barH(y)
    l == r
end

@test begin
    x = random(TriComplex{BigInt})
    y = random(TriComplex{BigInt})
    l = barG(x * y)
    r = barG(x) * barG(y)
    l == r
end

@test begin
    x = random(TriComplex{BigInt})
    y = random(TriComplex{BigInt})
    l = barG(x + y)
    r = barG(x) + barG(y)
    l == r
end

@test begin
    x = random(TriComplex{BigInt})
    y = random(TriComplex{BigInt})
    l = barG(x - y)
    r = barG(x) - barG(y)
    l == r
end

@test begin
    x = random(TriComplex{Rational{BigInt}})
    y = random(TriComplex{Rational{BigInt}})
    l = inv(x * y)
    r = inv(y) * inv(x)
    l == r
end

@test begin
    x = random(TriComplex{Rational{BigInt}})
    y = random(TriComplex{Rational{BigInt}})
    l = inv(x / y)
    r = y / x
    l == r
end

@test begin
    x = random(TriComplex{Rational{BigInt}})
    y = random(TriComplex{Rational{BigInt}})
    l = inv(x \ y)
    r = y \ x
    l == r
end

@test begin
    x = random(TriComplex{BigInt})
    y = random(TriComplex{BigInt})
    z = random(TriComplex{BigInt})
    l = x * (y + z)
    r = (x * y) + (x * z)
    l == r
end

@test begin
    a = Plexifications.randomBigInt()
    x = random(TriComplex{BigInt})
    y = random(TriComplex{BigInt})
    l = a * (x + y)
    r = (a * x) + (a * y)
    l == r
end

@test begin
    a = Plexifications.randomBigInt()
    x = random(TriComplex{BigInt})
    l = a * x
    r = x * a
    l == r
end

@test begin
    x = random(TriComplex{BigInt})
    y = random(TriComplex{BigInt})
    z = random(TriComplex{BigInt})
    l = (x + y) * z
    r = (x * z) + (y * z)
    l == r
end

@test begin
    x = random(TriComplex{BigInt})
    y = random(TriComplex{BigInt})
    z = random(TriComplex{BigInt})
    l = x * (y - z)
    r = (x * y) - (x * z)
    l == r
end

@test begin
    x = random(TriComplex{BigInt})
    y = random(TriComplex{BigInt})
    z = random(TriComplex{BigInt})
    l = (x - y) * z
    r = (x * z) - (y * z)
    l == r
end

@test begin
    x = random(TriComplex{BigInt})
    norm(x) > big(0)
end

@test begin
    x = random(TriComplex{BigInt})
    y = random(TriComplex{BigInt})
    l = norm(x * y)
    r = norm(x) * norm(y)
    l == r
end

@test_throws ErrorException begin
    inv(TriComplex(0, 0.0))
end

@test_throws ErrorException begin
    random(TriComplex{Int}) / 0
end

@test_throws ErrorException begin
    0 \ random(TriComplex{Int})
end

@test begin
    a = Plexifications.randomBigRational()
    z = random(TriComplex{Rational{BigInt}})
    l = z / a
    r = a \ z
    l == r
end

@test begin
    a = Plexifications.randomBigRational()
    z = random(TriComplex{Rational{BigInt}})
    l = a / z
    r = z \ a
    l == r
end

@test begin
    z = random(TriComplex{BigInt})
    z == z + zero(TriComplex{BigInt})
end

@test begin
    z = random(TriComplex{BigInt})
    z == z * one(TriComplex{BigInt})
end

@test begin
    z = random(TriComplex{BigInt})
    z == z + zero(z)
end

@test begin
    z = random(TriComplex{BigInt})
    z == z * one(z)
end

@test begin
    x = random(TriComplex{BigInt})
    y = random(TriComplex{BigInt})
    l = commutator(x, y)
    r = zero(TriComplex{BigInt})
    l == r
end

@test begin
    x = random(TriComplex{BigInt})
    y = random(TriComplex{BigInt})
    l = alternatorL(x, y)
    r = zero(TriComplex{BigInt})
    l == r
end

@test begin
    x = random(TriComplex{BigInt})
    y = random(TriComplex{BigInt})
    l = alternatorR(x, y)
    r = zero(TriComplex{BigInt})
    l == r
end

@test begin
    x = random(TriComplex{BigInt})
    y = random(TriComplex{BigInt})
    l = flexator(x, y)
    r = zero(TriComplex{BigInt})
    l == r
end

@test begin
    x = random(TriComplex{BigInt})
    y = random(TriComplex{BigInt})
    z = random(TriComplex{BigInt})
    l = associator(x, y, z)
    r = zero(TriComplex{BigInt})
    l == r
end

@test begin
    x = random(TriComplex{BigInt})
    y = random(TriComplex{BigInt})
    z = random(TriComplex{BigInt})
    l = jacobiator(x, y, z)
    r = 3 * x * y * z
    l == r
end

@test begin
    l = TriComplex(BiComplex(1,2))
    r = TriComplex(1,2,0)
    l == r
end

@test begin
    l = TriComplex(1, 2, 3.0)
    r = TriComplex(1.0, 2.0, 3.0)
    l == r
end

@test begin
    l = TriComplex(1, 2, 3, 4.0)
    r = TriComplex(1.0, 2.0, 3.0, 4.0)
    l == r
end
