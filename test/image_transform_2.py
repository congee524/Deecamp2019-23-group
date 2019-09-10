import cv2
import numpy as np
import random
import os
files=os.listdir('test_dataset')
for file in files:
    path=os.path.join('test_dataset',file)
    img=cv2.imread(path)
    kernel = cv2.getStructuringElement(cv2.MORPH_RECT,(3, 3))
    img=255-img
    dilated = cv2.dilate(img,kernel)  #局部最大值
    output = dilated - img
    output = 255 - output
    output_path=os.path.join('test_dataset_1',file)
    cv2.imwrite(output_path,output)
#     combined=np.hstack([dilated,output])
#     cv2.imwrite('out.png',output)
#     cv2.imshow('img_double_edge',combined)
#     cv2.waitKey(0)
#     cv2.destroyAllWindows()
