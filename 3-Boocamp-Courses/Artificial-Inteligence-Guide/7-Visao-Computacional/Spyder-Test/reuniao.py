import cv2

img = cv2.imread('reuniao.jpg')
img_gray = cv2.imread('reuniao.jpg', cv2.IMREAD_GRAYSCALE)

print('Atributos Imagem Colorida')
print(img)
print(img.shape)
print('Atributos Imagem Cinza')
print(img_gray)
print(img_gray.shape)

#cv2.imshow('image2', img_gray)
# cv2.waitKey(20000)
# cv2.destroyAllWindows(0)

cv2.imwrite('reuniao-color.jpg', img)
cv2.imwrite('reuniao-cinza.jpg', img_gray)
