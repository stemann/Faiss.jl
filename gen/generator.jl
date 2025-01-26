using Clang.Generators
using Faiss_jll

cd(@__DIR__)

include_dir = joinpath(Faiss_jll.artifact_dir, "include", "faiss", "c_api")

options = load_options(joinpath(@__DIR__, "generator.toml"))

args = get_default_args()
push!(args, "-I$(joinpath(Faiss_jll.artifact_dir, "include"))")

headers = [
    joinpath(include_dir, header) for
    header in readdir(include_dir) if endswith(header, ".h")
]

ctx = create_context(headers, args, options)

build!(ctx)
