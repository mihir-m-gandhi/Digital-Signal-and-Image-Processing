## Contrast Stretching

-----------------------------------------
### Problem Definition:
**Write a program to implement contrast stretching in a digital image.**

Contrast stretching (often called normalization) is a simple image enhancement technique that attempts to improve the contrast in an image by stretching the range of intensity values it contains to span a desired range of values.

<p align="center">
    <img height=300px src="./contrast-stretching.png">
</p>

The locations of (r1,s1) and (r2,s2) control the shape of the transformation function:
* If r1= s1 and r2= s2 the transformation is a linear function and produces no changes.
* If r1=r2, s1=0 and s2=L-1, the transformation becomes a thresholding function that creates a binary image.
* Intermediate values of (r1,s1) and (r2,s2) produce various degrees of spread in the gray levels of the output image, thus affecting its contrast.

Generally, r1≤r2 and s1≤s2 is assumed.


------------------------------------------
### Output:

* Original Image (after grayscaling)

<p align="center">
    <img src="./output/image1.png">
</p>

* Image after contrast stretching with (r1,s1) = (20,50) and (r2,s2) = (100,150) (r2>r1, s2>s1)

<p align="center">
    <img src="./output/image2.png">
</p>

* Image after contrast stretching with (r1,s1) = (80,0) and (r2,s2) = (80,255) (r1=r2, s1=0, s2=L-1, where L is maximum gray level allowed)

<p align="center">
    <img src="./output/image3.png">
</p>

* Image after contrast stretching with (r1,s1) = (100,100) and (r2,s2) = (200,200) (r1=s1, r2=s2)

<p align="center">
    <img src="./output/image4.png">
</p>

* Image after contrast stretching with (r1,s1) = (80,100) and (r2,s2) = (70,80) (r1>s1, r2>s2; possibility of intensity artifacts)

<p align="center">
    <img src="./output/image5.png">
</p>
