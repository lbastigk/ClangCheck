# ClangCheck

ClangCheck is a small wrapper around `clang-tidy` for checking C++ projects.

## Requirements

- Bash
- `clang-tidy`
- CMake and a C++ toolchain
- GNU `parallel` (optional; sequential execution is used without it)

## Configuration

Copy or edit `.clangcheck.conf` in the project root. It defines the source directories, external include paths, clang-tidy configuration, and known exceptions.

## Run

From the project root:

```bash
Tests/runTest.sh
```

The test harness initializes a test submodule, builds the `linux-debug` preset, and runs ClangCheck against that fixture.

To run the checker directly, execute it from the project root:

```bash
./clangCheck.sh
```

Useful modes:

```bash
./clangCheck.sh --changed-files 
./clangCheck.sh --main-diff
./clangCheck.sh --changed-files --list-only
```