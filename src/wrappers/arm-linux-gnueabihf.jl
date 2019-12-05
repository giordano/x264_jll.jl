# Autogenerated wrapper script for x264_jll for arm-linux-gnueabihf
export libx264, x264

## Global variables
PATH = ""
LIBPATH = ""
LIBPATH_env = "LD_LIBRARY_PATH"

# Relative path to `libx264`
const libx264_splitpath = ["lib", "libx264.so"]

# This will be filled out by __init__() for all products, as it must be done at runtime
libx264_path = ""

# libx264-specific global declaration
# This will be filled out by __init__()
libx264_handle = C_NULL

# This must be `const` so that we can use it with `ccall()`
const libx264 = "libx264.so.157"


# Relative path to `x264`
const x264_splitpath = ["bin", "x264"]

# This will be filled out by __init__() for all products, as it must be done at runtime
x264_path = ""

# x264-specific global declaration
function x264(f::Function; adjust_PATH::Bool = true, adjust_LIBPATH::Bool = true)
    global PATH, LIBPATH
    env_mapping = Dict{String,String}()
    if adjust_PATH
        if !isempty(get(ENV, "PATH", ""))
            env_mapping["PATH"] = string(PATH, ':', ENV["PATH"])
        else
            env_mapping["PATH"] = PATH
        end
    end
    if adjust_LIBPATH
        if !isempty(get(ENV, LIBPATH_env, ""))
            env_mapping[LIBPATH_env] = string(LIBPATH, ':', ENV[LIBPATH_env])
        else
            env_mapping[LIBPATH_env] = LIBPATH
        end
    end
    withenv(env_mapping...) do
        f(x264_path)
    end
end


"""
Open all libraries
"""
function __init__()
    global artifact_dir = abspath(artifact"x264")

    # Initialize PATH and LIBPATH environment variable listings
    global PATH_list, LIBPATH_list
    # We first need to add to LIBPATH_list the libraries provided by Julia
    append!(LIBPATH_list, [joinpath(Sys.BINDIR, Base.LIBDIR, "julia"), joinpath(Sys.BINDIR, Base.LIBDIR)])
    global libx264_path = normpath(joinpath(artifact_dir, libx264_splitpath...))

    # Manually `dlopen()` this right now so that future invocations
    # of `ccall` with its `SONAME` will find this path immediately.
    global libx264_handle = dlopen(libx264_path)
    push!(LIBPATH_list, dirname(libx264_path))

    global x264_path = normpath(joinpath(artifact_dir, x264_splitpath...))

    push!(PATH_list, dirname(x264_path))
    # Filter out duplicate and empty entries in our PATH and LIBPATH entries
    filter!(!isempty, unique!(PATH_list))
    filter!(!isempty, unique!(LIBPATH_list))
    global PATH = join(PATH_list, ':')
    global LIBPATH = join(LIBPATH_list, ':')

    # Add each element of LIBPATH to our DL_LOAD_PATH (necessary on platforms
    # that don't honor our "already opened" trick)
    #for lp in LIBPATH_list
    #    push!(DL_LOAD_PATH, lp)
    #end
end  # __init__()

