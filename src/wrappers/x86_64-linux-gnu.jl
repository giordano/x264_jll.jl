# Autogenerated wrapper script for x264_jll for x86_64-linux-gnu
export libx264, x264

## Global variables
PATH = ""
LIBPATH = ""
LIBPATH_env = "LD_LIBRARY_PATH"
LIBPATH_default = ""

# Relative path to `libx264`
const libx264_splitpath = ["lib", "libx264.so"]

# This will be filled out by __init__() for all products, as it must be done at runtime
libx264_path = ""

# libx264-specific global declaration
# This will be filled out by __init__()
libx264_handle = C_NULL

# This must be `const` so that we can use it with `ccall()`
const libx264 = "libx264.so.161"


# Relative path to `x264`
const x264_splitpath = ["bin", "x264"]

# This will be filled out by __init__() for all products, as it must be done at runtime
x264_path = ""

# x264-specific global declaration
x264(f::Function; adjust_PATH::Bool = true, adjust_LIBPATH::Bool = true) =
    executable_wrapper(f, x264_path, PATH, LIBPATH, LIBPATH_env, LIBPATH_default, ':', adjust_PATH, adjust_LIBPATH)

"""
Open all libraries
"""
function __init__()
    global artifact_dir = abspath(artifact"x264")

    # Initialize PATH and LIBPATH environment variable listings
    global PATH_list, LIBPATH_list

    global libx264_path, libx264_handle
    libx264_path, libx264_handle = get_lib_path_handle!(LIBPATH_list, artifact_dir, libx264_splitpath)

    global x264_path = get_exe_path!(PATH_list, artifact_dir, x264_splitpath)

    global PATH, LIBPATH
    PATH, LIBPATH = cleanup_path_libpath!(PATH_list, LIBPATH_list, ':')
    
end  # __init__()
