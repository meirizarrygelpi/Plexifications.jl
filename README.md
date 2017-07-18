# Plexifications.jl

[![Build Status](https://travis-ci.org/meirizarrygelpi/Plexifications.jl.svg?branch=master)](https://travis-ci.org/meirizarrygelpi/Plexifications.jl) [![Build status](https://ci.appveyor.com/api/projects/status/in796bf5m0fecub4?svg=true)](https://ci.appveyor.com/project/meirizarrygelpi/plexifications-jl) [![Coverage Status](https://coveralls.io/repos/github/meirizarrygelpi/Plexifications.jl/badge.svg?branch=master)](https://coveralls.io/github/meirizarrygelpi/Plexifications.jl?branch=master) [![codecov.io](http://codecov.io/github/meirizarrygelpi/Plexifications.jl/coverage.svg?branch=master)](http://codecov.io/github/meirizarrygelpi/Plexifications.jl?branch=master)

This module provides arithmetic for plexifications.

There is an abstract type:
```julia
Plexification{T <: Number} <: Number
```
and three concrete types:
```julia
Complexification{T <: Number} <: Plexification{T}
Perplexification{T <: Number} <: Plexification{T}
Nilplexification{T <: Number} <: Plexification{T}
```
Each of the concrete types is a pair of elements.

A set of aliases are provided for convenience:
```julia
# 2-dimensional
Cmplex{T <: Real} = Complexification{T}
Prplex{T <: Real} = Perplexification{T}
Nlplex{T <: Real} = Nilplexification{T}

# 4-dimensional
BiComplex{T <: Real} = Complexification{Cmplex{T}}
BiPerplex{T <: Real} = Perplexification{Prplex{T}}
BiNilplex{T <: Real} = Nilplexification{Nlplex{T}}
DualComplex{T <: Real} = Nilplexification{Cmplex{T}}
DualPerplex{T <: Real} = Nilplexification{Prplex{T}}

# 8-dimensional
TriComplex{T <: Real} = Complexification{BiComplex{T}}
TriPerplex{T <: Real} = Perplexification{BiPerplex{T}}
TriNilplex{T <: Real} = Nilplexification{BiNilplex{T}}
HyperComplex{T <: Real} = Nilplexification{DualComplex{T}}
HyperPerplex{T <: Real} = Nilplexification{DualPerplex{T}}
```

NEEDS DOCS.

NEEDS TESTS.