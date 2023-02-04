extends Node2D

var grid:Array
var gridWidth = 10
var gridHeight = 20

func _ready():
	randomize()
	initializeGrid()
	addNewShapeToGrid()

func _input(event):
	if event.is_action_pressed("ui_text_submit"):
		PlayerVariables.gameIsPaused = !PlayerVariables.gameIsPaused

func _process(_delta):
	checkForFullRowsAndRemove()
	$LabelScoreValue.text = str(PlayerVariables.playerScore)
	$LabelLevelValue.text = str(PlayerVariables.playerLevel)

func initializeGrid():
	for i in gridHeight:
		grid.append([])

func coordHasBrick(gridRow:int, gridColumn:int):
	if grid[gridRow]:
		for brick in grid[gridRow]:
			if brick.gridColumn == gridColumn:
				return true
	return false

func addBricksToGrid(bricks):
	for brick in bricks:
		grid[brick.gridRow].append(brick)

func addNewShapeToGrid():
	GridShape.new(self)

func checkForFullRowsAndRemove():
	var linesCleared = 0
	for rowIndex in grid.size():
		var row = grid[rowIndex]
		if (row.size() == gridWidth):
			linesCleared += 1
			for colIndex in row.size():
				var brick = row.pop_front()
				brick.removeFromGrid()
			moveGridDown(rowIndex)
	PlayerVariables.linesCleared(linesCleared)

# Moves all the bricks down a row going up starting at given row
func moveGridDown(startRow):
	for i in range(startRow, -1, -1):
		if (i == 0):
			grid[i] = []
		else:
			grid[i] = grid[i-1]
			for brick in grid[i]:
				brick.moveDown()

func gameOver():
	PlayerVariables.gameIsPaused = true
