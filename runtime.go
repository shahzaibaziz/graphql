package runtime

import (
	"github.com/shahzaibaziz/graphql/service"
)

// Runtime runtime structure
type Runtime struct {
	svc *service.Service
}

// NewRuntime create runtime and add service layer
func NewRuntime() (*Runtime, error) {
	return &Runtime{svc: service.NewService()}, nil
}
