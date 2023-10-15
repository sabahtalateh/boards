package handlers

import (
	"net/http"

	"github.com/sabahtalateh/processor/response"
)

func hello(_ *http.Request) response.Response {
	return response.JSON(response.Body("OK"))
}
