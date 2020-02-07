package repository

import (
	"fmt"
	"strings"

	"github.com/confluentinc/confluent-kafka-go/kafka"

	"github.com/spf13/viper"
)

func receiveFromKafka() {

	fmt.Println("Start receiving from Kafka")
	c, err := kafka.NewConsumer(&kafka.ConfigMap{
		"bootstrap.servers": viper.GetString(`kafka.server`),
		"group.id":          viper.GetString(`kafka.groupId`),
		"auto.offset.reset": "earliest",
	})

	if err != nil {
		panic(err)
	}

	c.SubscribeTopics(strings.Split(viper.GetString(`kafka.server`), ","), nil)

	for {
		msg, err := c.ReadMessage(-1)

		if err == nil {
			fmt.Printf("Received from Kafka %s: %s\n", msg.TopicPartition, string(msg.Value))
			job := string(msg.Value)
			saveJobToMongo(job)
		} else {
			fmt.Printf("Consumer error: %v (%v)\n", err, msg)
			break
		}
	}

	c.Close()

}
