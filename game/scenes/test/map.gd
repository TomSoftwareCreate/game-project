
extends Spatial

var my_mat;

# member variables here, example:
# var a=2
# var b="textvar"



func _ready():
	my_mat = FixedMaterial.new();
	my_mat.set_parameter(FixedMaterial.PARAM_DIFFUSE, Color(0,0,1));
	
	# Called every time the node is added to the scene.
	# Initialization here
	
	add_stuff("face1", "beard");	
	
	add_stuff("face2", "beard");	
	add_stuff("face2", "mask");	
	
	add_stuff("face3", "hair");
	add_stuff("face3", "mask");
	
	add_stuff("face4", "hair");
	add_stuff("face4", "mask");
	add_stuff("face4", "beard");
		
	get_node("face1/AnimationPlayer").play("loop_hello");
	get_node("face2/AnimationPlayer").play("loop_hello");
	get_node("face3/AnimationPlayer").play("loop_world!");
	get_node("face4/AnimationPlayer").play("loop_first");
	
	
	
func add_stuff(var here, var what):
	var root = load("res://scenes/test/" + what + ".scn").instance();	
	var mi = MeshInstance.new();
	mi.set_mesh(root.get_node("Armature/Skeleton/" + what).get_mesh());
	mi.get_mesh().surface_set_material(0, my_mat);
	get_node(here).get_node("Armature/Skeleton").add_child(mi);
	mi.set_skeleton_path("..");



