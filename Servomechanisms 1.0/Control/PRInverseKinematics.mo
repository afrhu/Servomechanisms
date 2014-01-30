within Servomechanisms.Control;
block PRInverseKinematics "Generic equation of a Prismatic-Rotational mechanism inverse kinematics"
  //Import Libraries
  import Modelica.Math.*;
  //Inheritance
  extends Modelica.Blocks.Interfaces.MIMO(nin = 2, nout = 2);
  //Parameters
  parameter Real l1 = 1 "length of link 1";
  parameter Real l2 = 1 "length of link 2";
equation
  //Rotational
  //y[2] = asin(u[2] / l2);
  y[2] = atan2(u[2], sqrt(l2 ^ 2 - u[2] ^ 2));
  //Prismatic
  //y[1] = u[1] - l1 - l2 * cos(y[2]);
  y[1] = u[1] - l1 - sqrt(l2 ^ 2 - u[2] ^ 2);
  annotation(Icon(coordinateSystem(extent = {{-100,-100},{100,100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2,2}), graphics = {Rectangle(origin = {-37.9859,-9.18728}, fillColor = {128,128,128}, fillPattern = FillPattern.HorizontalCylinder, lineThickness = 1, extent = {{-60,10},{60,-10}}),Rectangle(origin = {56.2191,22.4735}, rotation = 45, fillColor = {128,128,128}, fillPattern = FillPattern.HorizontalCylinder, lineThickness = 1, extent = {{-50,10},{50,-10}}),Ellipse(origin = {20.8481,-7.77385}, fillColor = {128,128,128}, fillPattern = FillPattern.Sphere, lineThickness = 1, extent = {{-20,20},{20,-20}}, endAngle = 360),Line(origin = {-85.159,-25.6184}, points = {{0,0},{60,0}}, thickness = 1),Line(origin = {-92.3675,-45.901}, rotation = 45, points = {{0,0},{30,0}}, thickness = 1),Line(origin = {-77.6678,-47.1025}, rotation = 45, points = {{0,0},{30,0}}, thickness = 1),Line(origin = {-60.1413,-47.2438}, rotation = 45, points = {{0,0},{30,0}}, thickness = 1),Rectangle(origin = {-56.6431,-11.2367}, fillColor = {128,128,128}, fillPattern = FillPattern.HorizontalCylinder, lineThickness = 1, extent = {{-25,20},{25,-20}}),Rectangle(origin = {-15.6537,-8.76325}, fillColor = {128,128,128}, fillPattern = FillPattern.HorizontalCylinder, lineThickness = 1, extent = {{-60,10},{-21.6254,-1.51943}})}));
  annotation(Documentation(info = "<html>
<head>
<style type=\"text/css\">
h4      { border-radius:8%;background-color: #D8D8D8 ;}
</style>
</head>

<h4>General</h4>
<p>
With this block the inverse kinematics of prismatic-rotational mechanism given the specifications of PR model is obtain
<a href=\"modelica://Servomechanisms.Mechanism.PR\">Servomechanisms.Mechanism.PR</a>.
</p>

<h4>Implementation</h4>
<p>
It inherits the real interfaces from the block for multiple inputs and multiple outputs 
<a href=\"modelica://Modelica.Blocks.Interfaces.MIMO\">Modelica.Blocks.Interfaces.MIMO</a> 
</p>
<p>
The joint variables are determine by:
</p>
<img src=\"modelica://Servomechanisms/Resources/Images/Control/prinverseequation.png\"/>

<h4>Notes</h4>
<ul>
<li>
The input is an array <b>u</b> where <b>u[1]</b> is the x coordinate and <b>u[2]</b> is the y coordinate of a trayectory located at final frame of the second link.
To connect a signal to the intput u the user must input the index of the array (1 or 2).
</li>
<li>
The output is an array <b>y</b> where <b>y[1]</b> is the first joint coordinate and <b>y[2]</b> is the second joint coordinate.
To connect the output y to other component the user must input the index of the array (1 or 2).
</li>
</ul>

</html>"));
end PRInverseKinematics;

