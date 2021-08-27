package service

// Service initializes our database instance
type Service struct {
}

// NewService creates a connection to our database
func NewService() *Service {
	return &Service{}
}
