cmake_minimum_required(VERSION 3.14)

project(main LANGUAGES C)

add_library(bill STATIC bill.c)
add_library(fred SHARED fred.c)

add_executable(main main.c)
target_link_libraries(main PUBLIC bill fred)
