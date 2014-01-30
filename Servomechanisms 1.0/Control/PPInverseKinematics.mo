within Servomechanisms.Control;
block PPInverseKinematics
  //Import Libraries
  import Modelica.Math.*;
  //Inheritance
  extends Modelica.Blocks.Interfaces.MIMO(nin = 2, nout = 2);
  //Parameters
  parameter Real l1 = 1 "length of link 1";
  parameter Real l2 = 1 "length of link 2";
equation
  y[1] = u[1] - l1;
  y[2] = u[2] - l2;
  annotation(Icon(coordinateSystem(extent = {{-100,-100},{100,100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2,2}), graphics = {Rectangle(origin = {-6.89046,-56.8905}, fillColor = {128,128,128}, fillPattern = FillPattern.HorizontalCylinder, lineThickness = 1, extent = {{-80,10},{80,-10}}),Rectangle(origin = {30.0707,-2.61484}, rotation = 90, fillColor = {128,128,128}, fillPattern = FillPattern.HorizontalCylinder, lineThickness = 1, extent = {{-80,10},{80,-10}}),Rectangle(origin = {-47.6678,-56.3251}, fillColor = {128,128,128}, fillPattern = FillPattern.HorizontalCylinder, lineThickness = 1, extent = {{-25,20},{25,-20}}),Rectangle(origin = {29.2226,-47.6325}, rotation = 90, fillColor = {128,128,128}, fillPattern = FillPattern.HorizontalCylinder, lineThickness = 1, extent = {{-25,20},{25,-20}}),Rectangle(origin = {13.1095,-56.6784}, fillColor = {128,128,128}, fillPattern = FillPattern.HorizontalCylinder, lineThickness = 1, extent = {{-80,10},{-42.6148,-2.22615}}),Rectangle(origin = {30.9894,11.7314}, rotation = 90, fillColor = {128,128,128}, fillPattern = FillPattern.HorizontalCylinder, lineThickness = 1, extent = {{-80,10},{-42.6148,-2.22615}})}));
  annotation(Documentation(info = "<html>
<head>
<style type=\"text/css\">
h4      { border-radius:8%;background-color: #D8D8D8 ;}
</style>
</head>

<h4>General</h4>
<p>
With this block the inverse kinematics of rotational-rotational mechanism given the specifications of PP model is obtain
<a href=\"modelica://Servomechanisms.Mechanism.PP\">Servomechanisms.Mechanism.PP</a>.
</p>

<h4>Implementation</h4>
<p>
It inherits the real interfaces from the block for multiple inputs and multiple outputs 
<a href=\"modelica://Modelica.Blocks.Interfaces.MIMO\">Modelica.Blocks.Interfaces.MIMO</a> 
</p>
<p>
The joint variables are determine by:
</p>
<img src=\"modelica://Servomechanisms/Resources/Images/Control/ppinverseequation.png\"/>
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

</html>"));
end PPInverseKinematics;

