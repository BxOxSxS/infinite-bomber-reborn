// +build !withoutTor

package main

import (
	"net"
	"os/exec"
	"path/filepath"
	"strconv"
	"time"

	"github.com/fatih/color"
	proxy "github.com/valyala/fasthttp/fasthttpproxy"
)

func attachTor() {
	print("Uruchamianie ")
	color.New(color.FgGreen).Print("tor")
	println("...")

	var (
		err error

		i, status int

		n, port  string
		testsite = "http://example.com/"

		torpath = filepath.Join(execDir, "tor")
		// torpath, _  = filepath.Abs("./tor-files")
		torDataPath = filepath.Join(torpath, "Data")

		torDataDir string

		tor = &exec.Cmd{
			Path: filepath.Join(torpath, "Tor", "tor.exe"),
			Args: []string{
				"tor.exe",
				"-f", filepath.Join(torpath, "torrc"),
				"--DataDirectory", "",
				"--SOCKSPort", "",
			},
			Dir: torpath,
		}

		ln net.Listener
	)

	for {
		if i == 9 {
			print("Nie udało się uruchomić ")
			color.New(color.FgGreen).Print("Tor")
			print("Spróbuj zabić wszystkie procesy tor w menedżerze zadań i/lub zrestartuj bombardier!")

			shutdown(true)
		}

		n = strconv.Itoa(i)
		port = "376" + n

		ln, err = net.Listen("tcp", ":"+port)
		if err != nil || ln == nil {
			i++
			continue
		}
		ln.Close()

		torDataDir = filepath.Join(torDataPath, "data"+n)

		tor.Args[4] = torDataDir
		tor.Args[6] = port

		err = tor.Start()
		if err != nil {
			print("Nie udało się uruchomić ")
			color.New(color.FgGreen).Print("Tor")
			println("!")

			errCheck(err)
		}

		// Zarejestruj serwer proxy Tor w kliencie http
		client.Dial = proxy.FasthttpSocksDialer("127.0.0.1:" + port)

		for b := 0; b < 3; b++ {
			status, _, err = client.Get(nil, testsite)
			if status == 200 && err == nil {
				break
			}
			time.Sleep(time.Second * 5)
		}
		status, _, err = client.Get(nil, testsite)
		if status == 200 && err == nil {
			break
		} else {
			tor.Process.Kill()
		}

		i++
	}

	color.New(color.FgGreen).Print("Tor")
	println(" uruchomiony! Jesteś bezpieczny ;)")
}
