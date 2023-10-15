package main

import (
	"fmt"
	"net/http"
	"os"
	"os/signal"
	"syscall"

	"github.com/sabahtalateh/boards/internal/handlers"
)

func main() {
	sig := make(chan os.Signal, 1)
	signal.Notify(sig, os.Interrupt, os.Kill, syscall.SIGTERM)

	go func() {
		err := http.ListenAndServe(":3000", handlers.Router())
		if err != nil {
			fmt.Printf("%s", err)
			os.Exit(1)
		}
	}()

	fmt.Printf("Server started at port 3000. (Ctrl+C) to stop\n")
	<-sig
	fmt.Printf("Bue")
}
