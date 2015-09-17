within Servomechanisms.Control;
model RPInversekinematics "Generic equation of a Rotational-Prismatic mechanism inverse kinematics"
  //Import Libraries
  import Modelica.Math.*;
  //Inheritance
  extends Modelica.Blocks.Interfaces.MIMO(nin = 2, nout = 2);
  //Parameters
  parameter Real l1 = 1 "length of link 1";
  parameter Real l2 = 1 "length of link 2";
equation
  //Prismatic
  y[2] = sqrt(u[1] ^ 2 + u[2] ^ 2) - l1 - l2;
  //Rotational
  y[1] = atan2(u[2], u[1]);
  //acos(u[1] / (l1 + l2 + y[2]));
  annotation(Icon(coordinateSystem(extent = {{-100,-100},{100,100}}, preserveAspectRatio = true, grid = {2,2}), graphics = {Rectangle(origin = {-20.4946,-21.2014}, rotation = 45, fillColor = {128,128,128}, fillPattern = FillPattern.HorizontalCylinder, lineThickness = 1, extent = {{-80,-20},{80,20}}),Rectangle(origin = {31.3075,31.3075}, rotation = 45, fillColor = {128,128,128}, fillPattern = FillPattern.HorizontalCylinder, lineThickness = 1, extent = {{-80,-10},{80,10}}),Ellipse(origin = {-69.7526,-70.1059}, fillColor = {128,128,128}, fillPattern = FillPattern.Sphere, lineThickness = 1, extent = {{-24.3816,23.6749},{24.0282,-23.3215}}, endAngle = 360),Rectangle(origin = {6.18375,6.00707}, rotation = 45, fillColor = {128,128,128}, fillPattern = FillPattern.HorizontalCylinder, lineThickness = 1, extent = {{-25,15},{25,-15}}),Rectangle(origin = {-20.424,-22.5441}, rotation = 45, fillColor = {128,128,128}, fillPattern = FillPattern.HorizontalCylinder, lineThickness = 1, extent = {{17.6957,-2.25431},{58.5119,10.4997}})}));
  annotation(Documentation(info = "<html>
<head>
<style type=\"text/css\">
h4      { border-radius:8%;background-color: #D8D8D8 ;}
</style>
</head>

<h4>General</h4>
<p>
With this block the inverse kinematics of rotational-prismatic mechanism given the specifications of RP model is obtain
<a href=\"modelica://Servomechanisms.Mechanism.RP\">Servomechanisms.Mechanism.RP</a>.
</p>

<h4>Implementation</h4>
<p>
It inherits the real interfaces from the block for multiple inputs and multiple outputs
<a href=\"modelica://Modelica.Blocks.Interfaces.MIMO\">Modelica.Blocks.Interfaces.MIMO</a>
</p>
<p>
The joint variables are determine by (the zero of prismatic joint is located at the end of link 1):
</p>
<img src=\"modelica://Servomechanisms/Resources/Images/Control/rpinverseequation.png\"/>

<h4>Notes</h4>
<ul>
<li>
The input is an array <b>u</b> where <b>u[1]</b> is the x coordinate and <b>u[2]</b> is the y coordinate of a trajectory located at final frame of the second link.
To connect a signal to the intput u the user must input the index of the array (1 or 2).
</li>
<li>
The output is an array <b>y</b> where <b>y[1]</b> is the first joint coordinate and <b>y[2]</b> is the second joint coordinate.
To connect the output y to other component the user must input the index of the array (1 or 2).
</li>
</ul>

</html>"));
end RPInversekinematics;

