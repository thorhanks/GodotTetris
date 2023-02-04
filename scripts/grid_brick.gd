extends Object

class_name GridBrick

var sprite:Sprite2D
var gridNode:Node2D
var gridRow:int
var gridColumn:int

func _init(gridR:int, gridC:int, gridN:Node2D, brickColor):
	gridNode = gridN
	addToGrid(gridR, gridC, brickColor)

func moveRight():
	sprite.position.x += 40
	gridColumn += 1

func moveDown():
	sprite.position.y += 40
	gridRow += 1

func moveLeft():
	sprite.position.x -= 40
	gridColumn -= 1

func moveTo(gridR, gridC):
	var newPosition = translateRowColumnToPosition(gridR, gridC)
	gridRow = gridR
	sprite.position.x = newPosition.x
	gridColumn = gridC
	sprite.position.y = newPosition.y

func translateRowColumnToPosition(gridR:int, gridC:int):
	var x = gridC * 40 + 20
	var y = gridR * 40 + 20
	return Vector2(x,y)

func addToGrid(gridR:int, gridC:int, brickColor:String):
	gridRow = gridR
	gridColumn = gridC
	sprite = Sprite2D.new()
	sprite.texture = getTexture(brickColor)
	sprite.position = translateRowColumnToPosition(gridRow, gridColumn)
	gridNode.add_child(sprite) 

func removeFromGrid():
	gridNode.remove_child(sprite)

func getTexture(brickColor):
	if (brickColor == "forward"):
		return preload("res://assets/brick_forward.png")
	elif (brickColor == "backward"):
		return preload("res://assets/brick_backward.png")
	elif (brickColor == "other"):
		return preload("res://assets/brick_other.png")
