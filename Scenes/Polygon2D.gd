extends CollisionPolygon2D

func _ready():
	polygon = get_parent().get_node("Polygon2D").polygon
