extends Object

class_name GridShapeDefinitionStick

enum directionType { UP, RIGHT, DOWN, LEFT }
var defaultCenterCoords = Vector2(0, 4)
var defaultDirection = directionType.RIGHT
var brickColor = "other"

#	||
#	CC
#	||
#	||
func faceUpCoords(centerCoords, _gridWidth):
	var cRow = centerCoords.x
	var cCol = centerCoords.y
	return {
		"coords": [Vector2(cRow-1, cCol), Vector2(cRow, cCol), Vector2(cRow+1, cCol), Vector2(cRow+2, cCol)],
		"centerCoords": Vector2(cRow, cCol)
	}

#	||	CC	||	||
func faceRightCoords(centerCoords, gridWidth):
	var cRow = centerCoords.x
	var cCol = centerCoords.y
	if (cCol == 0): cCol += 1
	if (cCol == gridWidth-1): cCol -= 1
	return {
		"coords": [Vector2(cRow, cCol-1), Vector2(cRow, cCol), Vector2(cRow, cCol+1), Vector2(cRow, cCol+2)],
		"centerCoords": Vector2(cRow, cCol)
	}

#	||
#	CC
#	||
#	||
func faceDownCoords(centerCoords, _gridWidth):
	var cRow = centerCoords.x
	var cCol = centerCoords.y
	return {
		"coords": [Vector2(cRow-1, cCol), Vector2(cRow, cCol), Vector2(cRow+1, cCol), Vector2(cRow+2, cCol)],
		"centerCoords": Vector2(cRow, cCol)
	}

#	||	CC	||	||
func faceLeftCoords(centerCoords, gridWidth):
	var cRow = centerCoords.x
	var cCol = centerCoords.y
	if (cCol == 0): cCol += 1
	if (cCol == gridWidth-1): cCol -= 1
	return {
		"coords": [Vector2(cRow, cCol-1), Vector2(cRow, cCol), Vector2(cRow, cCol+1), Vector2(cRow, cCol+2)],
		"centerCoords": Vector2(cRow, cCol)
	}
