#!/usr/bin/env bash
set -euo pipefail

script_directory=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)
repository_root=$(cd -- "$script_directory/.." && pwd)
test_project="$script_directory/Nebulite"
checker="$repository_root/clangCheck.sh"

if [ ! -x "$checker" ]; then
	echo "Error: clangCheck.sh is not executable: $checker" >&2
	exit 1
fi

echo "Initializing test modules..."
git -C "$repository_root" submodule update --init --recursive

if [ ! -d "$test_project" ]; then
	echo "Error: Test project was not initialized: $test_project" >&2
	exit 1
fi

cd "$test_project"
git checkout v1.4.3
make linux-debug

echo "Running clangCheck.sh in $test_project"
cd "$repository_root"
exec "$checker" "$@"