## Steganography

-----------------------------------------
### Problem Definition:
**Write a program to implement implement Steganography using Least Significant Bit (LSB) algorithm.**

* Steganography is the art and science of communicating in a way which hides the existence of the communication. Steganography plays an important role in information security. The term steganography is derived from Greek and literally means “covered writing”. 
* A Steganography system consists of three elements: cover image (which hides the secret message), the secret message (or image), and the stego-image (which is the cover object with message embedded inside it).
* In Steganography systems that use an image as the cover, there are several techniques to conceal information inside cover-image. The spatial domain techniques manipulate the cover-image pixel intensity values to embed the secret information. Consequently, such techniques are easy to implement. 
* The LSB is one of the conventional techniques in spatial domain image Steganography. It embeds the secret information in the least significant bits of pixel values of the cover image.

------------------------------------------
### Output:

* Cover Image

<p align="center">
    <img src="./output/image1.png">
</p>

* Grayscale Cover Image (after resizing according to data image

<p align="center">
    <img src="./output/image2.png">
</p>

* Data Image

<p align="center">
    <img src="./output/image3.png">
</p>

* Grayscale Data Image

<p align="center">
    <img src="./output/image4.png">
</p>

* Bit planes after replacing the LSB of cover image with the MSB of data image (from LSB to MSB)

<p align="center">
    <img src="./output/image5.png">
</p>

* Image after replacing the LSB of cover image with the MSB of data image 

<p align="center">
    <img src="./output/image6.png">
</p>

* Extracted data image from the cover image

<p align="center">
    <img src="./output/image7.png">
</p>

