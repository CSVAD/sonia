# Imitating Dutch Floral Painting

## **CSVAD f19 Final Project**
## by **Sonia Hashim**


## Concept

17th Century Dutch Floral Painting

![Small Bouquet of Flowers in a Ceramic, 1599 by Jan Brueghel the Elder](https://upload.wikimedia.org/wikipedia/commons/b/bd/Jan_Bruegel_%28I%29_-_Bouquet_of_Flowers_in_a_Ceramic_Vase.jpg)


Generative ML Models → AEs, VAEs, GANs, VQ-VAE-2

![Fig 6 from “Generating Diverse High-Fidelity Images with VQ-VAE-2” by Razavi et al. 2019](https://paper-attachments.dropbox.com/s_5E697047A90D086B5A66459FC67D7B02E43AAEF701864E360BF1829A8892B3A1_1576008637203_vq-vae-2-ffgq-1024-1024.jpg)

## Motivation

***Machine Learning Art: An Interview With Memo Akten* by Renée Zachariou & Memo Akten
[Interview on Artnome](https://www.artnome.com/news/2018/12/13/machine-learning-art-an-interview-with-memo-akten)


    "I’m interested in using machines that learn as a way to reflect on how we make sense of the world. Artificial neural networks. . .are incredibly biased and problematic. They’re complicated, but can be very predictable, as well. Just like us. I don’t mean artificial neural networks are like our brain. I mean I just like using them as a mirror to ourselves.”

    “We can only understand the world through the lens of everything that we’ve seen or heard or read before. We are constantly trying to make sense of everything that we experience based on our past experiences. We see things not as they are, but as we are. . . One who has only ever seen thousands of images of the ocean will see the ocean everywhere they look.”

Latent Space Exploration = comparing the learned “semantics” of generative models

## Data

Oxford Visual Geometry Group: [17 Category Flower Data Set](https://www.robots.ox.ac.uk/~vgg/data/flowers/17/index.html)


- The total number of images is 1360.
- The total number of ground truth segmentation maps is 847.


![](https://paper-attachments.dropbox.com/s_5E697047A90D086B5A66459FC67D7B02E43AAEF701864E360BF1829A8892B3A1_1575848204399_image.png)



![](https://paper-attachments.dropbox.com/s_5E697047A90D086B5A66459FC67D7B02E43AAEF701864E360BF1829A8892B3A1_1575872879788_image.png)

![](https://paper-attachments.dropbox.com/s_5E697047A90D086B5A66459FC67D7B02E43AAEF701864E360BF1829A8892B3A1_1575872944971_image.png)

- Categories
    -  '00.daffodils'
    -  '01.snowdrop'
    -  '02.lilyvalley'
    -  '03.bluebell'
    -  '04.crocus'
    -  '05.iris'
    -  '06.tigerlily'
    -  '07.tulip'
    -  '08.fritillary'
    -  '09.sunflower'
    -  '10.daisy'
    -  '11.coltsfoot'
    -  '12.dandelion'
    -  '13.cowslip'
    -  '14.buttercup'
    -  '15.windflower'
    -  '16.pansy’


Observations


- Color, size & pose variations
    - Iris → different colors, other flowers more consistent
    - Pose variations → especially noticeable in smaller / structural flowers
- A lot of yellow, white and purple flowers
## Data Pre-Processing


Segmentation → Crop → Thumbnail → Uniform Size (256 x 256)


![](https://paper-attachments.dropbox.com/s_5E697047A90D086B5A66459FC67D7B02E43AAEF701864E360BF1829A8892B3A1_1575873235185_image.png)

![](https://paper-attachments.dropbox.com/s_5E697047A90D086B5A66459FC67D7B02E43AAEF701864E360BF1829A8892B3A1_1575873266448_image.png)



![](https://paper-attachments.dropbox.com/s_5E697047A90D086B5A66459FC67D7B02E43AAEF701864E360BF1829A8892B3A1_1575875219500_image.png)

| Category      | Training Images |
| ------------- | --------------- |
| 00.daffodils  | 71 images       |
| 01.snowdrop   | 50 images       |
| 02.lilyvalley | 17 images       |
| 03.bluebell   | 28 images       |
| 04.crocus     | 50 images       |
| 05.iris       | 77 images       |
| 06.tigerlily  | 50 images       |
| 07.tulip      | 41 images       |
| 08.fritillary | 65 images       |
| 09.sunflower  | 71 images       |
| 10.daisy      | 58 images       |
| 11.coltsfoot  | 43 images       |
| 12.dandelion  | 55 images       |
| 13.cowslip    | 0 images        |
| 14.buttercup  | 54 images       |
| 15.windflower | 61 images       |
| 16.pansy      | 56 images       |

Observations & Future work


- MaskRCNN → generate segmentation masks for all images, more data


- Soften edges of flowers → filter segmentation masks with Gaussian blur


- Imbalanced data set


- Black and white?


## Convolutional Autoencoder (CAE)

Overview


![Autoencoder Model Architecture, Source:  https://lilianweng.github.io/lil-log/2018/08/12/from-autoencoder-to-beta-vae.html](https://lilianweng.github.io/lil-log/assets/images/autoencoder-architecture.png)



![../_images/no_padding_no_strides.gifConvolution Arithmetic, Source: http://deeplearning.net/software/theano/tutorial/conv_arithmetic.html](http://deeplearning.net/software/theano/_images/no_padding_no_strides.gif)



Data augmentation


- Image Data Generator → Training on slightly different images for each epoch
    - Horizontal flips
    - Zoom (factor of 0.2)
    - Rotation (up to 15 degrees)
    - ~~Width / height shifts & shears~~
![](https://paper-attachments.dropbox.com/s_5E697047A90D086B5A66459FC67D7B02E43AAEF701864E360BF1829A8892B3A1_1576003601377_image.png)

![](https://paper-attachments.dropbox.com/s_5E697047A90D086B5A66459FC67D7B02E43AAEF701864E360BF1829A8892B3A1_1576003629961_image.png)

![Samples from Image Data Generator](https://paper-attachments.dropbox.com/s_5E697047A90D086B5A66459FC67D7B02E43AAEF701864E360BF1829A8892B3A1_1576003655184_image.png)


I. Architecture


- Encoder: alternating Conv2D and Max-Pool layers


![Encoder](https://paper-attachments.dropbox.com/s_5E697047A90D086B5A66459FC67D7B02E43AAEF701864E360BF1829A8892B3A1_1576017966901_00.png)

- Decoder: alternating Upsampling & Conv2D layers
![Decoder](https://paper-attachments.dropbox.com/s_5E697047A90D086B5A66459FC67D7B02E43AAEF701864E360BF1829A8892B3A1_1576018012513_00.png)


Results


![After 10 epochs](https://paper-attachments.dropbox.com/s_5E697047A90D086B5A66459FC67D7B02E43AAEF701864E360BF1829A8892B3A1_1575922194601_image.png)

![After 20 epochs](https://paper-attachments.dropbox.com/s_5E697047A90D086B5A66459FC67D7B02E43AAEF701864E360BF1829A8892B3A1_1575923562430_image.png)

![After 50 epochs](https://paper-attachments.dropbox.com/s_5E697047A90D086B5A66459FC67D7B02E43AAEF701864E360BF1829A8892B3A1_1575936668740_image.png)


Observations & Future work


- 256x256x3 = 196608 → 8x8x1 = 64!
        - Pretty good for a compression factor of 3072x 🙂
        - First “layer” of VQ-VAE-2

- 3,988 trainable parameters


- Thanks to CY for training suggestions & discussion
    - Box filter trick
    - Double number of filters every time stride decreases resolution
    - Spatial → semantic information
    - Train on 1 image first

- Working in YCrCb color space

II.  Architecture


- Encoder: Conv2D layers, increasing number of filters
![Encoder](https://paper-attachments.dropbox.com/s_5E697047A90D086B5A66459FC67D7B02E43AAEF701864E360BF1829A8892B3A1_1576018477765_image.png)

- Decoder: Conv2DTranspose layers, increasing number of filters
![Decoder](https://paper-attachments.dropbox.com/s_5E697047A90D086B5A66459FC67D7B02E43AAEF701864E360BF1829A8892B3A1_1576018559759_01_decoder.png)


Results

![After 10 epochs](https://paper-attachments.dropbox.com/s_5E697047A90D086B5A66459FC67D7B02E43AAEF701864E360BF1829A8892B3A1_1575950656802_image.png)

![After 20 epochs](https://paper-attachments.dropbox.com/s_5E697047A90D086B5A66459FC67D7B02E43AAEF701864E360BF1829A8892B3A1_1575951211732_image.png)

![After 50 epochs](https://paper-attachments.dropbox.com/s_5E697047A90D086B5A66459FC67D7B02E43AAEF701864E360BF1829A8892B3A1_1575952766576_image.png)

![After 80 epochs](https://paper-attachments.dropbox.com/s_5E697047A90D086B5A66459FC67D7B02E43AAEF701864E360BF1829A8892B3A1_1575955010293_image.png)

![After 125 epochs](https://paper-attachments.dropbox.com/s_5E697047A90D086B5A66459FC67D7B02E43AAEF701864E360BF1829A8892B3A1_1576008355027_image.png)

![After 180 epochs](https://paper-attachments.dropbox.com/s_5E697047A90D086B5A66459FC67D7B02E43AAEF701864E360BF1829A8892B3A1_1576010778077_image.png)

![After 250 epochs](https://paper-attachments.dropbox.com/s_5E697047A90D086B5A66459FC67D7B02E43AAEF701864E360BF1829A8892B3A1_1576013427906_image.png)

![After 340 epochs](https://paper-attachments.dropbox.com/s_5E697047A90D086B5A66459FC67D7B02E43AAEF701864E360BF1829A8892B3A1_1576019701785_image.png)

![After 350 epochs](https://paper-attachments.dropbox.com/s_5E697047A90D086B5A66459FC67D7B02E43AAEF701864E360BF1829A8892B3A1_1576021796918_image.png)


Observations


- 256x256x3 = 196608 → 2048! Compression factor 96x


- Using Transposed Convolution > Upsampling for color?


- 168,931 trainable parameters


## Convolutional Variational Autoencoder (CVAE)

Theory


- Map input to a distribution instead of a fixed vector
- Latent space is continuous by design → good for sampling & interpolation
- Reparametrization trick
![Variational Autoencoder Model, Source: https://lilianweng.github.io/lil-log/2018/08/12/from-autoencoder-to-beta-vae.html](https://lilianweng.github.io/lil-log/assets/images/vae-gaussian.png)



## Vector Quantized Variational Autoencoder (VQ-VAE)

Theory


- Encoder learns a discrete latent variable
- Vector Quantization = map K-dimensional vectors to a codebook
![VQ-VAE Architecture,  Source: “Neural Discrete Representation Learning” by van den Oord et al. 2017](https://lilianweng.github.io/lil-log/assets/images/VQ-VAE.png)



## Vector Quantized Variational Autoencoder 2 (VQ-VAE-2)

Theory


- Stage 1: train hierarchical VQ-VAE
- Stage 2: learn prior over latent discrete code book, decoder gets input vectors sampled from a learned distribution that approximates the one used in training


![Figs 2 & 3 from “Generating Diverse High-Fidelity Images with VQ-VAE-2” by Razavi et al. 2019](https://paper-attachments.dropbox.com/s_5E697047A90D086B5A66459FC67D7B02E43AAEF701864E360BF1829A8892B3A1_1576008213838_vq-vae-2-architecture.png)


PyTorch Implementation on Github

- By rosinality https://github.com/rosinality/vq-vae-2-pytorch
- 256 x 256 images
- 2 layers — top and bottom

Training Progress

- Stage 1: Trained hierarchical vq-vae model
- Extracted codes for stage 2 (training strong prior conditioned on class labels)
- Stage 2: Could not train  → no results to show 😞
    - Runtime: CUDA out of memory error (allocating top & bottom models)
    - (aside: debugging using tools you are not familiar with is challenging)
## StyleGAN (Runway ML)

Theory

- Generative Adversarial Networks (Generator + Discriminator)
- An extension of Progressive GANs (ProGAN) with more control over latent space
- Mapping network to control different visual features

Training Progress


- Sample results, 1500 training steps
![Using RunwayML StyleGAN](https://runway-training-samples.s3.amazonaws.com/a71c512f-ca02-473b-8d20-d8c136d82cbc.jpg)

https://www.dropbox.com/s/0yln4v3bsls1vc2/runway-style-gan-latent-space.mp4?dl=0


[Google drive video upload](https://drive.google.com/open?id=1hMJv08Smu-NRCNs_BA0Sc7c3NmJKuFDL)

Takeaways


- Infrastructure challenges → Need for better tools & more time
    - Relying on “out-of-the-box” models
    - Benefits of working more iteratively → in hindsight would have done CVAE


- Gratitude for good tools — Google Colab, RunwayML (aside: ML for creators)
    - Tools for automation, exposing fewer and effective parameters “Some Reflections on Designing Construction Kits for Kids” by Resnick & Silverman 2005


- Similarities effective generative models → Comparing StyleGAN and VQ-VAE-2
    - Hierarchical training
    - Structuring latent space
    - Feature disentanglement dependent on probability density in training data

- Revisiting the data to complete this project → latent space exploration


- Exposing good endpoints for working with effective generative models for creativity support


- Learnable Machine Learning
    - “Software Developers Learning Machine Learning: Motivations, Hurdles, and Desires” by Cai & Guo 2019
    - Explaining basic architecture decisions (aside: explainable ML)


## Thank you!

(Questions / feedback appreciated.)


## Sources

*Small Bouquet of Flowers in a Ceramic* by Jan Brueghel the Elder 1599, [https://commons.wikimedia.org/wiki/File:Jan_Bruegel_(I)__Bouquet_of_Flowers_in_a_Ceramic_Vase.jpg](https://commons.wikimedia.org/wiki/File:Jan_Bruegel_(I)_-_Bouquet_of_Flowers_in_a_Ceramic_Vase.jpg).

*Machine Learning Art: An Interview With Memo Akten* by Renée Zachariou & Memo Akten 2018, https://www.artnome.com/news/2018/12/13/machine-learning-art-an-interview-with-memo-akten.

Oxford Visual Geometry Group: 17 Category Flower Data Set 2008, https://www.robots.ox.ac.uk/~vgg/data/flowers/17/index.html.

*From Autoencoder to Beta VAE* by Lilian Weng 2019, https://lilianweng.github.io/lil-log/2018/08/12/from-autoencoder-to-beta-vae.html.

*Auto-Encoding Variational Bayes* by Kingma & Welling 2014, https://arxiv.org/abs/1312.6114.

*Neural Discrete Representation* by van den Oord et al. 2017, https://arxiv.org/abs/1711.00937.

*Generating Diverse High-Fidelity Images with VQ-VAE-2* by Razavi et al. 2019, https://arxiv.org/abs/1906.00446.

vq-vae-2-pytorch by Rosinality 2019, https://github.com/rosinality/vq-vae-2-pytorch.

*A Style-Based Generator Architecture for Generative Adversarial Networks* by Karras et al. 2018, https://arxiv.org/abs/1812.04948.

Computational resources from RunwayML, Google Colab, and AWS.

##
