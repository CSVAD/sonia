## Final Project Proposal

### Learnable Machine Learning

Build a library for learnable machine learning using TensorFlow.js and p5.js. I think this would extend beyond a two-week course project, but one possible stopping point would be to be able to go between modifying a graphical representation and an actual model.

[Visualization in Deep Learning by Fred Hohman](https://medium.com/multiple-views-visualization-research-explained/visualization-in-deep-learning-b29f0ec4f136)
- Blog post

[TensorFlow.js](https://www.tensorflow.org/js/)

[ml5.js](https://ml5js.org/)
- Library that creates an interface to TensorFlow.js and incorporates p5.js
- By Daniel Shiffman & NYU Interactive Telecommunications/Interactive Media Arts

Examples of NN Visualizations

[Keras.js](https://transcranial.github.io/keras-js/#/mnist-cnn)
- Main inspiration for this project

[Playground Tensorflow](https://playground.tensorflow.org/#activation=tanh&batchSize=10&dataset=circle&regDataset=reg-plane&learningRate=0.03&regularizationRate=0&noise=0&networkShape=4,2&seed=0.36331&showTestData=false&discretize=false&percTrainData=50&x=true&y=true&xTimesY=false&xSquared=false&ySquared=false&cosX=false&sinX=false&cosY=false&sinY=false&collectStats=false&problem=classification&initZero=false&hideText=false)
- Example of a simple NN but nicely done

[NN-SVG](http://alexlenail.me/NN-SVG/index.html)
- Good tool to build diagrams

- Inspired by...

[Reflections on Designing Construction Kits for Kids by Mitchel Resnick & Brian Silverman](http://csvad.mat.ucsb.edu/readings/IDC-2005.pdf)

[Learnable Programming by Bret Victor](http://worrydream.com/LearnableProgramming/)

[Software Developers Learning Machine Learning: Motivations, Hurdles, and Desires by Cai & Guo](http://pgbovine.net/publications/software-developers-learning-machine-learning_VLHCC-2019.pdf)


### Variational Autoencoders

Train VQ-VAE (Vector Quantized Variational Autoencoder) on images of flowers to use latent space interpolation to synthesize flowers that do not exist. Use image segmentation to extract flower and arrange in still life composition inspired by 17th c. Dutch Floral Paintings.

[VQ-VAE](https://arxiv.org/pdf/1711.00937.pdf)
- 2017 van den Oord et. al "Neural Discrete Representation Learning"

[VQ-VAE-2](https://arxiv.org/pdf/1906.00446.pdf)
- 2019 Razavi et. al "Generating High-Fidelity Images with VQ-VAE-2"

[Flowers Recognition](https://www.kaggle.com/alxmamaev/flowers-recognition)
- 5 classes: chamomile, tulip, rose, sunflower dandelion
- More variegated than I would like per class

[Flowers Dataset UK](https://www.robots.ox.ac.uk/~vgg/data/flowers/)
- 17 classes: Buttercup, Colet's Foot, Daffodil, Daisy, Dandelion, Friitillary, Iris, Pansy, Sunflower, Windflower, Snowdrop, LilyValley, Bluebell, Tigerlily, Tulip, Cowslip
- Closer to the kinds of flowers I would like to create

[Small Bouquet of Flowers in a Ceramic, 1599 by Jan Brueghel the Elder](Small Bouquet of Flowers in a Ceramic)

[Interview with Memo Akten](https://www.artnome.com/news/2018/12/13/machine-learning-art-an-interview-with-memo-akten)
- How does this work function conceptually?
- Limitations: Latent space defined by previously seen images. Limited by what you have already seen.

### Singing agents

Extend my week 5 project, radial agents, to create a design tool that responds to a person's drawings where both the program and the user respond to sound. The tool is flexible in terms of the mappings between the agents and their presence to the user and what types of brushes are used and sound is recorded as objects are drawn. In its final form, this could form an interactive installation where one person (the programmer) composes settings and then people participate in drawing or reacting to a particular set of sounds. It could also be individual.

[My Week 5 Project -- Radial Agents](https://github.com/CSVAD/sonia/blob/master/projects/week5/radialagents.md)

[Omnia per Omnia by Sougwen Chung](https://sougwen.com/project/omniaperomnia)

[Singing Fingers by Eric Rosenbaum and Ray Silver @ MIT Media Lifelong Kindergarten](http://singingfingers.com/)

[Processing Sound Libraries](https://processing.org/reference/libraries/#sound)

### Behavior / RL Project... going off the deep end...

- This is just a personal note for a project beyond the scope of this course.

[Stop Drawing Dead Fish](https://vimeo.com/64895205)
