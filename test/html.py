import os
input_dir='test_dataset'
new_L1_dir='export_new_L1'
new_L1_4_dir='export_new_1_L1_4'
WGAN_L1_dir='export_WGAN_L1'
new_L1_3_dir='export_new_1_L1_1'
new_L1_2_dir='export_new_2_L1_1'
new_L1_1_dir='export_new_L1_5'
new_1_L1_1_dir='export_new_2_L1_2'
models=[new_L1_dir,new_L1_1_dir,new_1_L1_1_dir,new_L1_2_dir,new_L1_3_dir,new_L1_4_dir]
output=['inputs','export_new_L1','export_new_L1_5','export_new_2_L1_1','export_new_2_L1_2','export_new_1_L1_1','export_new_1_L1_4']#
index_path='index4.html'
def append_index(filesets, step=False):
    #index_path = os.path.join(a.output_dir, "index.html")
    if os.path.exists(index_path):
        index = open(index_path, "a")
    else:
        index = open(index_path, "w")
        index.write("<html><body><table><tr>")
        if step:
            index.write("<th>step</th>")#
        index.write("<th>name</th><th>input</th><th>export_new_L1</th><th>export_new_L1_5</th><th>export_new_2_L1_1</th><th>export_new_2_L1_2</th><th>export_new_1_L1_1</th><th>export_new_1_L1_4</th></tr>")#<th>target</th>
    #index.write("<td>%s</td>"%filesets[0]['model_name'])
    
    for fileset in filesets:
        #print(fileset)
        index.write("<tr>")

        if step:
            index.write("<td>%d</td>" % fileset["step"])
        index.write("<td>%s</td>" % fileset["name"])
        
        for kind in output:
            index.write("<td><img src='%s'></td>" % fileset[kind])

        index.write("</tr>")
    return index_path
images=os.listdir(new_L1_dir)

if True:
    fileset={}
    filesets=[]
    for image in images:
        fileset={}
        fileset['name']=image
        fileset['inputs']=os.path.join(input_dir,image)
        for model in models:
            fileset[model]=os.path.join(model,image)
        filesets.append(fileset)
    append_index(filesets)