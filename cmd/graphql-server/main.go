package main

import (
	"context"

	runtime "github.com/shahzaibaziz/graphql"
	"github.com/shahzaibaziz/graphql/handler"
)

func main() {
	rt, err := runtime.NewRuntime()
	if err != nil {
		panic(err)
	}

	ctx := context.TODO()

	err = handler.Handler(ctx, rt)
	if err != nil {
		panic(err)
	}
}
