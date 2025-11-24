# Lab-4-Noise-and-Filtering

Below is a brief explanation of my Lab 4 work on noise and filtering in MATLAB. First, I added two common types of noise to the grayscale peppers image: Gaussian noise, which introduces random intensity variations across all pixels, and salt-and-pepper noise, which creates random black and white pixels. This allowed me to compare how each noise type affects image quality. I then calculated the Mean-Squared Error (MSE) between the noisy images and the original image to measure distortion; salt-and-pepper noise typically produced a higher MSE because of its sharp pixel spikes.

Next, I applied linear filtering techniques, including the average filter and the Gaussian filter. Both filters smooth the image and help reduce noise, but they also blur edges because they rely on neighborhood averaging. To address edge preservation, I used a median filter, which replaces each pixel with the median value of its surrounding region. This method works especially well for salt-and-pepper noise and maintains edges better than linear filters.

Finally, I compared MSE after filtering. The median filter produced the lowest error for salt-and-pepper noise, while the Gaussian filter performed best for Gaussian noise. These numerical results matched what could be seen visually. Overall, the experiment shows that different noise types require different filtering strategies, and adaptive filtering methods can further improve detail preservation in images.

![image](https://github.com/jahossain/Lab-4-Noise-and-Filtering/blob/main/Screenshot%202025-11-24%20225855.png)



![image](https://github.com/jahossain/Lab-4-Noise-and-Filtering/blob/main/Screenshot%202025-11-24%20225902.png)
