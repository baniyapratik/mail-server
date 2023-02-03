package main

import (
	"fmt"
	"log"
	"net/http"
)

const appPort = "8080"

func main() {
	app := Config{}
	log.Println("Starting mail service on port", appPort)

	srv := &http.Server{
		Addr:    fmt.Sprintf(":%s", appPort),
		Handler: app.routes(),
	}
	err := srv.ListenAndServe()
	if err != nil {
		log.Panic(err)
	}
}
