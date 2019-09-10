import cv2 as cv
import numpy as np

intput_dir = "D:/Documents/homewrok_5th/deecamp/project/imag_handle/"
src = cv.imread(input_dir)
cv.namedWindow("input image", cv.WINDOW_AUTOSIZE)
cv.imshow("input image", src)

kernel = np.array([[0, -1, 0], [-1, 5, -1], [0, -1, 0]], np.float32)  # 锐化
dst = cv.filter2D(src, -1, kernel=kernel)
cv.imshow("custom_blur_demo", dst)

blur = cv2.bilateralFilter(dst, 9, 75, 75)
cv.imshow("bilateral_filter_demo", blur)

cv.waitKey(0)
cv.destroyAllWindows()
