#--------------------------------------------------------------------------------------------------
# \file  WarningFlags_gcc_4.6.4.cmake
# \brief CMAKE_CXX_FLAGS for GCC 4.6.4
#
# Doc - https://gcc.gnu.org/onlinedocs/gcc-4.6.4/gcc/Option-Summary.html#Option-Summary
#--------------------------------------------------------------------------------------------------


#--------------------------------------------------------------------------------------------------
# Overall Options
#
# 3.2 Options Controlling the Kind of Output
#--------------------------------------------------------------------------------------------------


#--------------------------------------------------------------------------------------------------
# C++ Language Options
#
# 3.5 Options Controlling C++ Dialect
#--------------------------------------------------------------------------------------------------


## set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fabi-version=n")
# Use version n of the C++ ABI. Version 2 is the version of the C++ ABI that first appeared in G++ 3.4. Version 1 is the version of the C++ ABI that first appeared in G++ 3.2. Version 0 will always be the version that conforms most closely to the C++ ABI specification. Therefore, the ABI obtained using version 0 will change as ABI bugs are fixed.
#
# The default is version 2.
#
# Version 3 corrects an error in mangling a constant address as a template argument.
#
# Version 4 implements a standard mangling for vector types.
#
# Version 5 corrects the mangling of attribute const/volatile on function pointer types, decltype of a plain decl, and use of a function parameter in the declaration of another parameter.
#
# See also -Wabi.

## set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fno-access-control")
# Turn off all access checking. This switch is mainly useful for working around bugs in the access control code.

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fcheck-new")
# Check that the pointer returned by operator new is non-null before attempting to modify the storage allocated. This check is normally unnecessary because the C++ standard specifies that operator new will only return 0 if it is declared ‘throw()’, in which case the compiler will always check the return value even without this option. In all other cases, when operator new has a non-empty exception specification, memory exhaustion is signalled by throwing std::bad_alloc. See also ‘new (nothrow)’.

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fconserve-space")
# Put uninitialized or runtime-initialized global variables into the common segment, as C does. This saves space in the executable at the cost of not diagnosing duplicate definitions. If you compile with this flag and your program mysteriously crashes after main() has completed, you may have an object that is being destroyed twice because two definitions were merged.

# This option is no longer useful on most targets, now that support has been added for putting variables into BSS without making them common.

## set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fconstexpr-depth=n")
# Set the maximum nested evaluation depth for C++0x constexpr functions to n. A limit is needed to detect endless recursion during constant expression evaluation. The minimum specified by the standard is 512.

## set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fno-deduce-init-list")
# Disable deduction of a template type parameter as std::initializer_list from a brace-enclosed initializer list, i.e.
#           template <class T> auto forward(T t) -> decltype (realfn (t))
#           {
#             return realfn (t);
#           }

#           void f()
#           {
#             forward({1,2}); // call forward<std::initializer_list<int>>
#           }

# This option is present because this deduction is an extension to the current specification in the C++0x working draft, and there was some concern about potential overload resolution problems.

## set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -ffriend-injection")
# Inject friend functions into the enclosing namespace, so that they are visible outside the scope of the class in which they are declared. Friend functions were documented to work this way in the old Annotated C++ Reference Manual, and versions of G++ before 4.1 always worked that way. However, in ISO C++ a friend function which is not declared in an enclosing scope can only be found using argument dependent lookup. This option causes friends to be injected as they were in earlier releases.

# This option is for compatibility, and may be removed in a future release of G++.

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fno-elide-constructors")
# The C++ standard allows an implementation to omit creating a temporary which is only used to initialize another object of the same type. Specifying this option disables that optimization, and forces G++ to call the copy constructor in all cases.

## set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fno-enforce-eh-specs")
# Don't generate code to check for violation of exception specifications at runtime. This option violates the C++ standard, but may be useful for reducing code size in production builds, much like defining ‘NDEBUG’. This does not give user code permission to throw exceptions in violation of the exception specifications; the compiler will still optimize based on the specifications, so throwing an unexpected exception will result in undefined behavior.

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -ffor-scope")
## set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fno-for-scope")
# If -ffor-scope is specified, the scope of variables declared in a for-init-statement is limited to the ‘for’ loop itself, as specified by the C++ standard. If -fno-for-scope is specified, the scope of variables declared in a for-init-statement extends to the end of the enclosing scope, as was the case in old versions of G++, and other (traditional) implementations of C++.

# The default if neither flag is given to follow the standard, but to allow and give a warning for old-style code that would otherwise be invalid, or have different behavior.

## set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fno-gnu-keywords")
# Do not recognize typeof as a keyword, so that code can use this word as an identifier. You can use the keyword __typeof__ instead. -ansi implies -fno-gnu-keywords.

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fno-implicit-templates")
# Never emit code for non-inline templates which are instantiated implicitly (i.e. by use); only emit code for explicit instantiations. See Template Instantiation, for more information.

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fno-implicit-inline-templates")
# Don't emit code for implicit instantiations of inline templates, either. The default is to handle inlines differently so that compiles with and without optimization will need the same set of explicit instantiations.

## set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fno-implement-inlines")
# To save space, do not emit out-of-line copies of inline functions controlled by ‘#pragma implementation’. This will cause linker errors if these functions are not inlined everywhere they are called.

## set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fms-extensions")
# Disable pedantic warnings about constructs used in MFC, such as implicit int and getting a pointer to member function via non-standard syntax.

### set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fno-nonansi-builtins")
# Disable built-in declarations of functions that are not mandated by ANSI/ISO C. These include ffs, alloca, _exit, index, bzero, conjf, and other related functions.

## set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fnothrow-opt")
# Treat a throw() exception specification as though it were a noexcept specification to reduce or eliminate the text size overhead relative to a function with no exception specification. If the function has local variables of types with non-trivial destructors, the exception specification will actually make the function smaller because the EH cleanups for those variables can be optimized away. The semantic effect is that an exception thrown out of a function with such an exception specification will result in a call to terminate rather than unexpected.

## set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fno-operator-names")
# Do not treat the operator name keywords and, bitand, bitor, compl, not, or and xor as synonyms as keywords.

## set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fno-optional-diags")
# Disable diagnostics that the standard says a compiler does not need to issue. Currently, the only such diagnostic issued by G++ is the one for a name having multiple meanings within a class.

## set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fpermissive")
# Downgrade some diagnostics about nonconformant code from errors to warnings. Thus, using -fpermissive will allow some nonconforming code to compile.

## set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fno-pretty-templates")
# When an error message refers to a specialization of a function template, the compiler will normally print the signature of the template followed by the template arguments and any typedefs or typenames in the signature (e.g. void f(T) [with T = int] rather than void f(int)) so that it's clear which template is involved. When an error message refers to a specialization of a class template, the compiler will omit any template arguments which match the default template arguments for that template. If either of these behaviors make it harder to understand the error message rather than easier, using -fno-pretty-templates will disable them.

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -frepo")
# Enable automatic template instantiation at link time. This option also implies -fno-implicit-templates. See Template Instantiation, for more information.

## set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fno-rtti")
# Disable generation of information about every class with virtual functions for use by the C++ runtime type identification features (‘dynamic_cast’ and ‘typeid’). If you don't use those parts of the language, you can save some space by using this flag. Note that exception handling uses the same information, but it will generate it as needed. The ‘dynamic_cast’ operator can still be used for casts that do not require runtime type information, i.e. casts to void * or to unambiguous base classes.

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fstats")
# Emit statistics about front-end processing at the end of the compilation. This information is generally only useful to the G++ development team.

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fstrict-enums")
# Allow the compiler to optimize using the assumption that a value of enumeration type can only be one of the values of the enumeration (as defined in the C++ standard; basically, a value which can be represented in the minimum number of bits needed to represent all the enumerators). This assumption may not be valid if the program uses a cast to convert an arbitrary integer value to the enumeration type.

## set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -ftemplate-depth=n")
# Set the maximum instantiation depth for template classes to n. A limit on the template instantiation depth is needed to detect endless recursions during template class instantiation. ANSI/ISO C++ conforming programs must not rely on a maximum depth greater than 17 (changed to 1024 in C++0x).

## set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fno-threadsafe-statics")
# Do not emit the extra code to use the routines specified in the C++ ABI for thread-safe initialization of local statics. You can use this option to reduce code size slightly in code that doesn't need to be thread-safe.

## set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fuse-cxa-atexit")
# Register destructors for objects with static storage duration with the __cxa_atexit function rather than the atexit function. This option is required for fully standards-compliant handling of static destructors, but will only work if your C library supports __cxa_atexit.

## set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fno-use-cxa-get-exception-ptr")
# Don't use the __cxa_get_exception_ptr runtime routine. This will cause std::uncaught_exception to be incorrect, but is necessary if the runtime routine is not available.

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fvisibility-inlines-hidden")
# This switch declares that the user does not attempt to compare pointers to inline methods where the addresses of the two functions were taken in different shared objects.

# The effect of this is that GCC may, effectively, mark inline methods with __attribute__ ((visibility ("hidden"))) so that they do not appear in the export table of a DSO and do not require a PLT indirection when used within the DSO. Enabling this option can have a dramatic effect on load and link times of a DSO as it massively reduces the size of the dynamic export table when the library makes heavy use of templates.

# The behavior of this switch is not quite the same as marking the methods as hidden directly, because it does not affect static variables local to the function or cause the compiler to deduce that the function is defined in only one shared object.

# You may mark a method as having a visibility explicitly to negate the effect of the switch for that method. For example, if you do want to compare pointers to a particular inline method, you might mark it as having default visibility. Marking the enclosing class with explicit visibility will have no effect.

# Explicitly instantiated inline methods are unaffected by this option as their linkage might otherwise cross a shared library boundary. See Template Instantiation.

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fvisibility-ms-compat")
# This flag attempts to use visibility settings to make GCC's C++ linkage model compatible with that of Microsoft Visual Studio.

# The flag makes these changes to GCC's linkage model:
# It sets the default visibility to hidden, like -fvisibility=hidden.
# Types, but not their members, are not hidden by default.
# The One Definition Rule is relaxed for types without explicit visibility specifications which are defined in more than one different shared object: those declarations are permitted if they would have been permitted when this option was not used.

# In new code it is better to use -fvisibility=hidden and export those classes which are intended to be externally visible. Unfortunately it is possible for code to rely, perhaps accidentally, on the Visual Studio behavior.

# Among the consequences of these changes are that static data members of the same type with the same name but defined in different shared objects will be different, so changing one will not change the other; and that pointers to function members defined in different shared objects may not compare equal. When this flag is given, it is a violation of the ODR to define types with the same name differently.

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fno-weak")
# Do not use weak symbol support, even if it is provided by the linker. By default, G++ will use weak symbols if they are available. This option exists only for testing, and should not be used by end-users; it will result in inferior code and has no benefits. This option may be removed in a future release of G++.

## set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -nostdinc++")
# Do not search for header files in the standard directories specific to C++, but do still search the other standard directories. (This option is used when building the C++ library.)

# In addition, these optimization, warning, and code generation options have meanings only for C++ programs:

## set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fno-default-inline")
# Do not assume ‘inline’ for functions defined inside a class scope. See Options That Control Optimization. Note that these functions will have linkage like inline functions; they just won't be inlined by default.

## set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wabi") # (C, Objective-C, C++ and Objective-C++ only)
# Warn when G++ generates code that is probably not compatible with the vendor-neutral C++ ABI. Although an effort has been made to warn about all such cases, there are probably some cases that are not warned about, even though G++ is generating incompatible code. There may also be cases where warnings are emitted even though the code that is generated will be compatible.
#
# You should rewrite your code to avoid these warnings if you are concerned about the fact that code generated by G++ may not be binary compatible with code generated by other compilers.
#
# The known incompatibilities in -fabi-version=2 (the default) include:
# A template with a non-type template parameter of reference type is mangled incorrectly:
#                extern int N;
#                template <int &> struct S {};
#                void n (S<N>) {2}
#
# This is fixed in -fabi-version=3.
# SIMD vector types declared using __attribute ((vector_size)) are mangled in a non-standard way that does not allow for overloading of functions taking vectors of different sizes.
#
# The mangling is changed in -fabi-version=4.
#
# The known incompatibilities in -fabi-version=1 include:
# Incorrect handling of tail-padding for bit-fields. G++ may attempt to pack data into the same byte as a base class. For example:
#                struct A { virtual void f(); int f1 : 1; };
#                struct B : public A { int f2 : 1; };
#
# In this case, G++ will place B::f2 into the same byte asA::f1; other compilers will not. You can avoid this problem by explicitly padding A so that its size is a multiple of the byte size on your platform; that will cause G++ and other compilers to layout B identically.
# Incorrect handling of tail-padding for virtual bases. G++ does not use tail padding when laying out virtual bases. For example:
#                struct A { virtual void f(); char c1; };
#                struct B { B(); char c2; };
#                struct C : public A, public virtual B {};
#
# In this case, G++ will not place B into the tail-padding for A; other compilers will. You can avoid this problem by explicitly padding A so that its size is a multiple of its alignment (ignoring virtual base classes); that will cause G++ and other compilers to layout C identically.
# Incorrect handling of bit-fields with declared widths greater than that of their underlying types, when the bit-fields appear in a union. For example:
#                union U { int i : 4096; };
#
# Assuming that an int does not have 4096 bits, G++ will make the union too small by the number of bits in an int.
# Empty classes can be placed at incorrect offsets. For example:
#                struct A {};
#
#                struct B {
#                  A a;
#                  virtual void f ();
#                };
#
#                struct C : public B, public A {};
#
# G++ will place the A base class of C at a nonzero offset; it should be placed at offset zero. G++ mistakenly believes that the A data member of B is already at offset zero.
# Names of template functions whose types involve typename or template template parameters can be mangled incorrectly.
#                template <typename Q>
#                void f(typename Q::X) {}
#
#                template <template <typename> class Q>
#                void f(typename Q<int>::X) {}
#
# Instantiations of these templates may be mangled incorrectly.
#
# It also warns psABI related changes. The known psABI changes at this point include:
# For SYSV/x86-64, when passing union with long double, it is changed to pass in memory as specified in psABI. For example:
#                union U {
#                  long double ld;
#                  int i;
#                };
#
# union U will always be passed in memory.


set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wctor-dtor-privacy") # (C++ and Objective-C++ only)
# Warn when a class seems unusable because all the constructors or destructors in that class are private, and it has neither friends nor public static member functions.

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wnoexcept") # (C++ and Objective-C++ only)
# Warn when a noexcept-expression evaluates to false because of a call to a function that does not have a non-throwing exception specification (i.e. ‘throw()’ or ‘noexcept’) but is known by the compiler to never throw an exception.

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wnon-virtual-dtor") # (C++ and Objective-C++ only)
# Warn when a class has virtual functions and accessible non-virtual destructor, in which case it would be possible but unsafe to delete an instance of a derived class through a pointer to the base class. This warning is also enabled if -Weffc++ is specified.

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wreorder") # (C++ and Objective-C++ only)
# Warn when the order of member initializers given in the code does not match the order in which they must be executed. For instance:
#           struct A {
#             int i;
#             int j;
#             A(): j (0), i (1) { }
#           };
#
# The compiler will rearrange the member initializers for ‘i’ and ‘j’ to match the declaration order of the members, emitting a warning to that effect. This warning is enabled by -Wall.
#
# The following -W... options are not affected by -Wall.

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Weffc++") # (C++ and Objective-C++ only)
# Warn about violations of the following style guidelines from Scott Meyers' Effective C++ book:
# Item 11: Define a copy constructor and an assignment operator for classes with dynamically allocated memory.
# Item 12: Prefer initialization to assignment in constructors.
# Item 14: Make destructors virtual in base classes.
# Item 15: Have operator= return a reference to *this.
# Item 23: Don't try to return a reference when you must return an object.

# Also warn about violations of the following style guidelines from Scott Meyers' More Effective C++ book:
# Item 6: Distinguish between prefix and postfix forms of increment and decrement operators.
# Item 7: Never overload &&, ||, or ,.

# When selecting this option, be aware that the standard library headers do not obey all of these guidelines; use ‘grep -v’ to filter out those warnings.

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wstrict-null-sentinel") # (C++ and Objective-C++ only)
# Warn also about the use of an uncasted NULL as sentinel. When compiling only with GCC this is a valid sentinel, as NULL is defined to __null. Although it is a null pointer constant not a null pointer, it is guaranteed to be of the same size as a pointer. But this use is not portable across different compilers.

## set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wno-non-template-friend") # (C++ and Objective-C++ only)
# Disable warnings when non-templatized friend functions are declared within a template. Since the advent of explicit template specification support in G++, if the name of the friend is an unqualified-id (i.e., ‘friend foo(int)’), the C++ language specification demands that the friend declare or define an ordinary, nontemplate function. (Section 14.5.3). Before G++ implemented explicit specification, unqualified-ids could be interpreted as a particular specialization of a templatized function. Because this non-conforming behavior is no longer the default behavior for G++, -Wnon-template-friend allows the compiler to check existing code for potential trouble spots and is on by default. This new compiler behavior can be turned off with -Wno-non-template-friend which keeps the conformant compiler code but disables the helpful warning.

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wold-style-cast") # (C++ and Objective-C++ only)
# Warn if an old-style (C-style) cast to a non-void type is used within a C++ program. The new-style casts (‘dynamic_cast’, ‘static_cast’, ‘reinterpret_cast’, and ‘const_cast’) are less vulnerable to unintended effects and much easier to search for.

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Woverloaded-virtual") # (C++ and Objective-C++ only)
# Warn when a function declaration hides virtual functions from a base class. For example, in:
#           struct A {
#             virtual void f();
#           };
#
#           struct B: public A {
#             void f(int);
#           };
#
# the A class version of f is hidden in B, and code like:
#           B* b;
#           b->f();
#
# will fail to compile.

## set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wno-pmf-conversions") # (C++ and Objective-C++ only)
# Disable the diagnostic for converting a bound pointer to member function to a plain pointer.

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wsign-promo") # (C++ and Objective-C++ only)
# Warn when overload resolution chooses a promotion from unsigned or enumerated type to a signed type, over a conversion to an unsigned type of the same size. Previous versions of G++ would try to preserve unsignedness, but the standard mandates the current behavior.
#           struct A {
#             operator int ();
#             A& operator = (int);
#           };
#
#           main ()
#           {
#             A a,b;
#             a = b;
#           }
#
# In this example, G++ will synthesize a default ‘A& operator = (const A&);’, while cfront will use the user-defined ‘operator =’.


#--------------------------------------------------------------------------------------------------
# Language Independent Options
#
# 3.7 Options to Control Diagnostic Messages Formatting
#--------------------------------------------------------------------------------------------------

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fmessage-length=0")
# Try to format error messages so that they fit on lines of about n characters. The default is 72 characters for g++ and 0 for the rest of the front ends supported by GCC. If n is zero, then no line-wrapping will be done; each error message will appear on a single line.

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fdiagnostics-show-location=once")
# Only meaningful in line-wrapping mode. Instructs the diagnostic messages reporter to emit once source location information; that is, in case the message is too long to fit on a single physical line and has to be wrapped, the source location won't be emitted (as prefix) again, over and over, in subsequent continuation lines. This is the default behavior.

## set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fdiagnostics-show-location=every-line")
# Only meaningful in line-wrapping mode. Instructs the diagnostic messages reporter to emit the same source location information (as prefix) for physical lines that result from the process of breaking a message which is too long to fit on a single line.

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fno-diagnostics-show-option")
# By default, each diagnostic emitted includes text which indicates the command line option that directly controls the diagnostic (if such an option is known to the diagnostic machinery). Specifying the -fno-diagnostics-show-option flag suppresses that behavior.

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wcoverage-mismatch")
# Warn if feedback profiles do not match when using the -fprofile-use option. If a source file was changed between -fprofile-gen and -fprofile-use, the files with the profile feedback can fail to match the source file and GCC can not use the profile feedback information. By default, this warning is enabled and is treated as an error. -Wno-coverage-mismatch can be used to disable the warning or -Wno-error=coverage-mismatch can be used to disable the error. Disable the error for this warning can result in poorly optimized code, so disabling the error is useful only in the case of very minor changes such as bug fixes to an existing code-base. Completely disabling the warning is not recommended.


#--------------------------------------------------------------------------------------------------
# Warning Options
#
# 3.8 Options to Request or Suppress Warnings
#--------------------------------------------------------------------------------------------------

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fsyntax-only")
# Check the code for syntax errors, but don't do anything beyond that.

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fmax-errors=0")
# Limits the maximum number of error messages to n, at which point GCC bails out rather than attempting to continue processing the source code. If n is 0 (the default), there is no limit on the number of error messages produced. If -Wfatal-errors is also specified, then -Wfatal-errors takes precedence over this option.

## set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -w")
# Inhibit all warning messages.

## set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Werror")
# Make all warnings into errors.

## set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Werror=")
# Make the specified warning into an error. The specifier for a warning is appended, for example -Werror=switch turns the warnings controlled by -Wswitch into errors. This switch takes a negative form, to be used to negate -Werror for specific warnings, for example -Wno-error=switch makes -Wswitch warnings not be errors, even when -Werror is in effect.

# The warning message for each controllable warning includes the option which controls the warning. That option can then be used with -Werror= and -Wno-error= as described above. (Printing of the option in the warning message can be disabled using the -fno-diagnostics-show-option flag.)

# Note that specifying -Werror=foo automatically implies -Wfoo. However, -Wno-error=foo does not imply anything.

## set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wfatal-errors")
# This option causes the compiler to abort compilation on the first error occurred rather than trying to keep going and printing further error messages.
#
# You can request many specific warnings with options beginning ‘-W’, for example -Wimplicit to request warnings on implicit declarations. Each of these specific warning options also has a negative form beginning ‘-Wno-’ to turn off warnings; for example, -Wno-implicit. This manual lists only one of the two forms, whichever is not the default. For further, language-specific options also refer to C++ Dialect Options and Objective-C and Objective-C++ Dialect Options.
#
# When an unrecognized warning option is requested (e.g., -Wunknown-warning), GCC will emit a diagnostic stating that the option is not recognized. However, if the -Wno- form is used, the behavior is slightly different: No diagnostic will be produced for -Wno-unknown-warning unless other diagnostics are being produced. This allows the use of new -Wno- options with old compilers, but if something goes wrong, the compiler will warn that an unrecognized option was used.

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -pedantic")
# Issue all the warnings demanded by strict ISO C and ISO C++; reject all programs that use forbidden extensions, and some other programs that do not follow ISO C and ISO C++. For ISO C, follows the version of the ISO C standard specified by any -std option used.
#
# Valid ISO C and ISO C++ programs should compile properly with or without this option (though a rare few will require -ansi or a -std option specifying the required version of ISO C). However, without this option, certain GNU extensions and traditional C and C++ features are supported as well. With this option, they are rejected.
#
# -pedantic does not cause warning messages for use of the alternate keywords whose names begin and end with ‘__’. Pedantic warnings are also disabled in the expression that follows __extension__. However, only system header files should use these escape routes; application programs should avoid them. See Alternate Keywords.
#
# Some users try to use -pedantic to check programs for strict ISO C conformance. They soon find that it does not do quite what they want: it finds some non-ISO practices, but not all—only those for which ISO C requires a diagnostic, and some others for which diagnostics have been added.
#
# A feature to report any failure to conform to ISO C might be useful in some instances, but would require considerable additional work and would be quite different from -pedantic. We don't have plans to support such a feature in the near future.
#
# Where the standard specified with -std represents a GNU extended dialect of C, such as ‘gnu90’ or ‘gnu99’, there is a corresponding base standard, the version of ISO C on which the GNU extended dialect is based. Warnings from -pedantic are given where they are required by the base standard. (It would not make sense for such warnings to be given only for features not in the specified GNU C dialect, since by definition the GNU dialects of C include all features the compiler supports with the given option, and there would be nothing to warn about.)

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -pedantic-errors")
# Like -pedantic, except that errors are produced rather than warnings.

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall")
# This enables all the warnings about constructions that some users consider questionable, and that are easy to avoid (or modify to prevent the warning), even in conjunction with macros. This also enables some language-specific warnings described in C++ Dialect Options and Objective-C and Objective-C++ Dialect Options.
#
# -Wall turns on the following warning flags:
#           -Waddress
#           -Warray-bounds (only with -O2)
#           -Wc++0x-compat
#           -Wchar-subscripts
#           -Wenum-compare (in C/Objc; this is on by default in C++)
#           -Wimplicit-int (C and Objective-C only)
#           -Wimplicit-function-declaration (C and Objective-C only)
#           -Wcomment
#           -Wformat
#           -Wmain (only for C/ObjC and unless -ffreestanding)
#           -Wmissing-braces
#           -Wnonnull
#           -Wparentheses
#           -Wpointer-sign
#           -Wreorder
#           -Wreturn-type
#           -Wsequence-point
#           -Wsign-compare (only in C++)
#           -Wstrict-aliasing
#           -Wstrict-overflow=1
#           -Wswitch
#           -Wtrigraphs
#           -Wuninitialized
#           -Wunknown-pragmas
#           -Wunused-function
#           -Wunused-label
#           -Wunused-value
#           -Wunused-variable
#           -Wvolatile-register-var
#
#
# Note that some warning flags are not implied by -Wall. Some of them warn about constructions that users generally do not consider questionable, but which occasionally you might wish to check for; others warn about constructions that are necessary or hard to avoid in some cases, and there is no simple way to modify the code to suppress the warning. Some of them are enabled by -Wextra but many of them must be enabled individually.

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wextra")
# This enables some extra warning flags that are not enabled by -Wall. (This option used to be called -W. The older name is still supported, but the newer name is more descriptive.)
#           -Wclobbered
#           -Wempty-body
#           -Wignored-qualifiers
#           -Wmissing-field-initializers
#           -Wmissing-parameter-type (C only)
#           -Wold-style-declaration (C only)
#           -Woverride-init
#           -Wsign-compare
#           -Wtype-limits
#           -Wuninitialized
#           -Wunused-parameter (only with -Wunused or -Wall)
#           -Wunused-but-set-parameter (only with -Wunused or -Wall)
#
#
# The option -Wextra also prints warning messages for the following cases:
# A pointer is compared against integer zero with ‘<’, ‘<=’, ‘>’, or ‘>=’.
# (C++ only) An enumerator and a non-enumerator both appear in a conditional expression.
# (C++ only) Ambiguous virtual bases.
# (C++ only) Subscripting an array which has been declared ‘register’.
# (C++ only) Taking the address of a variable which has been declared ‘register’.
# (C++ only) A base class is not initialized in a derived class' copy constructor.

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wchar-subscripts")
# Warn if an array subscript has type char. This is a common cause of error, as programmers often forget that this type is signed on some machines. This warning is enabled by -Wall.

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wcomment")
# Warn whenever a comment-start sequence ‘/*’ appears in a ‘/*’ comment, or whenever a Backslash-Newline appears in a ‘//’ comment. This warning is enabled by -Wall.

## set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wno-cpp")
# (C, Objective-C, C++, Objective-C++ and Fortran only)
#
# Suppress warning messages emitted by #warning directives.

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wdouble-promotion") # (C, C++, Objective-C and Objective-C++ only)
# Give a warning when a value of type float is implicitly promoted to double. CPUs with a 32-bit “single-precision” floating-point unit implement float in hardware, but emulate double in software. On such a machine, doing computations using double values is much more expensive because of the overhead required for software emulation.
#
# It is easy to accidentally do computations with double because floating-point literals are implicitly of type double. For example, in:
#           float area(float radius)
#           {
#              return 3.14159 * radius * radius;
#           }
#
# the compiler will perform the entire computation with double because the floating-point literal is a double.

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wformat")
# Check calls to printf and scanf, etc., to make sure that the arguments supplied have types appropriate to the format string specified, and that the conversions specified in the format string make sense. This includes standard functions, and others specified by format attributes (see Function Attributes), in the printf, scanf, strftime and strfmon (an X/Open extension, not in the C standard) families (or other target-specific families). Which functions are checked without format attributes having been specified depends on the standard version selected, and such checks of functions without the attribute specified are disabled by -ffreestanding or -fno-builtin.
#
# The formats are checked against the format features supported by GNU libc version 2.2. These include all ISO C90 and C99 features, as well as features from the Single Unix Specification and some BSD and GNU extensions. Other library implementations may not support all these features; GCC does not support warning about features that go beyond a particular library's limitations. However, if -pedantic is used with -Wformat, warnings will be given about format features not in the selected standard version (but not for strfmon formats, since those are not in any version of the C standard). See Options Controlling C Dialect.
#
# Since -Wformat also checks for null format arguments for several functions, -Wformat also implies -Wnonnull.
#
# -Wformat is included in -Wall. For more control over some aspects of format checking, the options -Wformat-y2k, -Wno-format-extra-args, -Wno-format-zero-length, -Wformat-nonliteral, -Wformat-security, and -Wformat=2 are available, but are not included in -Wall.

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wformat-y2k")
# If -Wformat is specified, also warn about strftime formats which may yield only a two-digit year.

## set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wno-format-contains-nul")
# If -Wformat is specified, do not warn about format strings that contain NUL bytes.

## set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wno-format-extra-args")
# If -Wformat is specified, do not warn about excess arguments to a printf or scanf format function. The C standard specifies that such arguments are ignored.
#
# Where the unused arguments lie between used arguments that are specified with ‘$’ operand number specifications, normally warnings are still given, since the implementation could not know what type to pass to va_arg to skip the unused arguments. However, in the case of scanf formats, this option will suppress the warning if the unused arguments are all pointers, since the Single Unix Specification says that such unused arguments are allowed.

## set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wno-format-zero-length") # (C and Objective-C only)
# If -Wformat is specified, do not warn about zero-length formats. The C standard specifies that zero-length formats are allowed.

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wformat-nonliteral")
# If -Wformat is specified, also warn if the format string is not a string literal and so cannot be checked, unless the format function takes its format arguments as a va_list.

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wformat-security")
# If -Wformat is specified, also warn about uses of format functions that represent possible security problems. At present, this warns about calls to printf and scanf functions where the format string is not a string literal and there are no format arguments, as in printf (foo);. This may be a security hole if the format string came from untrusted input and contains ‘%n’. (This is currently a subset of what -Wformat-nonliteral warns about, but in future warnings may be added to -Wformat-security that are not included in -Wformat-nonliteral.)

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wformat=2")
# Enable -Wformat plus format checks not included in -Wformat. Currently equivalent to ‘-Wformat -Wformat-nonliteral -Wformat-security -Wformat-y2k’.

## set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wnonnull") # (C and Objective-C only)
# Warn about passing a null pointer for arguments marked as requiring a non-null value by the nonnull function attribute.
#
# -Wnonnull is included in -Wall and -Wformat. It can be disabled with the -Wno-nonnull option.

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Winit-self") # (C, C++, Objective-C and Objective-C++ only)
# Warn about uninitialized variables which are initialized with themselves. Note this option can only be used with the -Wuninitialized option.
#
# For example, GCC will warn about i being uninitialized in the following snippet only when -Winit-self has been specified:
#           int f()
#           {
#             int i = i;
#             return i;
#           }
#

## set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wimplicit-int") # (C and Objective-C only)
# Warn when a declaration does not specify a type. This warning is enabled by -Wall.

## set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wimplicit-function-declaration") # (C and Objective-C only)
# Give a warning whenever a function is used before being declared. In C99 mode (-std=c99 or -std=gnu99), this warning is enabled by default and it is made into an error by -pedantic-errors. This warning is also enabled by -Wall.

## set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wimplicit") # (C and Objective-C only)
# Same as -Wimplicit-int and -Wimplicit-function-declaration. This warning is enabled by -Wall.

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wignored-qualifiers") # (C and C++ only)
# Warn if the return type of a function has a type qualifier such as const. For ISO C such a type qualifier has no effect, since the value returned by a function is not an lvalue. For C++, the warning is only emitted for scalar types or void. ISO C prohibits qualified void return types on function definitions, so such return types always receive a warning even without this option.
#
# This warning is also enabled by -Wextra.

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wmain")
# Warn if the type of ‘main’ is suspicious. ‘main’ should be a function with external linkage, returning int, taking either zero arguments, two, or three arguments of appropriate types. This warning is enabled by default in C++ and is enabled by either -Wall or -pedantic.

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wmissing-braces")
# Warn if an aggregate or union initializer is not fully bracketed. In the following example, the initializer for ‘a’ is not fully bracketed, but that for ‘b’ is fully bracketed.
          # int a[2][2] = { 0, 1, 2, 3 };
          # int b[2][2] = { { 0, 1 }, { 2, 3 } };
#
# This warning is enabled by -Wall.

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wmissing-include-dirs") # (C, C++, Objective-C and Objective-C++ only)
# Warn if a user-supplied include directory does not exist.

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wparentheses")
# Warn if parentheses are omitted in certain contexts, such as when there is an assignment in a context where a truth value is expected, or when operators are nested whose precedence people often get confused about.
#
# Also warn if a comparison like ‘x<=y<=z’ appears; this is equivalent to ‘(x<=y ? 1 : 0) <= z’, which is a different interpretation from that of ordinary mathematical notation.
#
# Also warn about constructions where there may be confusion to which if statement an else branch belongs. Here is an example of such a case:
#           {
#             if (a)
#               if (b)
#                 foo ();
#             else
#               bar ();
#           }
#
# In C/C++, every else branch belongs to the innermost possible if statement, which in this example is if (b). This is often not what the programmer expected, as illustrated in the above example by indentation the programmer chose. When there is the potential for this confusion, GCC will issue a warning when this flag is specified. To eliminate the warning, add explicit braces around the innermost if statement so there is no way the else could belong to the enclosing if. The resulting code would look like this:
#           {
#             if (a)
#               {
#                 if (b)
#                   foo ();
#                 else
#                   bar ();
#               }
#           }
#
# Also warn for dangerous uses of the ?: with omitted middle operand GNU extension. When the condition in the ?: operator is a boolean expression the omitted value will be always 1. Often the user expects it to be a value computed inside the conditional expression instead.
#
# This warning is enabled by -Wall.

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wsequence-point")
# Warn about code that may have undefined semantics because of violations of sequence point rules in the C and C++ standards.
#
# The C and C++ standards defines the order in which expressions in a C/C++ program are evaluated in terms of sequence points, which represent a partial ordering between the execution of parts of the program: those executed before the sequence point, and those executed after it. These occur after the evaluation of a full expression (one which is not part of a larger expression), after the evaluation of the first operand of a &&, ||, ? : or , (comma) operator, before a function is called (but after the evaluation of its arguments and the expression denoting the called function), and in certain other places. Other than as expressed by the sequence point rules, the order of evaluation of subexpressions of an expression is not specified. All these rules describe only a partial order rather than a total order, since, for example, if two functions are called within one expression with no sequence point between them, the order in which the functions are called is not specified. However, the standards committee have ruled that function calls do not overlap.
#
# It is not specified when between sequence points modifications to the values of objects take effect. Programs whose behavior depends on this have undefined behavior; the C and C++ standards specify that “Between the previous and next sequence point an object shall have its stored value modified at most once by the evaluation of an expression. Furthermore, the prior value shall be read only to determine the value to be stored.”. If a program breaks these rules, the results on any particular implementation are entirely unpredictable.
#
# Examples of code with undefined behavior are a = a++;, a[n] = b[n++] and a[i++] = i;. Some more complicated cases are not diagnosed by this option, and it may give an occasional false positive result, but in general it has been found fairly effective at detecting this sort of problem in programs.
#
# The standard is worded confusingly, therefore there is some debate over the precise meaning of the sequence point rules in subtle cases. Links to discussions of the problem, including proposed formal definitions, may be found on the GCC readings page, at http://gcc.gnu.org/readings.html.
#
# This warning is enabled by -Wall for C and C++.

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wreturn-type")
# Warn whenever a function is defined with a return-type that defaults to int. Also warn about any return statement with no return-value in a function whose return-type is not void (falling off the end of the function body is considered returning without a value), and about a return statement with an expression in a function whose return-type is void.
#
# For C++, a function without return type always produces a diagnostic message, even when -Wno-return-type is specified. The only exceptions are ‘main’ and functions defined in system headers.
#
# This warning is enabled by -Wall.

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wswitch")
# Warn whenever a switch statement has an index of enumerated type and lacks a case for one or more of the named codes of that enumeration. (The presence of a default label prevents this warning.) case labels outside the enumeration range also provoke warnings when this option is used (even if there is a default label). This warning is enabled by -Wall.

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wswitch-default")
# Warn whenever a switch statement does not have a default case.

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wswitch-enum")
# Warn whenever a switch statement has an index of enumerated type and lacks a case for one or more of the named codes of that enumeration. case labels outside the enumeration range also provoke warnings when this option is used. The only difference between -Wswitch and this option is that this option gives a warning about an omitted enumeration code even if there is a default label.

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wsync-nand") # (C and C++ only)
# Warn when __sync_fetch_and_nand and __sync_nand_and_fetch built-in functions are used. These functions changed semantics in GCC 4.4.

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wtrigraphs")
# Warn if any trigraphs are encountered that might change the meaning of the program (trigraphs within comments are not warned about). This warning is enabled by -Wall.

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wunused-but-set-parameter")
# Warn whenever a function parameter is assigned to, but otherwise unused (aside from its declaration).
#
# To suppress this warning use the ‘unused’ attribute (see Variable Attributes).
#
# This warning is also enabled by -Wunused together with -Wextra.

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wunused-but-set-variable")
# Warn whenever a local variable is assigned to, but otherwise unused (aside from its declaration). This warning is enabled by -Wall.
#
# To suppress this warning use the ‘unused’ attribute (see Variable Attributes).
#
# This warning is also enabled by -Wunused, which is enabled by -Wall.

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wunused-function")
# Warn whenever a static function is declared but not defined or a non-inline static function is unused. This warning is enabled by -Wall.

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wunused-label")
# Warn whenever a label is declared but not used. This warning is enabled by -Wall.
#
# To suppress this warning use the ‘unused’ attribute (see Variable Attributes).

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wunused-parameter")
# Warn whenever a function parameter is unused aside from its declaration.
#
# To suppress this warning use the ‘unused’ attribute (see Variable Attributes).

## set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wno-unused-result")
# Do not warn if a caller of a function marked with attribute warn_unused_result (see Variable Attributes) does not use its return value. The default is -Wunused-result.

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wunused-variable")
# Warn whenever a local variable or non-constant static variable is unused aside from its declaration. This warning is enabled by -Wall.
#
# To suppress this warning use the ‘unused’ attribute (see Variable Attributes).

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wunused-value")
# Warn whenever a statement computes a result that is explicitly not used. To suppress this warning cast the unused expression to ‘void’. This includes an expression-statement or the left-hand side of a comma expression that contains no side effects. For example, an expression such as ‘x[i,j]’ will cause a warning, while ‘x[(void)i,j]’ will not.
#
# This warning is enabled by -Wall.

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wunused")
# All the above -Wunused options combined.
#
# In order to get a warning about an unused function parameter, you must either specify ‘-Wextra -Wunused’ (note that ‘-Wall’ implies ‘-Wunused’), or separately specify -Wunused-parameter.

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wuninitialized")
# Warn if an automatic variable is used without first being initialized or if a variable may be clobbered by a setjmp call. In C++, warn if a non-static reference or non-static ‘const’ member appears in a class without constructors.
#
# If you want to warn about code which uses the uninitialized value of the variable in its own initializer, use the -Winit-self option.
#
# These warnings occur for individual uninitialized or clobbered elements of structure, union or array variables as well as for variables which are uninitialized or clobbered as a whole. They do not occur for variables or elements declared volatile. Because these warnings depend on optimization, the exact variables or elements for which there are warnings will depend on the precise optimization options and version of GCC used.
#
# Note that there may be no warning about a variable that is used only to compute a value that itself is never used, because such computations may be deleted by data flow analysis before the warnings are printed.
#
# These warnings are made optional because GCC is not smart enough to see all the reasons why the code might be correct despite appearing to have an error. Here is one example of how this can happen:
#           {
#             int x;
#             switch (y)
#               {
#               case 1: x = 1;
#                 break;
#               case 2: x = 4;
#                 break;
#               case 3: x = 5;
#               }
#             foo (x);
#           }
#
# If the value of y is always 1, 2 or 3, then x is always initialized, but GCC doesn't know this. Here is another common case:
#           {
#             int save_y;
#             if (change_y) save_y = y, y = new_y;
#             ...
#             if (change_y) y = save_y;
#           }
#
# This has no bug because save_y is used only if it is set.
#
# This option also warns when a non-volatile automatic variable might be changed by a call to longjmp. These warnings as well are possible only in optimizing compilation.
#
# The compiler sees only the calls to setjmp. It cannot know where longjmp will be called; in fact, a signal handler could call it at any point in the code. As a result, you may get a warning even when there is in fact no problem because longjmp cannot in fact be called at the place which would cause a problem.
#
# Some spurious warnings can be avoided if you declare all the functions you use that never return as noreturn. See Function Attributes.
#
# This warning is enabled by -Wall or -Wextra.

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wunknown-pragmas")
# Warn when a #pragma directive is encountered which is not understood by GCC. If this command line option is used, warnings will even be issued for unknown pragmas in system header files. This is not the case if the warnings were only enabled by the -Wall command line option.

## set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wno-pragmas")
# Do not warn about misuses of pragmas, such as incorrect parameters, invalid syntax, or conflicts between pragmas. See also ‘-Wunknown-pragmas’.

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wstrict-aliasing")
# This option is only active when -fstrict-aliasing is active. It warns about code which might break the strict aliasing rules that the compiler is using for optimization. The warning does not catch all cases, but does attempt to catch the more common pitfalls. It is included in -Wall. It is equivalent to -Wstrict-aliasing=3

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wstrict-aliasing=1")
# This option is only active when -fstrict-aliasing is active. It warns about code which might break the strict aliasing rules that the compiler is using for optimization. Higher levels correspond to higher accuracy (fewer false positives). Higher levels also correspond to more effort, similar to the way -O works. -Wstrict-aliasing is equivalent to -Wstrict-aliasing=n, with n=3.
#
# Level 1: Most aggressive, quick, least accurate. Possibly useful when higher levels do not warn but -fstrict-aliasing still breaks the code, as it has very few false negatives. However, it has many false positives. Warns for all pointer conversions between possibly incompatible types, even if never dereferenced. Runs in the frontend only.
#
# Level 2: Aggressive, quick, not too precise. May still have many false positives (not as many as level 1 though), and few false negatives (but possibly more than level 1). Unlike level 1, it only warns when an address is taken. Warns about incomplete types. Runs in the frontend only.
#
# Level 3 (default for -Wstrict-aliasing): Should have very few false positives and few false negatives. Slightly slower than levels 1 or 2 when optimization is enabled. Takes care of the common pun+dereference pattern in the frontend: *(int*)&some_float. If optimization is enabled, it also runs in the backend, where it deals with multiple statement cases using flow-sensitive points-to information. Only warns when the converted pointer is dereferenced. Does not warn about incomplete types.

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wstrict-overflow")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wstrict-overflow=5")
# This option is only active when -fstrict-overflow is active. It warns about cases where the compiler optimizes based on the assumption that signed overflow does not occur. Note that it does not warn about all cases where the code might overflow: it only warns about cases where the compiler implements some optimization. Thus this warning depends on the optimization level.
#
# An optimization which assumes that signed overflow does not occur is perfectly safe if the values of the variables involved are such that overflow never does, in fact, occur. Therefore this warning can easily give a false positive: a warning about code which is not actually a problem. To help focus on important issues, several warning levels are defined. No warnings are issued for the use of undefined signed overflow when estimating how many iterations a loop will require, in particular when determining whether a loop will be executed at all.
# -Wstrict-overflow=1
# Warn about cases which are both questionable and easy to avoid. For example: x + 1 > x; with -fstrict-overflow, the compiler will simplify this to 1. This level of -Wstrict-overflow is enabled by -Wall; higher levels are not, and must be explicitly requested.
# -Wstrict-overflow=2
# Also warn about other cases where a comparison is simplified to a constant. For example: abs (x) >= 0. This can only be simplified when -fstrict-overflow is in effect, because abs (INT_MIN) overflows to INT_MIN, which is less than zero. -Wstrict-overflow (with no level) is the same as -Wstrict-overflow=2.
# -Wstrict-overflow=3
# Also warn about other cases where a comparison is simplified. For example: x + 1 > 1 will be simplified to x > 0.
# -Wstrict-overflow=4
# Also warn about other simplifications not covered by the above cases. For example: (x * 10) / 5 will be simplified to x * 2.
# -Wstrict-overflow=5
# Also warn about cases where the compiler reduces the magnitude of a constant involved in a comparison. For example: x + 2 > y will be simplified to x + 1 >= y. This is reported only at the highest warning level because this simplification applies to many comparisons, so this warning level will give a very large number of false positives.
#

## set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wsuggest-attribute=[pure|const|noreturn]")
# Warn for cases where adding an attribute may be beneficial. The attributes currently supported are listed below.
# -Wsuggest-attribute=pure
# -Wsuggest-attribute=const
# -Wsuggest-attribute=noreturn
# Warn about functions which might be candidates for attributes pure, const or noreturn. The compiler only warns for functions visible in other compilation units or (in the case of pure and const) if it cannot prove that the function returns normally. A function returns normally if it doesn't contain an infinite loop nor returns abnormally by throwing, calling abort() or trapping. This analysis requires option -fipa-pure-const, which is enabled by default at -O and higher. Higher optimization levels improve the accuracy of the analysis.
#

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Warray-bounds")
# This option is only active when -ftree-vrp is active (default for -O2 and above). It warns about subscripts to arrays that are always out of bounds. This warning is enabled by -Wall.

## set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wno-div-by-zero")
# Do not warn about compile-time integer division by zero. Floating point division by zero is not warned about, as it can be a legitimate way of obtaining infinities and NaNs.

## set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wsystem-headers")
# Print warning messages for constructs found in system header files. Warnings from system headers are normally suppressed, on the assumption that they usually do not indicate real problems and would only make the compiler output harder to read. Using this command line option tells GCC to emit warnings from system headers as if they occurred in user code. However, note that using -Wall in conjunction with this option will not warn about unknown pragmas in system headers—for that, -Wunknown-pragmas must also be used.

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wtrampolines")
# Warn about trampolines generated for pointers to nested functions.
#
# A trampoline is a small piece of data or code that is created at run time on the stack when the address of a nested function is taken, and is used to call the nested function indirectly. For some targets, it is made up of data only and thus requires no special treatment. But, for most targets, it is made up of code and thus requires the stack to be made executable in order for the program to work properly.

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wfloat-equal")
# Warn if floating point values are used in equality comparisons.
#
# The idea behind this is that sometimes it is convenient (for the programmer) to consider floating-point values as approximations to infinitely precise real numbers. If you are doing this, then you need to compute (by analyzing the code, or in some other way) the maximum or likely maximum error that the computation introduces, and allow for it when performing comparisons (and when producing output, but that's a different problem). In particular, instead of testing for equality, you would check to see whether the two values have ranges that overlap; and this is done with the relational operators, so equality comparisons are probably mistaken.

## set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wtraditional") # (C and Objective-C only)
# Warn about certain constructs that behave differently in traditional and ISO C. Also warn about ISO C constructs that have no traditional C equivalent, and/or problematic constructs which should be avoided.
# Macro parameters that appear within string literals in the macro body. In traditional C macro replacement takes place within string literals, but does not in ISO C.
# In traditional C, some preprocessor directives did not exist. Traditional preprocessors would only consider a line to be a directive if the ‘#’ appeared in column 1 on the line. Therefore -Wtraditional warns about directives that traditional C understands but would ignore because the ‘#’ does not appear as the first character on the line. It also suggests you hide directives like ‘#pragma’ not understood by traditional C by indenting them. Some traditional implementations would not recognize ‘#elif’, so it suggests avoiding it altogether.
# A function-like macro that appears without arguments.
# The unary plus operator.
# The ‘U’ integer constant suffix, or the ‘F’ or ‘L’ floating point constant suffixes. (Traditional C does support the ‘L’ suffix on integer constants.) Note, these suffixes appear in macros defined in the system headers of most modern systems, e.g. the ‘_MIN’/‘_MAX’ macros in <limits.h>. Use of these macros in user code might normally lead to spurious warnings, however GCC's integrated preprocessor has enough context to avoid warning in these cases.
# A function declared external in one block and then used after the end of the block.
# A switch statement has an operand of type long.
# A non-static function declaration follows a static one. This construct is not accepted by some traditional C compilers.
# The ISO type of an integer constant has a different width or signedness from its traditional type. This warning is only issued if the base of the constant is ten. I.e. hexadecimal or octal values, which typically represent bit patterns, are not warned about.
# Usage of ISO string concatenation is detected.
# Initialization of automatic aggregates.
# Identifier conflicts with labels. Traditional C lacks a separate namespace for labels.
# Initialization of unions. If the initializer is zero, the warning is omitted. This is done under the assumption that the zero initializer in user code appears conditioned on e.g. __STDC__ to avoid missing initializer warnings and relies on default initialization to zero in the traditional C case.
# Conversions by prototypes between fixed/floating point values and vice versa. The absence of these prototypes when compiling with traditional C would cause serious problems. This is a subset of the possible conversion warnings, for the full set use -Wtraditional-conversion.
# Use of ISO C style function definitions. This warning intentionally is not issued for prototype declarations or variadic functions because these ISO C features will appear in your code when using libiberty's traditional C compatibility macros, PARAMS and VPARAMS. This warning is also bypassed for nested functions because that feature is already a GCC extension and thus not relevant to traditional C compatibility.
#

## set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wtraditional-conversion") # (C and Objective-C only)
# Warn if a prototype causes a type conversion that is different from what would happen to the same argument in the absence of a prototype. This includes conversions of fixed point to floating and vice versa, and conversions changing the width or signedness of a fixed point argument except when the same as the default promotion.

## set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wdeclaration-after-statement") # (C and Objective-C only)
# Warn when a declaration is found after a statement in a block. This construct, known from C++, was introduced with ISO C99 and is by default allowed in GCC. It is not supported by ISO C90 and was not supported by GCC versions before GCC 3.0. See Mixed Declarations.

### set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wundef")
# Warn if an undefined identifier is evaluated in an ‘#if’ directive.

## set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wno-endif-labels")
# Do not warn whenever an ‘#else’ or an ‘#endif’ are followed by text.

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wshadow")
# Warn whenever a local variable or type declaration shadows another variable, parameter, type, or class member (in C++), or whenever a built-in function is shadowed. Note that in C++, the compiler will not warn if a local variable shadows a struct/class/enum, but will warn if it shadows an explicit typedef.

## set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wlarger-than=len")
# Warn whenever an object of larger than len bytes is defined.

## set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wframe-larger-than=len")
# Warn if the size of a function frame is larger than len bytes. The computation done to determine the stack frame size is approximate and not conservative. The actual requirements may be somewhat greater than len even if you do not get a warning. In addition, any space allocated via alloca, variable-length arrays, or related constructs is not included by the compiler when determining whether or not to issue a warning.

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wunsafe-loop-optimizations")
# Warn if the loop cannot be optimized because the compiler could not assume anything on the bounds of the loop indices. With -funsafe-loop-optimizations warn if the compiler made such assumptions.

## set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wno-pedantic-ms-format") # (MinGW targets only)
# Disables the warnings about non-ISO printf / scanf format width specifiers I32, I64, and I used on Windows targets depending on the MS runtime, when you are using the options -Wformat and -pedantic without gnu-extensions.

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wpointer-arith")
# Warn about anything that depends on the “size of” a function type or of void. GNU C assigns these types a size of 1, for convenience in calculations with void * pointers and pointers to functions. In C++, warn also when an arithmetic operation involves NULL. This warning is also enabled by -pedantic.

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wtype-limits")
# Warn if a comparison is always true or always false due to the limited range of the data type, but do not warn for constant expressions. For example, warn if an unsigned variable is compared against zero with ‘<’ or ‘>=’. This warning is also enabled by -Wextra.

## set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wbad-function-cast") # (C and Objective-C only)
# Warn whenever a function call is cast to a non-matching type. For example, warn if int malloc() is cast to anything *.

## set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wc++-compat") # (C and Objective-C only)
# Warn about ISO C constructs that are outside of the common subset of ISO C and ISO C++, e.g. request for implicit conversion from void * to a pointer to non-void type.

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wc++0x-compat") # (C++ and Objective-C++ only)
# Warn about C++ constructs whose meaning differs between ISO C++ 1998 and ISO C++ 200x, e.g., identifiers in ISO C++ 1998 that will become keywords in ISO C++ 200x. This warning is enabled by -Wall.

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wcast-qual")
# Warn whenever a pointer is cast so as to remove a type qualifier from the target type. For example, warn if a const char * is cast to an ordinary char *.
#
# Also warn when making a cast which introduces a type qualifier in an unsafe way. For example, casting char ** to const char ** is unsafe, as in this example:
#             /* p is char ** value.  */
#             const char **q = (const char **) p;
#             /* Assignment of readonly string to const char * is OK.  */
#             *q = "string";
#             /* Now char** pointer points to read-only memory.  */
#             **p = 'b';

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wcast-align")
# Warn whenever a pointer is cast such that the required alignment of the target is increased. For example, warn if a char * is cast to an int * on machines where integers can only be accessed at two- or four-byte boundaries.

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wwrite-strings")
# When compiling C, give string constants the type const char[length] so that copying the address of one into a non-const char * pointer will get a warning. These warnings will help you find at compile time code that can try to write into a string constant, but only if you have been very careful about using const in declarations and prototypes. Otherwise, it will just be a nuisance. This is why we did not make -Wall request these warnings.
#
# When compiling C++, warn about the deprecated conversion from string literals to char *. This warning is enabled by default for C++ programs.

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wclobbered")
# Warn for variables that might be changed by ‘longjmp’ or ‘vfork’. This warning is also enabled by -Wextra.

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wconversion")
# Warn for implicit conversions that may alter a value. This includes conversions between real and integer, like abs (x) when x is double; conversions between signed and unsigned, like unsigned ui = -1; and conversions to smaller types, like sqrtf (M_PI). Do not warn for explicit casts like abs ((int) x) and ui = (unsigned) -1, or if the value is not changed by the conversion like in abs (2.0). Warnings about conversions between signed and unsigned integers can be disabled by using -Wno-sign-conversion.
#
# For C++, also warn for confusing overload resolution for user-defined conversions; and conversions that will never use a type conversion operator: conversions to void, the same type, a base class or a reference to them. Warnings about conversions between signed and unsigned integers are disabled by default in C++ unless -Wsign-conversion is explicitly enabled.

## set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wno-conversion-null") # (C++ and Objective-C++ only)
# Do not warn for conversions between NULL and non-pointer types. -Wconversion-null is enabled by default.

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wempty-body")
# Warn if an empty body occurs in an ‘if’, ‘else’ or ‘do while’ statement. This warning is also enabled by -Wextra.

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wenum-compare")
# Warn about a comparison between values of different enum types. In C++ this warning is enabled by default. In C this warning is enabled by -Wall.

## set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wjump-misses-init") # (C, Objective-C only)
# Warn if a goto statement or a switch statement jumps forward across the initialization of a variable, or jumps backward to a label after the variable has been initialized. This only warns about variables which are initialized when they are declared. This warning is only supported for C and Objective C; in C++ this sort of branch is an error in any case.
#
# -Wjump-misses-init is included in -Wc++-compat. It can be disabled with the -Wno-jump-misses-init option.

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wsign-compare")
# Warn when a comparison between signed and unsigned values could produce an incorrect result when the signed value is converted to unsigned. This warning is also enabled by -Wextra; to get the other warnings of -Wextra without this warning, use ‘-Wextra -Wno-sign-compare’.

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wsign-conversion")
# Warn for implicit conversions that may change the sign of an integer value, like assigning a signed integer expression to an unsigned integer variable. An explicit cast silences the warning. In C, this option is enabled also by -Wconversion.

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Waddress")
# Warn about suspicious uses of memory addresses. These include using the address of a function in a conditional expression, such as void func(void); if (func), and comparisons against the memory address of a string literal, such as if (x == "abc"). Such uses typically indicate a programmer error: the address of a function always evaluates to true, so their use in a conditional usually indicate that the programmer forgot the parentheses in a function call; and comparisons against string literals result in unspecified behavior and are not portable in C, so they usually indicate that the programmer intended to use strcmp. This warning is enabled by -Wall.

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wlogical-op")
# Warn about suspicious uses of logical operators in expressions. This includes using logical operators in contexts where a bit-wise operator is likely to be expected.

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Waggregate-return")
# Warn if any functions that return structures or unions are defined or called. (In languages where you can return an array, this also elicits a warning.)

## set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wno-attributes")
# Do not warn if an unexpected __attribute__ is used, such as unrecognized attributes, function attributes applied to variables, etc. This will not stop errors for incorrect use of supported attributes.

## set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wno-builtin-macro-redefined")
# Do not warn if certain built-in macros are redefined. This suppresses warnings for redefinition of __TIMESTAMP__, __TIME__, __DATE__, __FILE__, and __BASE_FILE__.

# set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wstrict-prototypes") # (C and Objective-C only)
# Warn if a function is declared or defined without specifying the argument types. (An old-style function definition is permitted without a warning if preceded by a declaration which specifies the argument types.)

## set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wold-style-declaration") # (C and Objective-C only)
# Warn for obsolescent usages, according to the C Standard, in a declaration. For example, warn if storage-class specifiers like static are not the first things in a declaration. This warning is also enabled by -Wextra.

## set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wold-style-definition") # (C and Objective-C only)
# Warn if an old-style function definition is used. A warning is given even if there is a previous prototype.

## set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wmissing-parameter-type") # (C and Objective-C only)
# A function parameter is declared without a type specifier in K&R-style functions:
#           void foo(bar) { }
#
# This warning is also enabled by -Wextra.

## set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wmissing-prototypes") # (C and Objective-C only)
# Warn if a global function is defined without a previous prototype declaration. This warning is issued even if the definition itself provides a prototype. The aim is to detect global functions that fail to be declared in header files.

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wmissing-declarations")
# Warn if a global function is defined without a previous declaration. Do so even if the definition itself provides a prototype. Use this option to detect global functions that are not declared in header files. In C++, no warnings are issued for function templates, or for inline functions, or for functions in anonymous namespaces.

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wmissing-field-initializers")
# Warn if a structure's initializer has some fields missing. For example, the following code would cause such a warning, because x.h is implicitly zero:
#           struct s { int f, g, h; };
#           struct s x = { 3, 4 };
#
# This option does not warn about designated initializers, so the following modification would not trigger a warning:
#           struct s { int f, g, h; };
#           struct s x = { .f = 3, .g = 4 };
#
# This warning is included in -Wextra. To get other -Wextra warnings without this one, use ‘-Wextra -Wno-missing-field-initializers’.

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wmissing-format-attribute")
# Warn about function pointers which might be candidates for format attributes. Note these are only possible candidates, not absolute ones. GCC will guess that function pointers with format attributes that are used in assignment, initialization, parameter passing or return statements should have a corresponding format attribute in the resulting type. I.e. the left-hand side of the assignment or initialization, the type of the parameter variable, or the return type of the containing function respectively should also have a format attribute to avoid the warning.
#
# GCC will also warn about function definitions which might be candidates for format attributes. Again, these are only possible candidates. GCC will guess that format attributes might be appropriate for any function that calls a function like vprintf or vscanf, but this might not always be the case, and some functions for which format attributes are appropriate may not be detected.

## set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wno-multichar")
# Do not warn if a multicharacter constant (‘'FOOF'’) is used. Usually they indicate a typo in the user's code, as they have implementation-defined values, and should not be used in portable code.

## set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wnormalized=<none|id|nfc|nfkc>")
# In ISO C and ISO C++, two identifiers are different if they are different sequences of characters. However, sometimes when characters outside the basic ASCII character set are used, you can have two different character sequences that look the same. To avoid confusion, the ISO 10646 standard sets out some normalization rules which when applied ensure that two sequences that look the same are turned into the same sequence. GCC can warn you if you are using identifiers which have not been normalized; this option controls that warning.
#
# There are four levels of warning that GCC supports. The default is -Wnormalized=nfc, which warns about any identifier which is not in the ISO 10646 “C” normalized form, NFC. NFC is the recommended form for most uses.
#
# Unfortunately, there are some characters which ISO C and ISO C++ allow in identifiers that when turned into NFC aren't allowable as identifiers. That is, there's no way to use these symbols in portable ISO C or C++ and have all your identifiers in NFC. -Wnormalized=id suppresses the warning for these characters. It is hoped that future versions of the standards involved will correct this, which is why this option is not the default.
#
# You can switch the warning off for all characters by writing -Wnormalized=none. You would only want to do this if you were using some other normalization scheme (like “D”), because otherwise you can easily create bugs that are literally impossible to see.
#
# Some characters in ISO 10646 have distinct meanings but look identical in some fonts or display methodologies, especially once formatting has been applied. For instance \u207F, “SUPERSCRIPT LATIN SMALL LETTER N”, will display just like a regular n which has been placed in a superscript. ISO 10646 defines the NFKC normalization scheme to convert all these into a standard form as well, and GCC will warn if your code is not in NFKC if you use -Wnormalized=nfkc. This warning is comparable to warning about every identifier that contains the letter O because it might be confused with the digit 0, and so is not the default, but may be useful as a local coding convention if the programming environment is unable to be fixed to display these characters distinctly.

## set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wno-deprecated")
# Do not warn about usage of deprecated features. See Deprecated Features.

## set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wno-deprecated-declarations")
# Do not warn about uses of functions (see Function Attributes), variables (see Variable Attributes), and types (see Type Attributes) marked as deprecated by using the deprecated attribute.

## set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wno-overflow")
# Do not warn about compile-time overflow in constant expressions.

## set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Woverride-init") # (C and Objective-C only)
# Warn if an initialized field without side effects is overridden when using designated initializers (see Designated Initializers).
#
# This warning is included in -Wextra. To get other -Wextra warnings without this one, use ‘-Wextra -Wno-override-init’.

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wpacked")
# Warn if a structure is given the packed attribute, but the packed attribute has no effect on the layout or size of the structure. Such structures may be mis-aligned for little benefit. For instance, in this code, the variable f.x in struct bar will be misaligned even though struct bar does not itself have the packed attribute:
#           struct foo {
#             int x;
#             char a, b, c, d;
#           } __attribute__((packed));
#           struct bar {
#             char z;
#             struct foo f;
#           };
#

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wpacked-bitfield-compat")
# The 4.1, 4.2 and 4.3 series of GCC ignore the packed attribute on bit-fields of type char. This has been fixed in GCC 4.4 but the change can lead to differences in the structure layout. GCC informs you when the offset of such a field has changed in GCC 4.4. For example there is no longer a 4-bit padding between field a and b in this structure:
#           struct foo
#           {
#             char a:4;
#             char b:8;
#           } __attribute__ ((packed));
#
# This warning is enabled by default. Use -Wno-packed-bitfield-compat to disable this warning.

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wpadded")
# Warn if padding is included in a structure, either to align an element of the structure or to align the whole structure. Sometimes when this happens it is possible to rearrange the fields of the structure to reduce the padding and so make the structure smaller.

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wredundant-decls")
# Warn if anything is declared more than once in the same scope, even in cases where multiple declaration is valid and changes nothing.

## set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wnested-externs") # (C and Objective-C only)
# Warn if an extern declaration is encountered within a function.

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Winline")
# Warn if a function can not be inlined and it was declared as inline. Even with this option, the compiler will not warn about failures to inline functions declared in system headers.
#
# The compiler uses a variety of heuristics to determine whether or not to inline a function. For example, the compiler takes into account the size of the function being inlined and the amount of inlining that has already been done in the current function. Therefore, seemingly insignificant changes in the source program can cause the warnings produced by -Winline to appear or disappear.

## set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wno-invalid-offsetof") # (C++ and Objective-C++ only)
# Suppress warnings from applying the ‘offsetof’ macro to a non-POD type. According to the 1998 ISO C++ standard, applying ‘offsetof’ to a non-POD type is undefined. In existing C++ implementations, however, ‘offsetof’ typically gives meaningful results even when applied to certain kinds of non-POD types. (Such as a simple ‘struct’ that fails to be a POD type only by virtue of having a constructor.) This flag is for users who are aware that they are writing nonportable code and who have deliberately chosen to ignore the warning about it.
#
# The restrictions on ‘offsetof’ may be relaxed in a future version of the C++ standard.

## set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wno-int-to-pointer-cast")
# Suppress warnings from casts to pointer type of an integer of a different size. In C++, casting to a pointer type of smaller size is an error. Wint-to-pointer-cast is enabled by default.

## set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wno-pointer-to-int-cast") # (C and Objective-C only)
# Suppress warnings from casts from a pointer to an integer type of a different size.

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Winvalid-pch")
# Warn if a precompiled header (see Precompiled Headers) is found in the search path but can't be used.

if (0)
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wlong-long")
else()
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wno-long-long")
endif()
# Warn if ‘long long’ type is used. This is enabled by either -pedantic or -Wtraditional in ISO C90 and C++98 modes. To inhibit the warning messages, use -Wno-long-long.

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wvariadic-macros")
# Warn if variadic macros are used in pedantic ISO C90 mode, or the GNU alternate syntax when in pedantic ISO C99 mode. This is default. To inhibit the warning messages, use -Wno-variadic-macros.

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wvla")
# Warn if variable length array is used in the code. -Wno-vla will prevent the -pedantic warning of the variable length array.

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wvolatile-register-var")
# Warn if a register variable is declared volatile. The volatile modifier does not inhibit all optimizations that may eliminate reads and/or writes to register variables. This warning is enabled by -Wall.

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wdisabled-optimization")
# Warn if a requested optimization pass is disabled. This warning does not generally indicate that there is anything wrong with your code; it merely indicates that GCC's optimizers were unable to handle the code effectively. Often, the problem is that your code is too big or too complex; GCC will refuse to optimize programs when the optimization itself is likely to take inordinate amounts of time.

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wpointer-sign") # (C and Objective-C only)
# Warn for pointer argument passing or assignment with different signedness. This option is only supported for C and Objective-C. It is implied by -Wall and by -pedantic, which can be disabled with -Wno-pointer-sign.

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wstack-protector")
# This option is only active when -fstack-protector is active. It warns about functions that will not be protected against stack smashing.

## set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wno-mudflap")
# Suppress warnings about constructs that cannot be instrumented by -fmudflap.

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Woverlength-strings")
# Warn about string constants which are longer than the “minimum maximum” length specified in the C standard. Modern compilers generally allow string constants which are much longer than the standard's minimum limit, but very portable programs should avoid using longer strings.
#
# The limit applies after string constant concatenation, and does not count the trailing NUL. In C90, the limit was 509 characters; in C99, it was raised to 4095. C++98 does not specify a normative minimum maximum, so we do not diagnose overlength strings in C++.
#
# This option is implied by -pedantic, and can be disabled with -Wno-overlength-strings.

## set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wunsuffixed-float-constants") # (C and Objective-C only)
 # GCC will issue a warning for any floating constant that does not have a suffix. When used together with -Wsystem-headers it will warn about such constants in system header files. This can be useful when preparing code to use with the FLOAT_CONST_DECIMAL64 pragma from the decimal floating-point extension to C99.


#--------------------------------------------------------------------------------------------------
# Debugging Options
#
# 3.9 Options for Debugging Your Program or GCC
#--------------------------------------------------------------------------------------------------


#--------------------------------------------------------------------------------------------------
# Optimization Options
#
# 3.10 Options That Control Optimization
#--------------------------------------------------------------------------------------------------


#--------------------------------------------------------------------------------------------------
# Preprocessor Options
#
# 3.11 Options Controlling the Preprocessor
#--------------------------------------------------------------------------------------------------


#--------------------------------------------------------------------------------------------------
# Machine Dependent Options
#
#
#--------------------------------------------------------------------------------------------------


#--------------------------------------------------------------------------------------------------
# Code Generation Options
#
# 3.18 Options for Code Generation Conventions
#--------------------------------------------------------------------------------------------------
