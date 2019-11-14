## Final Project Proposal

### I. ML + Processing

I know tensorflow is available in Java and JS. I could write a library for either Processing or p5.js that makes it possible to quickly integrate neural nets into your code to either learn based on the output of your code or use popular pre-trained networks. My concern is that this will not be useful (either too much low level functionality will be exposed or not enough) and that people would be better off just learning how to integrate tensorflow directly. Also there is a library in js that does this (but my approach would be distinct) ml5.js.

### II. Learning to See Redux

I keep revisiting Memo Akten's piece Learning to See. I'm thinking about creating a version that runs in the browser so people can arrange different primitives or use web cam input to output results. This would be done using p5.js and tensorflow.js. This would of course be a tribute to Memo's work, and I would like to combine elements of Sougwen Chen's use of autonomous agents. I would also ask people to write what they see and incorporate this into the output.

### III. Sound Compositions

This project would be in between the generative series and working on a creative tool that does not require programming in processing to use. I would like to invite people to participate in creating each piece. Each one would be a reaction to a particular set of sounds. For my week 5 project, my goal was to create a drawing tool where both the tool and artist respond to sound. I think I could refine the mappings to better match sound to the visual aspect of the end result and expand the tool beyond its current limitations (right now it only uses radials) and expand the amount of control the artist / user has on their own composition. The idea of creating an interface where people are able to feel and express themselves using their hands is another motivation for this project. In particular, I'd also like to extend this tool to focus on sound impacting light -- I'm not quite suire what this will look like yet.


### Maybe later...

### IV. Behavior

This extends beyond the project scope but at first I was thinking about writing a library to modify how events are handled so it's easier to assign gestures / build upon them quickly and attach them to particular objects. Another idea is to simply create a way to quickly add "creatures" and reactions to other creatures in the space (along with collision detection, movements etc) to create a large interactive system where people could contribute their own creations. I think this would extensive require familiarization with the pre-existing event handling and animation libraries that processing already has. A more interesting extension of this project would be to train reactions and behavior of each agent in the system in response to other agents. It would be feasible to generate a complex set of interactions and behaviors.

### V. Globals

I'm not sure if this undermines some of the intended functionality of Processing but as stated in Bret Victor's critique, the use of global state limits the "tinkerability" of processing. Not only is it difficult to quickly refactor code, but it also limits the ability to combine code from different sources. I think I could write a library designed to make some attributes, like color, stroke, and transformations attached to specific objects and change the way that they are innately handled.

### VI. Halftones

I think it would be possible and interesting to write a library that simulates halftone printing in processing. Several parameters could be exposed to the end user to customize the appearance of their final project.
