" Vim syntax file
" Language:	OpenCL (Open Computing Language)
" Maintainer:	Terence Ou (rivan_@msn.com)
" Last Change:	19-July-2010

if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

" Read the C syntax to start with
if version < 600
  source <sfile>:p:h/c.vim
else
  runtime! syntax/c.vim
endif

" address space qualifiers
syn keyword clStorageClass	global __global local __local constant __constant private __private generic __generic
" function qualifiers
syn keyword clStorageClass      kernel __kernel  __attribute__
syn keyword clStorageClass      read_only __read_only write_only __write_only 
								read_write __read_write
syn keyword clStorageClass      complex imaginary

" scalar types
syn keyword clType              bool uchar ushort uint ulong half quad

" vector types
syn keyword clType		char2 char3 char4 char8 char16
syn keyword clType		uchar2 uchar3 uchar4 uchar8 uchar16
syn keyword clType		short2 short3 short4 short8 short16
syn keyword clType		ushort2 ushort3 ushort4 ushort8 ushort16
syn keyword clType		int2 int3 int4 int8 int16
syn keyword clType		uint2 uint3 uint4 uint8 uint16
syn keyword clType		long2 long3 long4 long8 long16
syn keyword clType		ulong2 ulong3 ulong4 ulong8 ulong16
syn keyword clType		float2 float3 float4 float8 float16
syn keyword clType		double2 double3 double4 double8 double16
syn keyword clType              half2 half3 half4 half8 half16

" other types
syn keyword clType      ptrdiff_t intptr_t uintptr_t

syn keyword clType		image1d_buffer_t image1d_array_t

syn keyword clType		image2d_t image2d_array_t image2d_array_depth_t   
						image2d_depth_t 

syn keyword clType		image3d_t

syn keyword clType		sampler_t 

syn keyword clType 		event_t queue_t ndrange_t clk_event_t reserve_id_t 			
						cl_mem_fence_flags kernel_enqueue_flags_t

" reserved types
syn keyword clType              bool2 bool3 bool4 bool8 bool16
syn keyword clType              quad2 quad3 quad4 quad8 quad16
syn match clType                "\(float\|double\)\(2\|3\|4\|8\|16\)x\(2\|3\|4\|8\|16\)"

" abstract data types
syn keyword clType              _cl_platform_id _cl_device_id _cl_context _cl_command_queue _cl_mem _cl_program _cl_kernel _cl_event _cl_sampler

" image format descriptor structure
syn keyword clType              cl_image_format

syn keyword clCast              vec_type_hint work_group_size_hint aligned packed endian

syn match clCast                "as_\(uchar\|char\|ushort\|short\|uint\|int\|ulong\|long\|float\|double\)"

syn match clCast                "as_\(uchar\|char\|ushort\|short\|uint\|int\|ulong\|long\|float\|double\)\(2\|3\|4\|8\|16\)"

syn match clCast                "convert_\(uchar\|char\|ushort\|short\|uint\|int\|ulong\|long\|float\|double\))\(2\|3\|4\|8\|16\)"

syn match clCast                "convert_\(uchar\|char\|ushort\|short\|uint\|int\|ulong\|long\|float\|double\))\(2\|3\|4\|8\|16\)_sat"

syn match clCast                "convert_\(uchar\|char\|ushort\|short\|uint\|int\|ulong\|long\|float\|double\))\(2\|3\|4\|8\|16\)_sat_\(rte\|rtz\|rtp\|rtn\)"

" work item functions
syn keyword clFunction	get_work_dim get_global_size get_global_id get_local_size
						get_local_id get_num_groups get_group_id get_global_offset
						get_enqueued_local_size get_global_linear_id get_local_linear_id

" math functions
syn keyword clFunction          cos cosh cospi acos acosh acospi
syn keyword clFunction          sin sincos sinh sinpi asin asinh asinpi
syn keyword clFunction          tan tanh tanpi atan atan2 atanh atanpi atan2pi
syn keyword clFunction          cbrt ceil copysign
syn keyword clFunction          erfc erf
syn keyword clFunction          exp exp2 exp10 expm1
syn keyword clFunction          fabs fdim floor fma fmax fmin
syn keyword clFunction          fract frexp hypot ilogb
syn keyword clFunction          ldexp ldexp lgamma lgamma_r
syn keyword clFunction          log log2 log10 log1p logb
syn keyword clFunction          mad modf
syn keyword clFunction          nan nextafter
syn keyword clFunction          pow pown powr
syn keyword clFunction          remainder remquo rint rootn round rsqrt sqrt
syn keyword clFunction          tgamma trunc
syn keyword clFunction          half_cos half_divide half_exp half_exp2 half_exp10 half_log half_log2 half_log10 half_powr half_recip half_rsqrt half_sin half_sqrt half_tan
syn keyword clFunction          native_cos native_divide native_exp native_exp2 native_exp10 native_log native_log2 native_log10 native_powr native_recip native_rsqrt native_sin native_sqrt native_tan

" integer functions
syn keyword clFunction          abs abs_diff add_sat hadd rhadd clz mad_hi mad_sat max min mul_hi rotate sub_sat upsample mad24 mul24

" common functions
syn keyword clFunction          clamp degrees max min mix radians step smoothstep sign

" geometric functions
syn keyword clFunction          cross dot distance length normalize fast_distance fast_length fast_normalize

" miscellaneous vector functions
syn keyword clFunction          vec_step shuffle shuffle2

" relational functions
syn keyword clFunction          isequal isnotequal isgreater isgreaterequal isless islessequal islessgreater isfinite isinf isnan isnormal isordered isunordered signbit any all bitselect select

" vector data load and store functions
syn keyword clFunction          vload_half vstore_half
syn match clFunction            "vload\(2\|3\|4\|8\|16\)"
syn match clFunction            "vload_half\(2\|3\|4\|8\|16\)"
syn match clFunction            "vloada_half\(2\|3\|4\|8\|16\)"
syn match clFunction            "vloada_half\(2\|3\|4\|8\|16\)_\(rte\|rtz\|rtp\)"
syn match clFunction            "vstore\(2\|3\|4\|8\|16\)"
syn match clFunction            "vstore\(rte\|rtz\|rtp\|rtn\)"
syn match clFunction            "vstore_half\(2\|3\|4\|8\|16\)"
syn match clFunction            "vstore_half_\(rte\|rtz\|rtp\|rtn\)"
syn match clFunction            "vstore_half\(2\|3\|4\|8\|16\)_\(rte\|rtz\|rtp\|rtn\)"
syn match clFunction            "vstorea_half\(2\|3\|4\|8\|16\)"
syn match clFunction            "vstorea_half\(2\|3\|4\|8\|16\)_\(rte\|rtz\|rtp\|rtn\)"

" image read and write functions
syn match clFunction            "read_image\(f\|i\|ui\|h\)"
syn match clFunction            "write_image\(f\|i\|ui\|h\)"
syn keyword clFunction          get_image_width get_image_height get_image_depth get_image_channel_data_type get_image_channel_order get_image_dim get_image_array_size(


" explicit memory fence functions
syn keyword clFunction          barrier mem_fence read_mem_fence write_mem_fence

" async copies from global to local mem to and fro and prefetch
syn keyword clFunction          async_work_group_copy async_work_group_strided_copy wait_group_events prefetch

" address space qualifier functions
syn keyword clFunction	to_global to_local to_private get_fence

" atomic functions
syn match clFunction            "atom_\(add\|sub\|xchg\|inc\|dec\|cmpxchg\|min\|max\|and\|or\|xor\|init\)"

syn match clFunction atomic_work_item_fence atomic_store atomic_store_explicit atomic_load atomic_load_explicit atomic_exchange atomic_exchange_explicit atomic_compare_exchange_strong  atomic_compare_exchange_strong_explicit  atomic_compare_exchange_weak atomic_compare_exchange_weak_explicit

syn match clFunction "atomic_fetch_\(\|add\|sub\|or\|xor\|and\|min\|max\)"
syn match clFunction "atomic_fetch_\(\|add\|sub\|or\|xor\|and\|min\|max\)_explicit"

syn match clFunction atomic_flag_clear atomic_flag_clear_explicit

syn match clFunction printf

syn keyword clType memory_order memory_scope

syn keyword clConstant ATOMIC_VAR_INIT

" memory operation ordering
syn keyword clConstant 	memory_order_relaxed memory_order_acquire 
						memory_order_release memory_order_acq_rel
						memory_order_seq_cst

syn keyword clConstant 	memory_scope_work_item memory_scope_work_group
						memory_scope_device memory_scope_all_svm_devices

syn match clType 		atomic_flag
syn match clType 		"atomic_\(int\|uint\|long\|ulong\|float\|double\|intptr_t\|uintptr_t\|size_t\|ptrdiff_t\)"

syn keyword clConstant          MAXFLOAT HUGE_VALF INFINITY NAN

syn keyword clConstant          FLT_DIG FLT_MANT_DIG FLT_MAX_10_EXP FLT_MAX_EXP FLT_MIN_10_EXP FLT_MIN_EXP FLT_RADIX FLT_MAX FLT_MIN FLT_EPSILON

syn keyword clConstant          CHAR_BIT CHAR_MAX CHAR_MIN INT_MIN INT_MAX LONG_MAX LONG_MIN SCHAR_MAX SCHAR_MIN SHRT_MAX SHRT_MIN UCHAR_MAX UCHAR_MIN UINT_MAX ULONG_MAX

syn keyword clConstant          DBL_DIG DBL_MANT_DIG DBL_MAX_10_EXP DBL_MIN_10_EXP DBL_MIN_EXP DBL_MAX DBL_MIN DBL_EPSILON

syn keyword clConstant          M_E M_LOG2E M_LOG10E M_LN2 M_LN10 M_PI M_PI2 M_PI4 M_1_PI M_2_PI M_2_SQRTPI M_SQRT2 M_SQRT1_2

syn keyword clConstant          CLK_NORMALIZED_COORDS_TRUE CLK_NORMALIZED_COORDS_FALSE

syn keyword clConstant          CLK_ADDRESS_REPEAT CLK_ADDRESS_CLAMP_TO_EDGE CLK_ADDRESS_CLAMP

syn keyword clConstant          CL_INTENSITY CL_RA CL_ARGB CL_BGRA CL_RGBA CL_R CL_RG CL_RGB CL_RGx CL_RGBx CL_Rx CL_A CL_LUMINANCE

syn keyword clConstant          CL_SNORM_INT8 CL_SNORM_INT16 CL_UNORM_INT8 CL_UNORM_INT16 CL_UNORM_SHORT_565 CL_UNORM_SHORT_555 CL_UNORM_INT_101010 CL_SIGNED_INT8 CL_SIGNED_INT16 CL_SIGNED_INT32 CL_UNSIGNED_INT8 CL_UNSIGNED_INT16 CL_UNSIGNED_INT32 CL_HALF_FLOAT CL_FLOAT

syn keyword clConstant          CLK_ADDRESS_NONE CLK_FILTER_NEAREST CLK_FILTER_LINEAR CLK_ADDRESS_MIRRORED_REPEAT 

syn keyword clConstant          CLK_GLOBAL_MEM_FENCE CLK_LOCAL_MEM_FENCE
								CLK_IMAGE_MEM_FENCE

syn keyword clConstant	__OPENCL_VERSION__ CL_VERSION_1_0 CL_VERSION_1_1 
						CL_VERSION_1_2 CL_VERSION_2_0 __OPENCL_C_VERSION__ __ENDIAN_LITTLE__ __IMAGE_SUPPORT__ __FAST_RELAXED_MATH__ __func__

" work group functions
syn match clFunction 	work_group_all work_group_any work_group_broadcast

syn match clFunction 	"work_group_reduce_\(add\|min\|max\)
syn match clFunction 	"work_group_scan_\(exclusive\|inclusive\)_\(add\|min\|max\)

" pipes"
syn match clType 		pipe
syn keyword clConstant CLK_NULL_RESERVE_ID

syn match clFunction read_pipe write_pipe reserve_read_pipe reserve_write_pipe commit_read_pipe commit_write_pipe is_valid_reserve_id

syn match clFunction work_group_reserve_read_pipe work_group_reserve_write_pipe work_group_commit_read_pipe work_group_commit_write_pipe

syn match clFunction get_pipe_num_packets get_pipe_max_packets

" enqueueng kerels
syn match clFunction enqueue_kernel

syn keyword clConstant CLK_INVALID_QUEUE CLK_INVALID_NDRANGE CLK_INVALID_EVENT_WAIT_LIST CLK_DEVICE_QUEUE_FULL CLK_INVALID_ARG_SIZE CLK_EVENT_ALLOCATION_FAILURE CLK_OUT_OF_RESOURCES

syn keyword clConstant CLK_ENQUEUE_FLAGS_NO_WAIT CLK_ENQUEUE_FLAGS_WAIT_KERNEL CLK_ENQUEUE_FLAGS_WAIT_WORK_GROUP66

syn match clFunction get_kernel_work_group_size get_kernel_preferred_work_group_size_multiple enqueue_marker

syn match clFunction retain_event release_event create_user_event is_valid_event capture_event_profiling_info

syn keyword clConstant CLK_PROFILING_COMMAND_EXEC_TIME CL_PROFILING_COMMAND_END CL_PROFLING_COMMAND_START CL_PROFILING_COMMAND_COMPLETE

syn match clFunction get_default_queue ndrange_1D ndrange_2D ndrange_3D

hi def link clStorageClass	StorageClass
hi def link clStructure         Structure
hi def link clType		Type
hi def link clVariable	        Identifier
hi def link clConstant	        Constant
hi def link clCast              Operator
hi def link clFunction          Function
hi def link clStatement         Statement

let b:current_syntax = "opencl"

" vim: ts=8
