package main

import (
	"fmt"

	connection "github.com/nidhish1/kafka-stream"

	"github.com/spf13/viper"
)

func init() {
	viper.SetConfigFile(`config.json`)
	err := viper.ReadInConfig()
	if err != nil {
		panic(err)
	}

	if viper.GetBool(`debug`) {
		fmt.Println("Service RUN on DEBUG mode")
	}
}

func main() {

	//Create MongoDB session
	connection.InitMongoDBConnection()
	// log.Fatal(e.Start(viper.GetString("server.address")))
}
