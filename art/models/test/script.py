import bpy

duplicate = True

ob = bpy.context.object

bpy.ops.object.mode_set(mode = 'OBJECT') 
#bpy.ops.object.select_all(action = 'DESELECT')

me = bpy.context.object.data

#-----------------------------------
# Initialize vertex groups
for i in range(0, len(me.materials)):
    mat = me.materials[i]
    
    # Initialize vertex group
    vg = ob.vertex_groups.get(mat.name)
    if vg is None:
        vg = ob.vertex_groups.new(mat.name)
        
    # Remove all vertices from the group
    vg.remove(range(0,len(me.vertices))) 
    
    list = []
        
    for poly in me.polygons:
        if poly.material_index == i:
            for v in poly.vertices:
                list.append(v)

    vg.add(list,1,'REPLACE')
                
#-----------------------------------
# Duplicate the base mesh for each assigned material

for mat in me.materials:
    print("Material: " + mat.name)
    
    if duplicate:
        ob2 = ob.copy() # duplicate linked
        ob2.data = ob.data.copy() # optional: make this a real duplicate (not linked)
        bpy.context.scene.objects.link(ob2) # add to scene
    
        # Change name
        ob2.name = mat.name
    
        # Set masking
        ob2.modifiers["Mask"].vertex_group = mat.name
    
    bpy.context.scene.update()

