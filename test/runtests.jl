using DynamicPPL
using Distributions
using ForwardDiff
using Tracker
using Zygote

using Random
using Test

dir = splitdir(splitdir(pathof(DynamicPPL))[1])[1]
include(dir*"/test/Turing/Turing.jl")
using .Turing

turnprogress(false)

include("test_utils/AllUtils.jl")
include("test_util.jl")

@testset "DynamicPPL.jl" begin
    include("utils.jl")
    include("compiler.jl")
    include("varinfo.jl")
    include("model.jl")
    include("sampler.jl")
    include("prob_macro.jl")
    include("independence.jl")
    include("distribution_wrappers.jl")

    include("threadsafe.jl")

    @testset "compat" begin
        include(joinpath("compat", "ad.jl"))
    end
end
