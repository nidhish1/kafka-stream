package repository

import (
	"fmt"
	"log"

	"github.com/spf13/viper"
	"gopkg.in/mgo.v2"
)

type MongoStore struct {
	session *mgo.Session
}

func InitMongoDBConnection() {
	uri := initialiseMongoURL()
	var err error
	connetion := MongoStore{}
	connetion.session, err = mgo.Dial(uri)
	if err != nil {
		log.Fatalf("Failed to connect to database: %v", err)
	}
}

func initialiseMongoURL() string {

	dbHost := viper.GetString(`database.host`)
	dbPort := viper.GetString(`database.port`)
	dbUser := viper.GetString(`database.user`)
	dbPass := viper.GetString(`database.pass`)
	dbName := viper.GetString(`database.name`)
	connection := fmt.Sprintf("%s:%s@(%s:%s)/%s", dbUser, dbPass, dbHost, dbPort, dbName)

	return connection

}
