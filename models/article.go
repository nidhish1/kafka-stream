package models

import (
	
)

// Article represent the article model

type Job struct {
	Title       string `json:"title"`
	Description string `json:"description"`
	Company     string `json:"company"`
	Salary      string `json:"salary"`
}