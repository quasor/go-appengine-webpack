package main

import (
  _ "api"
  "math/rand"
  "time"
)

func init() {
  rand.Seed(time.Now().UTC().UnixNano())
}
