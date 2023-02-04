extends Object

class_name GridShapeDefinitionBox

enum directionType { UP, RIGHT, DOWN, LEFT }
var defaultCenterCoords = Vector2(0, 4)
var defaultDirection = directionType.UP
var brickColor = "other"

#	||	||
#	||	||
func faceUpCoords(centerCoords, _gridWidth):
	var cRow = centerCoords.x
	var cCol = centerCoords.y
	return {
		"coords": [Vector2(cRow, cCol), Vector2(cRow, cCol+1), Vector2(cRow+1, cCol), Vector2(cRow+1, cCol+1)],
		"centerCoords": Vector2(cRow, cCol)
	}

#	||	||
#	||	||
func faceRightCoords(centerCoords, _gridWidth):
	var cRow = centerCoords.x
	var cCol = centerCoords.y
	return {
		"coords": [Vector2(cRow, cCol), Vector2(cRow, cCol+1), Vector2(cRow+1, cCol), Vector2(cRow+1, cCol+1)],
		"centerCoords": Vector2(cRow, cCol)
	}

#	||	||
#	||	||
func faceDownCoords(centerCoords, _gridWidth):
	var cRow = centerCoords.x
	var cCol = centerCoords.y
	return {
		"coords": [Vector2(cRow, cCol), Vector2(cRow, cCol+1), Vector2(cRow+1, cCol), Vector2(cRow+1, cCol+1)],
		"centerCoords": Vector2(cRow, cCol)
	}

#	||	||
#	||	||
func faceLeftCoords(centerCoords, _gridWidth):
	var cRow = centerCoords.x
	var cCol = centerCoords.y
	return {
		"coords": [Vector2(cRow, cCol), Vector2(cRow, cCol+1), Vector2(cRow+1, cCol), Vector2(cRow+1, cCol+1)],
		"centerCoords": Vector2(cRow, cCol)
	}
