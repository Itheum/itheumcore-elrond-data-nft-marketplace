#!/bin/bash

cargo llvm-cov --ignore-filename-regex '(claims.rs|events.rs|storage.rs)' --open
