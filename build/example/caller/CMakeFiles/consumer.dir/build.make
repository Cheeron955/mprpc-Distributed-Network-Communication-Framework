# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 2.8

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list

# Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The program to use to edit the cache.
CMAKE_EDIT_COMMAND = /usr/bin/ccmake

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /root/mprpc

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /root/mprpc/build

# Include any dependencies generated for this target.
include example/caller/CMakeFiles/consumer.dir/depend.make

# Include the progress variables for this target.
include example/caller/CMakeFiles/consumer.dir/progress.make

# Include the compile flags for this target's objects.
include example/caller/CMakeFiles/consumer.dir/flags.make

example/caller/CMakeFiles/consumer.dir/calluserservice.cc.o: example/caller/CMakeFiles/consumer.dir/flags.make
example/caller/CMakeFiles/consumer.dir/calluserservice.cc.o: ../example/caller/calluserservice.cc
	$(CMAKE_COMMAND) -E cmake_progress_report /root/mprpc/build/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object example/caller/CMakeFiles/consumer.dir/calluserservice.cc.o"
	cd /root/mprpc/build/example/caller && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/consumer.dir/calluserservice.cc.o -c /root/mprpc/example/caller/calluserservice.cc

example/caller/CMakeFiles/consumer.dir/calluserservice.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/consumer.dir/calluserservice.cc.i"
	cd /root/mprpc/build/example/caller && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /root/mprpc/example/caller/calluserservice.cc > CMakeFiles/consumer.dir/calluserservice.cc.i

example/caller/CMakeFiles/consumer.dir/calluserservice.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/consumer.dir/calluserservice.cc.s"
	cd /root/mprpc/build/example/caller && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /root/mprpc/example/caller/calluserservice.cc -o CMakeFiles/consumer.dir/calluserservice.cc.s

example/caller/CMakeFiles/consumer.dir/calluserservice.cc.o.requires:
.PHONY : example/caller/CMakeFiles/consumer.dir/calluserservice.cc.o.requires

example/caller/CMakeFiles/consumer.dir/calluserservice.cc.o.provides: example/caller/CMakeFiles/consumer.dir/calluserservice.cc.o.requires
	$(MAKE) -f example/caller/CMakeFiles/consumer.dir/build.make example/caller/CMakeFiles/consumer.dir/calluserservice.cc.o.provides.build
.PHONY : example/caller/CMakeFiles/consumer.dir/calluserservice.cc.o.provides

example/caller/CMakeFiles/consumer.dir/calluserservice.cc.o.provides.build: example/caller/CMakeFiles/consumer.dir/calluserservice.cc.o

example/caller/CMakeFiles/consumer.dir/__/user.pb.cc.o: example/caller/CMakeFiles/consumer.dir/flags.make
example/caller/CMakeFiles/consumer.dir/__/user.pb.cc.o: ../example/user.pb.cc
	$(CMAKE_COMMAND) -E cmake_progress_report /root/mprpc/build/CMakeFiles $(CMAKE_PROGRESS_2)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object example/caller/CMakeFiles/consumer.dir/__/user.pb.cc.o"
	cd /root/mprpc/build/example/caller && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/consumer.dir/__/user.pb.cc.o -c /root/mprpc/example/user.pb.cc

example/caller/CMakeFiles/consumer.dir/__/user.pb.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/consumer.dir/__/user.pb.cc.i"
	cd /root/mprpc/build/example/caller && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /root/mprpc/example/user.pb.cc > CMakeFiles/consumer.dir/__/user.pb.cc.i

example/caller/CMakeFiles/consumer.dir/__/user.pb.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/consumer.dir/__/user.pb.cc.s"
	cd /root/mprpc/build/example/caller && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /root/mprpc/example/user.pb.cc -o CMakeFiles/consumer.dir/__/user.pb.cc.s

example/caller/CMakeFiles/consumer.dir/__/user.pb.cc.o.requires:
.PHONY : example/caller/CMakeFiles/consumer.dir/__/user.pb.cc.o.requires

example/caller/CMakeFiles/consumer.dir/__/user.pb.cc.o.provides: example/caller/CMakeFiles/consumer.dir/__/user.pb.cc.o.requires
	$(MAKE) -f example/caller/CMakeFiles/consumer.dir/build.make example/caller/CMakeFiles/consumer.dir/__/user.pb.cc.o.provides.build
.PHONY : example/caller/CMakeFiles/consumer.dir/__/user.pb.cc.o.provides

example/caller/CMakeFiles/consumer.dir/__/user.pb.cc.o.provides.build: example/caller/CMakeFiles/consumer.dir/__/user.pb.cc.o

# Object files for target consumer
consumer_OBJECTS = \
"CMakeFiles/consumer.dir/calluserservice.cc.o" \
"CMakeFiles/consumer.dir/__/user.pb.cc.o"

# External object files for target consumer
consumer_EXTERNAL_OBJECTS =

../bin/consumer: example/caller/CMakeFiles/consumer.dir/calluserservice.cc.o
../bin/consumer: example/caller/CMakeFiles/consumer.dir/__/user.pb.cc.o
../bin/consumer: example/caller/CMakeFiles/consumer.dir/build.make
../bin/consumer: ../lib/libmprpc.a
../bin/consumer: example/caller/CMakeFiles/consumer.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX executable ../../../bin/consumer"
	cd /root/mprpc/build/example/caller && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/consumer.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
example/caller/CMakeFiles/consumer.dir/build: ../bin/consumer
.PHONY : example/caller/CMakeFiles/consumer.dir/build

example/caller/CMakeFiles/consumer.dir/requires: example/caller/CMakeFiles/consumer.dir/calluserservice.cc.o.requires
example/caller/CMakeFiles/consumer.dir/requires: example/caller/CMakeFiles/consumer.dir/__/user.pb.cc.o.requires
.PHONY : example/caller/CMakeFiles/consumer.dir/requires

example/caller/CMakeFiles/consumer.dir/clean:
	cd /root/mprpc/build/example/caller && $(CMAKE_COMMAND) -P CMakeFiles/consumer.dir/cmake_clean.cmake
.PHONY : example/caller/CMakeFiles/consumer.dir/clean

example/caller/CMakeFiles/consumer.dir/depend:
	cd /root/mprpc/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /root/mprpc /root/mprpc/example/caller /root/mprpc/build /root/mprpc/build/example/caller /root/mprpc/build/example/caller/CMakeFiles/consumer.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : example/caller/CMakeFiles/consumer.dir/depend

