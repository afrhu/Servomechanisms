within Servomechanisms.Control;
model CircleTrayectory "Generate the trayectory of a circle from parametric equations"
  //Inheritance
  extends Modelica.Blocks.Interfaces.MO(nout = 2);
  //Icon
  extends Servomechanisms.Utilities.IconXY;
  //Parameters
  parameter SI.Distance r = 1 "radius of circle";
  parameter SI.Distance xc = 0 "x coordinate of center of circle";
  parameter SI.Distance yc = 0 "y coordinate of center of circle";
  parameter SI.Time period = 1 "time to complete 1 revolution";
  parameter SI.Time startTime = 0 "start time";
  Real paso = 2 * Const.pi / period "factor";
equation
  if time >= startTime then
    y[1] = r * Modelica.Math.cos(paso * (time - startTime)) + xc;
    y[2] = r * Modelica.Math.sin(paso * (time - startTime)) + yc;
  else
    y[2] = yc;
    y[1] = r + xc;
  end if;
  //kinematicPTP.q[2];
  //kinematicPTP.q[1];
  //x coordinate
  //y coordinate
  annotation(Diagram(coordinateSystem(extent = {{-100,-100},{100,100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2,2})), Documentation(info = "
<html>
<head>
<style type=\"text/css\">
h4      { border-radius:8%;background-color: #D8D8D8 ;}
</style>
</head>

<h4>General</h4>
<p>
This blocks generates the x and y coordinates of a circle trayectory with the circle parametric equation.
</p>

<h4>Implementation</h4>
<p>
It inherits the real interfaces from the block for multiple outputs 
<a href=\"modelica://Modelica.Blocks.Interfaces.MO\">Modelica.Blocks.Interfaces.MO</a> 
</p>
<p>
The parametric equations implemented are:
</p>
<img src=\"modelica://Servomechanisms/Resources/Images/Control/circleequation.png\" alt=\"circleequation.png\" >
<p>
r: radius, T:period, xc and yc : x and y coordinates of the center, t0: start time.
</p>
<h4>Notes</h4>
<ul>
<li>
The output is an array <b>y</b> where <b>y[1]</b> is the x coordinate and <b>y[2]</b> is the y coordinate.
</li>
<li>
To connect the output to other component the user must input the index of the array (1 or 2).
</li>
<li>
The user can change the radius, center and the time to complete the circle trayectory by changing the parameters of the block.
</li>
</ul>

<h4>Example</h4>
<p>
With the default parameters the plot results will be:
</p>
<img src=\"modelica://Servomechanisms/Resources/Images/Control/circletrayectory01.png\">
<p>
and with plot parametric:
</p>
<img src=\"modelica://Servomechanisms/Resources/Images/Control/circletrayectory02.png\">
</html>"), Icon(coordinateSystem(extent = {{-100,-100},{100,100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2,2}), graphics = {Ellipse(origin = {4.21546,3.74707}, lineColor = {255,0,0}, lineThickness = 1, extent = {{-60,60},{60,-60}}, endAngle = 360)}));
end CircleTrayectory;

