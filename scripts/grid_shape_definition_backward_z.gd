extends Object

class_name GridShapeDefinitionBackwardZ

enum directionType { UP, RIGHT, DOWN, LEFT }
var defaultCenterCoords = Vector2(0, 5)
var defaultDirection = directionType.LEFT
var brickColor = "backward"

#		||
#	||	CC
#	||
func faceUpCoords(centerCoords, gridWidth):
	var cRow = centerCoords.x
	var cCol = centerCoords.y
	if (cCol == gridWidth-1): cCol -= 1
	return {
		"coords": [Vector2(cRow+1, cCol-1), Vector2(cRow, cCol-1), Vector2(cRow, cCol), Vector2(cRow-1, cCol)],
		"centerCoords": Vector2(cRow, cCol)
	}

#	||	CC
#		||	||
func faceRightCoords(centerCoords, gridWidth):
	var cRow = centerCoords.x
	var cCol = centerCoords.y
	if (cCol == 0): cCol += 1
	if (cCol == gridWidth-1): cCol -= 1
	return {
		"coords": [Vector2(cRow, cCol-1), Vector2(cRow, cCol), Vector2(cRow+1, cCol), Vector2(cRow+1, cCol+1)],
		"centerCoords": Vector2(cRow, cCol)
	}

#	||
#	||	CC
#		||
func faceDownCoords(centerCoords, _gridWidth):
	var cRow = centerCoords.x
	var cCol = centerCoords.y
	if (cCol == 0): cCol += 1
	return {
		"coords": [Vector2(cRow-1, cCol-1), Vector2(cRow, cCol-1), Vector2(cRow, cCol), Vector2(cRow+1, cCol)],
		"centerCoords": Vector2(cRow, cCol)
	}

#	||	CC
#		||	||
func faceLeftCoords(centerCoords, gridWidth):
	var cRow = centerCoords.x
	var cCol = centerCoords.y
	if (cCol == 0): cCol += 1
	if (cCol == gridWidth-1): cCol -= 1
	return {
		"coords": [Vector2(cRow, cCol-1), Vector2(cRow, cCol), Vector2(cRow+1, cCol), Vector2(cRow+1, cCol+1)],
		"centerCoords": Vector2(cRow, cCol)
	}
