# caffrizer
Data Science project Analyzing Artwork

Introduction
------------
For this project at the Data incubator I would like to work on analysing art from the great masters of the art world.
The great variety of visual effects artist can generate with the same media and colour palette is truly fascinating. I also find it fascinating how individual techniques lend emotional meaning to a piece of art.
 
Digital image processing allows us to analyse images of these pieces of art. Computational power is inexpensive enough to allow
real time processing of images, resulting in products such as virtual reality, augmented reality and machine vision. Image processing
treats input images as matrices of data, corresponding to spatial and color information. Therefore it is possible to extend the
principles of image processing such as feature extraction, color pallette analysis and decomposition to determine the constituent
"character" of an image. This can then be used to digitally re-create artwork in the style of the great masters; an image-filter for Vermeer, for example.
I believe demand for such artwork will not only be for individual or personal use, but more so in the commercial graphic design space where clients require unique and personalised art as opposed to "stock-image" like art.

Data Source
-----------
Creating the input data for this project is as much a challenge as the analysis.
Few museums allow access to an online database which includes high resoluion images.
As a first step, I have used the The Web Gallery of Art [database](https://www.wga.hu/index1.html) which contains details of paintings.
I used an R script to scrape the image of each painting from the web, followed by color palette analysis.

The following graphs show the breakup of available paintings by type and time frame.
Feature extraction and color pallete analysis coming soon.

![Paintings by Genre](/graphs/PaintingsByGenre.png?raw=true "Paintings by Genre")
![Paintings by Genre](/graphs/Paintings_by_year.png?raw=true "Paintings by Genre")
![Paintings by Genre](/graphs/Painting_Types_by_Year.png?raw=true "Paintings by Genre")





