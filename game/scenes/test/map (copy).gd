
extends Spatial

# member variables here, example:
# var a=2
# var b="textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	
	# Mask
	var packed = load("res://scenes/test/mask.scn");
	var root = packed.instance();	
	get_node("face1/Armature/Skeleton").add_child(root);
	get_node("face1/Armature/Skeleton").print_tree();	
	root.get_node("Armature/Skeleton/mask").set_skeleton_path("../../../..");
	
	# Beard
	var packed = load("res://scenes/test/beard.scn");
	var root = packed.instance();	
	get_node("face1/Armature/Skeleton").add_child(root);
	get_node("face1/Armature/Skeleton").print_tree();
	
	root.get_node("Armature/Skeleton/beard").set_skeleton_path("../../../..");
	
	print("----");
	#get_node("face2/armature/skel").add_child(c);
	
	get_node("face2/AnimationPlayer").play("loop_first");
	get_node("face1/AnimationPlayer").play("loop_hello");
	
	


