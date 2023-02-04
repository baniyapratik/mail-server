package main

import (
	"github.com/go-chi/chi/v5"
	"github.com/go-chi/chi/v5/middleware"
	"net/http"
)

func (app *Config) routes() http.Handler {
	mux := chi.NewRouter()
	mux.Use(middleware.Logger)

	mux.Use(middleware.Heartbeat("/health")) // health check
	mux.Post("/send", app.SendMail)          // path to send mail
	return mux
}
