import cv2
import numpy as np
img = cv2.imread('test.jpg')
'''
res = cv2.resize(original_img,None,fx=0.6, fy=0.6,
                 interpolation = cv2.INTER_CUBIC) #图形太大了缩小一点
B, G, R = cv2.split(res)                    #获取红色通道
img = R

#OpenCV定义的结构矩形元素
'''
gray = cv2.cvtColor(img, cv2.COLOR_RGB2GRAY)
#ret,binary=cv2.threshold(gray,0,255,cv2.THRESH_BINARY_INV | cv2.THRESH_OTSU)
kernel = cv2.getStructuringElement(cv2.MORPH_ELLIPSE, (5, 5))
eroded = cv2.erode(gray, kernel)  # 腐蚀图像 局部最小值
kernel = cv2.getStructuringElement(cv2.MORPH_ELLIPSE, (5, 5))
dilated = cv2.dilate(eroded, kernel)  # 膨胀图像  局部最大值


cv2.imshow("original_img", img)  # 原图像
cv2.imshow("Eroded Image", eroded)  # 显示腐蚀后的图像
cv2.imshow("Dilated Image", dilated)  # 显示膨胀后的图像

# NumPy定义的结构元素
#NpKernel = np.uint8(np.ones((3,3)))
# Nperoded = cv2.erode(RedThresh,NpKernel)       #腐蚀图像
# cv2.imshow("Eroded by NumPy kernel",Nperoded)  #显示腐蚀后的图像
cv2.waitKey(0)
cv2.destroyAllWindows()
