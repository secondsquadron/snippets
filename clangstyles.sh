#!/bin/sh

# export clang-format built-in styles

for i in LLVM Google Chromium Mozilla WebKit Microsoft GNU
do
    clang-format -style=$i -dump-config > .clang-format.$i
done

