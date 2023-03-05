cmake_minimum_required(VERSION 3.6)
project(DirtyLockdown)

set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -target arm64-apple-ios -fcommon -fobjc-arc -ObjC -F'${CMAKE_OSX_SYSROOT}/System/Cryptexes/OS/System/Library/Frameworks'")
set(CMAKE_C_FLAGS_DEBUG "-funwind-tables -g")

set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -rpath @executable_path/Frameworks")

add_executable(DirtyLockdown
  src/grant_full_disk_access.m
  src/helpers.m
  src/main.m
  src/vm_unaligned_copy_switch_race.c
  src/AppDelegate.m
  src/SceneDelegate.m
  src/ViewController.m
)

target_link_libraries(DirtyLockdown
  "-framework UIKit"
  "-framework Foundation"
)
set_target_properties(DirtyLockdown PROPERTIES
  MACOSX_BUNDLE TRUE
  MACOSX_FRAMEWORK_IDENTIFIER org.cmake.ExecutableTarget
  MACOSX_BUNDLE_INFO_PLIST "${CMAKE_CURRENT_LIST_DIR}/Info.plist")
