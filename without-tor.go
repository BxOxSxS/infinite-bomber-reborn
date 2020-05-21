// +build withoutTor

package main

import "github.com/fatih/color"

func attachTor() {
	color.New(color.FgGreen).Print("Tor")
	print(" nie zostanie uruchomiony! NIE jesteś bezpieczny: do ")
	color.New(color.FgGreen).Print("tor")
	println(", musisz użyć odpowiedniej wersji programu!")
}
