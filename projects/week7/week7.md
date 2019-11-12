### Processing Library

*What is are the goals of your library? (What is it intended to help people do and why?)*

The goal of the library is to provide a grid that can be customized based on a project's needs and used in development as an alignment tool.

*What approaches do you provide for people to accomplish those goals (i.e. what are the methods you expose to the person using the library)?*

public void drawGrid()

public void setShowGridTo(boolean \_showGrid)

public void setShowHorizontalTo(boolean \_showHorizontal)

public void setShowVerticalTo(boolean \_showVertical)

public void setShowRadialTo(boolean \_showRadial)

public void setShowAngularTo(boolean \_showAngular)

public void setUseThicknessVariationTo(boolean \_useThicknessVariation)

public void setGridLineColorTo(int \_gridLineColor)

public void setGridStrokeAlphaTo(float \_gridStrokeAlpha)

public void setGridLineBaseThicknessTo(float \_gridLineBaseThickness)

public void setGridRadialSpacingTo(int \_gridRadialSpacing)

public void setGridIntervalTo(int \_gridInterval)

public void setGridAngularIntervalTo(float \_gridAngularInterval)

public void setUseXYTo(boolean \_useXY)

public void setUseRadialTo(boolean \_useRadial)


*What key terminology did you use for your library (i.e. function, class, and property names). How did you select this terminology?*

I tried to follow naming conventions presented in one of Bret Victor's essays to make the meaning as clear and easy to follow as possible. I also tried to follow the Resnick principle of keeping things as simple as possible (the default grid can be drawn just using showGrid) and having wide walls (there are many things you can do to modify the grid, but the relative complexity does not increase all that much). In the end, I focused on trying to integrate some of the ideas we've covered in class about learnability as opposed to creating complex functionality. 
