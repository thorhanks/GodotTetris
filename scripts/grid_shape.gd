extends Node2D

class_name GridShape

enum directionType { UP, RIGHT, DOWN, LEFT }
enum shapeType { BOX, T, FORWARD_Z, FORWARD_L, STICK, BACKWARD_L, BACKWARD_Z }

var currentDirection
var centerCoords
var shapeDefinition
var bricks = []
var gridNode:Node2D

func _init(gridN:Node2D):
	gridNode = gridN
	shapeDefinition = getRandomShapeDefinition()
	centerCoords = shapeDefinition.defaultCenterCoords
	currentDirection = shapeDefinition.defaultDirection
	var brickColor = shapeDefinition.brickColor
	var newShapeCoords = getCoordsByDirection(currentDirection, centerCoords, shapeDefinition, gridNode.gridWidth).coords
	if (coordsAreBlocked(newShapeCoords)):
		gridNode.gameOver()
		return
	createBricks(newShapeCoords, brickColor)
	gridNode.add_child(self)
	var timer:Timer = gridNode.get_node("MoveDownTimer")
	timer.timeout.connect(onMoveDownTimer)

func getRandomShapeDefinition():
	var randomShapeType = randi() % 7
	if (randomShapeType == shapeType.BOX):
		return GridShapeDefinitionBox.new()
	elif (randomShapeType == shapeType.T):
		return GridShapeDefinitionT.new()
	elif (randomShapeType == shapeType.FORWARD_Z):
		return GridShapeDefinitionForwardZ.new()
	elif (randomShapeType == shapeType.FORWARD_L):
		return GridShapeDefinitionForwardL.new()
	elif (randomShapeType == shapeType.STICK):
		return GridShapeDefinitionStick.new()
	elif (randomShapeType == shapeType.BACKWARD_L):
		return GridShapeDefinitionBackwardL.new()
	elif (randomShapeType == shapeType.BACKWARD_Z):
		return GridShapeDefinitionBackwardZ.new()

func _input(event):
	if !PlayerVariables.gameIsPaused:
		if event.is_action_pressed("ui_left", true):
			moveBricksLeft()
		elif event.is_action_pressed("ui_right", true):
			moveBricksRight()
		elif event.is_action_pressed("ui_down", true):
			moveBricksDown()
		elif event.is_action_pressed("ui_up"):
			rotateBricks()

func finish():
	gridNode.addBricksToGrid(bricks)
	gridNode.addNewShapeToGrid()
	remove()

func createBricks(shapeCoords, brickColor):
	for coords in shapeCoords:
		bricks.append(GridBrick.new(coords.x, coords.y, gridNode, brickColor))

func getCoordsByDirection(direction, cCoords, definition, gridWidth):
	if (direction == directionType.UP):
		return definition.faceUpCoords(cCoords, gridWidth)
	elif (direction == directionType.RIGHT):
		return definition.faceRightCoords(cCoords, gridWidth)
	elif (direction == directionType.DOWN):
		return definition.faceDownCoords(cCoords, gridWidth)
	elif (direction == directionType.LEFT):
		return definition.faceLeftCoords(cCoords, gridWidth)

func moveBricksLeft():
	if canMoveLeft():
		centerCoords.y -= 1
		for brick in bricks:
			brick.moveLeft()

func moveBricksRight():
	if canMoveRight():
		centerCoords.y += 1
		for brick in bricks:
			brick.moveRight()

func moveBricksDown():
	if (canMoveDown()):
		centerCoords.x += 1
		for brick in bricks:
			brick.moveDown()
	else:
		finish()

func onMoveDownTimer():
	if !PlayerVariables.gameIsPaused:
		moveBricksDown()

func rotateBricks():
	var newDirection = getNextDirection(currentDirection)
	var newCoordsInfo = getCoordsByDirection(newDirection, centerCoords, shapeDefinition, gridNode.gridWidth)
	centerCoords = newCoordsInfo.centerCoords
	# check if new coords are occupied
	for coord in newCoordsInfo.coords:
		if (gridNode.coordHasBrick(coord.x, coord.y)):
			return
	for i in bricks.size():
		var coord = newCoordsInfo.coords[i]
		bricks[i].moveTo(coord.x, coord.y)
	
	currentDirection = newDirection

func getNextDirection(direction):
	if (direction == directionType.LEFT):
		return directionType.UP
	else:
		return direction + 1

func remove():
	queue_free()
	#gridNode.remove_child(self)

func getMinBrickColumn():
	var col = bricks[0].gridColumn
	for brick in bricks:
		if (brick.gridColumn < col):
			col = brick.gridColumn
	return col

func getMaxBrickColumn():
	var col = bricks[0].gridColumn
	for brick in bricks:
		if (brick.gridColumn > col):
			col = brick.gridColumn
	return col

func getMaxBrickRow():
	var row = bricks[0].gridRow
	for brick in bricks:
		if (brick.gridRow > row):
			row = brick.gridRow
	return row

func canMoveLeft():
	if (getMinBrickColumn() <= 0):
		return false
	for brick in bricks:
		if (gridNode.coordHasBrick(brick.gridRow, brick.gridColumn-1)):
			return false
	return true

func canMoveRight():
	if (getMaxBrickColumn() >= (gridNode.gridWidth-1)):
		return false
	for brick in bricks:
		if (gridNode.coordHasBrick(brick.gridRow, brick.gridColumn+1)):
			return false
	return true

func canMoveDown():
	if (getMaxBrickRow() >= gridNode.gridHeight-1):
		return false
	for brick in bricks:
		if (gridNode.coordHasBrick(brick.gridRow+1, brick.gridColumn)):
			return false
	return true

func coordsAreBlocked(coords):
	for coord in coords:
		if (gridNode.coordHasBrick(coord.x, coord.y)):
			return true
	return false

