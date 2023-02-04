extends Node

var playerLevel = 1
var playerScore = 0
var playerLinesCleared = 0
var gameIsPaused = false

func _ready():
	pass

func _process(_delta):
	if (playerLinesCleared >= 10):
		playerLevel += 1
		playerLinesCleared = 0

func linesCleared(numLines):
	playerScore += 100 * numLines
	playerLinesCleared += numLines
