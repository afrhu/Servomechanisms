within Servomechanisms.Control;
block FlowerTrayectory "Generate the trayectory of a flower from parametric equations"
  //Libraries needed
  import Modelica.Math.*;
  //Inheritance
  extends Modelica.Blocks.Interfaces.MO(nout = 2);
  //Icon
  extends Servomechanisms.Utilities.IconXY;
  //Parameters
  parameter SI.Distance a = 0.75 "height of figure";
  parameter SI.Distance xc = 0 "x coordinate of center of figure";
  parameter SI.Distance yc = 0 "y coordinate of center of figure";
  parameter SI.Time period = 1 "period";
  parameter SI.Time startTime = 0 "start time";
  Real b = 2 * Const.pi / period "factor";
equation
  if time >= startTime then
    y[2] = a * 3 * sqrt(3) * sin(2 * b * (time - startTime)) * cos(b * (time - startTime)) / 4 + yc;
    y[1] = a * 3 * sqrt(3) * sin(2 * b * (time - startTime)) * sin(b * (time - startTime)) / 4 + xc;
  else
    y[2] = yc;
    y[1] = xc;
  end if;
  annotation(Documentation(info = "
<html>
<head>
<style type=\"text/css\">
h4      { border-radius:8%;background-color: #D8D8D8 ;}
</style>
</head>

<h4>General</h4>
<p>
This blocks generates the x and y coordinates of a flower trayectory with the quadrifolium parametric equation.
</p>

<h4>Implementation</h4>
<p>
It inherits the real interfaces from the block for multiple outputs 
<a href=\"modelica://Modelica.Blocks.Interfaces.MO\">Modelica.Blocks.Interfaces.MO</a> 
.
</p>
<p>
The parametric equations implemented are:
</p>
<img src=\"modelica://Servomechanisms/Resources/Images/Control/flowerequation.png\" alt=\"flowerequation.png\" >
<p>
a: height, b:2pi/T, T:period, xc and yc : x and y coordinates of the center, t0: start time.
</p>

<h4>Notes</h4>
<ul>
<li>
The output is an array <b>y</b> where <b>y[1]</b> is the x coordinate and <b>y[2]</b> is the y coordinate.
To connect the output to other component the user must input the index of the array (1 or 2).
</li>
<li>
The user can change the radius, center, start time and period to complete the trayectory by changing the parameters of the block.
</li>
</ul>


<h4>Example</h4>
<p>
With the default parameters the plot results will be:
</p>
<img src=\"modelica://Servomechanisms/Resources/Images/Control/flowerTrayectory01.png\">
<p>
and with plot parametric:
</p>
<img src=\"modelica://Servomechanisms/Resources/Images/Control/flowerTrayectory02.png\">
</html>"), Icon(coordinateSystem(extent = {{-100,-100},{100,100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2,2}), graphics = {Line(points = {{0,0},{2.024,16.03},{7.782,30.31},{16.37,41.34},{26.42,48.06},{36.31,49.98},{44.37,47.25},{49.16,40.67},{49.62,31.49},{45.28,21.31},{36.31,11.8},{23.49,4.48},{8.125,0.5112},{0,0}}, color = {255,0,0}, thickness = 1, smooth = Smooth.Bezier),Line(rotation = -90, points = {{0,0},{2.024,16.03},{7.782,30.31},{16.37,41.34},{26.42,48.06},{36.31,49.98},{44.37,47.25},{49.16,40.67},{49.62,31.49},{45.28,21.31},{36.31,11.8},{23.49,4.48},{8.125,0.5112},{0,0}}, color = {255,0,0}, thickness = 1, smooth = Smooth.Bezier),Line(rotation = 90, points = {{0,0},{2.024,16.03},{7.782,30.31},{16.37,41.34},{26.42,48.06},{36.31,49.98},{44.37,47.25},{49.16,40.67},{49.62,31.49},{45.28,21.31},{36.31,11.8},{23.49,4.48},{8.125,0.5112},{0,0}}, color = {255,0,0}, thickness = 1, smooth = Smooth.Bezier),Line(rotation = 180, points = {{0,0},{2.024,16.03},{7.782,30.31},{16.37,41.34},{26.42,48.06},{36.31,49.98},{44.37,47.25},{49.16,40.67},{49.62,31.49},{45.28,21.31},{36.31,11.8},{23.49,4.48},{8.125,0.5112},{0,0}}, color = {255,0,0}, thickness = 1, smooth = Smooth.Bezier)}));
end FlowerTrayectory;

