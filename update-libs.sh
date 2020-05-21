#!/bin/sh

echo 'Aktualizacja biblioteki kolorów fatih'
go get -u -d github.com/fatih/color
echo 'Aktualizacja biblioteki yaml.v2'
go get -u -d gopkg.in/yaml.v2
echo 'Aktualizacja biblioteki bine'
go get -u -d github.com/cretz/bine
echo 'Aktualizacja biblioteki fasthttp'
go get -u -d github.com/valyala/fasthttp
echo 'Aktualizacja biblioteki go-libtor'
go get -u -d github.com/ipsn/go-libtor
