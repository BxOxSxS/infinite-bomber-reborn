#!/bin/sh

echo "Czyszczenie pamięci podręcznej kompilatora..."
go clean -cache -testcache -modcache
ccache -C
echo 'Gotowe!'
