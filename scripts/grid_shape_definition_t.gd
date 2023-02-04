extends Object

class_name GridShapeDefinitionT

enum directionType { UP, RIGHT, DOWN, LEFT }
var defaultCenterCoords = Vector2(1, 5)
var defaultDirection = directionType.DOWN
var brickColor = "other"

#		||
#	||	||	||
func faceUpCoords(centerCoords, gridWidth):
	var cRow = centerCoords.x
	var cCol = centerCoords.y
	if (cCol == 0): cCol += 1
	if (cCol == gridWidth-1): cCol -= 1
	return {
		"coords": [Vector2(cRow, cCol-1), Vector2(cRow, cCol), Vector2(cRow, cCol+1), Vector2(cRow-1, cCol)],
		"centerCoords": Vector2(cRow, cCol)
	}

#	||
#	||	||
#	||
func faceRightCoords(centerCoords, gridWidth):
	var cRow = centerCoords.x
	var cCol = centerCoords.y
	if (cCol == gridWidth-1): cCol -= 1
	return {
		"coords": [Vector2(cRow-1, cCol), Vector2(cRow, cCol), Vector2(cRow+1, cCol), Vector2(cRow, cCol+1)],
		"centerCoords": Vector2(cRow, cCol)
	}

#	||	||	||
#		||
func faceDownCoords(centerCoords, gridWidth):
	var cRow = centerCoords.x
	var cCol = centerCoords.y
	if (cCol == 0): cCol += 1
	if (cCol == gridWidth-1): cCol -= 1
	return {
		"coords": [Vector2(cRow, cCol-1), Vector2(cRow, cCol), Vector2(cRow, cCol+1), Vector2(cRow+1, cCol)],
		"centerCoords": Vector2(cRow, cCol)
	}

#		||
#	||	||
#		||
func faceLeftCoords(centerCoords, _gridWidth):
	var cRow = centerCoords.x
	var cCol = centerCoords.y
	if (cCol == 0): cCol += 1
	return {
		"coords": [Vector2(cRow-1, cCol), Vector2(cRow, cCol), Vector2(cRow+1, cCol), Vector2(cRow, cCol-1)],
		"centerCoords": Vector2(cRow, cCol)
	}
