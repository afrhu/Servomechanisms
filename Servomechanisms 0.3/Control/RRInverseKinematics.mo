within Servomechanisms.Control;
block RRInverseKinematics "Generic equation of a 2R mechanism inverse kinematics"
  //Import Libraries
  import Modelica.Math.*;
  //Inheritance
  extends Modelica.Blocks.Interfaces.MIMO(nin = 2, nout = 2);
  //Parameters
  parameter Real l1 = 1 "length of link 1";
  parameter Real l2 = 1 "length of link 2";
  parameter Real elbow = 1 "elbow direction: 1 (elbow up), -1 (elbow down)";
equation
  //Rotational 2
  y[2] = acos((u[1] ^ 2 + u[2] ^ 2 - l1 ^ 2 - l2 ^ 2) / (2 * l1 * l2));
  //Rotational 1
  y[1] = atan2(u[2], u[1]) - atan2(l2 * sin(y[2]), l1 + l2 * cos(y[2]));
  annotation(Documentation(info = "<html>
<head>
<style type=\"text/css\">
h4      { border-radius:8%;background-color: #D8D8D8 ;}
</style>
</head>

<h4>General</h4>
<p>
With this block the inverse kinematics of rotational-rotational mechanism given the specifications of RR model is obtain
<a href=\"modelica://Servomechanisms.Mechanism.RR\">Servomechanisms.Mechanism.RR</a>.
</p>

<h4>Implementation</h4>
<p>
It inherits the real interfaces from the block for multiple inputs and multiple outputs 
<a href=\"modelica://Modelica.Blocks.Interfaces.MIMO\">Modelica.Blocks.Interfaces.MIMO</a> 

<p>
The joint variables are determine by:
<img src=\"modelica://Servomechanisms/Resources/Images/Control/rrinversekinematics01.png\"/>
<img src=\"modelica://Servomechanisms/Resources/Images/Control/rrinversekinematics02.png\"/>
</p>

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
</html>"), Icon(coordinateSystem(extent = {{-100,-100},{100,100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2,2}), graphics = {Rectangle(origin = {-27.7385,20.1413}, rotation = 45, fillColor = {128,128,128}, fillPattern = FillPattern.HorizontalCylinder, lineThickness = 1, extent = {{-46.4664,9.54064},{47.1731,-4.59364}}),Rectangle(origin = {33.2509,22.8269}, rotation = -45, fillColor = {128,128,128}, fillPattern = FillPattern.HorizontalCylinder, lineThickness = 1, extent = {{-46.4664,9.54064},{47.1731,-4.59364}}),Ellipse(origin = {-61.8375,-11.1307}, fillColor = {128,128,128}, fillPattern = FillPattern.HorizontalCylinder, lineThickness = 1, extent = {{-15,15},{15,-15}}, endAngle = 360),Ellipse(origin = {3.74558,52.6855}, fillColor = {128,128,128}, fillPattern = FillPattern.HorizontalCylinder, lineThickness = 1, extent = {{-15,15},{15,-15}}, endAngle = 360),Ellipse(origin = {-62.1201,-11.0601}, fillColor = {128,128,128}, fillPattern = FillPattern.Solid, lineThickness = 1, extent = {{-7,7},{7,-7}}, endAngle = 360),Ellipse(origin = {3.4629,52.7562}, fillColor = {128,128,128}, fillPattern = FillPattern.Solid, lineThickness = 1, extent = {{-7,7},{7,-7}}, endAngle = 360)}));
end RRInverseKinematics;

