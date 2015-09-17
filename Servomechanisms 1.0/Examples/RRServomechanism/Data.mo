within Servomechanisms.Examples.RRServomechanism;
record Data "RR Servomechanism Data"
  //Imports
  import Modelica.Constants.*;
  //Inheritance
  extends Servomechanisms.Utilities.Visual3d;
  //Parameters of link 1
  parameter Real l1 = 0.2,w1 = 0.02,h1 = 0.005,d1 = 400,min1 = 0,max1 = pi / 2;
  //Parameters of link 2
  parameter Real l2 = 0.1,w2 = 0.02,h2 = 0.005,d2 = 400,min2 = -pi / 2,max2 = pi / 2;
  //Parameters of circle trajectory
  parameter Real r = 0.03,xc = 0.25,yc = 0.075;
  //Reduction parameters
  parameter Real ratio1 = 10,ratio2 = 5;
  //Time
  parameter Real period = 8;
  //Motor parameters
  parameter Real R = 0.101,L = 0.0000266,k = 0.0115,J = 0.0000119,Voltage = 12;
  //parameter Real R = 2.12,L = 0.000254,k = 0.011,J = 0.00000136,Voltage = 6;
  //Controller parameters
  parameter Real kp2 = 4.423,kp1 = 7.1543;
  annotation(Documentation(info = "
<html>
<head>
<style type=\"text/css\">
h4      { border-radius:8%;background-color: #D8D8D8 ;}
</style>
</head>

<h4>General</h4>
<p>
This element is a record (a special Modelica class). In this case
this class is used to contain data utilized as design parameteres in the analysis.
</p>

<h4>Implementation</h4>
The parameters in this class are:
<ul>
<li>
Parameters of link 1
</li>
<li>
Parameters of link 2
</li>
<li>
Parameters of cirle trajectory
</li>
<li>
Motor parameters
</li>
<li>
Control parameters
</li>
</ul>

<p>
All this parameters can be change in the <strong>Text View</strong>.
</p>

</html>"), Diagram(coordinateSystem(extent = {{-100,-100},{100,100}}, preserveAspectRatio = true, grid = {2,2}), graphics = {Rectangle(origin = {-39.6389,81.7873}, lineColor = {0,85,255}, fillColor = {170,255,255}, pattern = LinePattern.Dash, fillPattern = FillPattern.Solid, lineThickness = 1, extent = {{-55.0106,10.4876},{128.963,-10.8519}}),Text(origin = {-36.4126,68.9466}, extent = {{-54.3326,21.7799},{-30.8798,12.9988}}, textString = "l1 = 0.2 [m]", fontSize = 4, fontName = "Arial", horizontalAlignment = TextAlignment.Left),Text(origin = {-36.5963,59.3905}, extent = {{-54.3326,21.7799},{-26.6175,15.1217}}, textString = "l2 =0.1 [m]", fontSize = 4, horizontalAlignment = TextAlignment.Left),Text(origin = {0.53695,69.2675}, extent = {{-54.3326,21.7799},{-9.02189,11.9059}}, textString = "min1 = 0, max1 = pi", fontSize = 4, fontName = "Arial", horizontalAlignment = TextAlignment.Left),Text(origin = {0.500448,61.2165}, extent = {{-54.3326,21.7799},{-9.02189,11.9059}}, textString = "min2 = -pi/2, max2 = pi/2", fontSize = 4, fontName = "Arial", horizontalAlignment = TextAlignment.Left),Text(origin = {67.8593,69.1946}, extent = {{-54.3326,21.7799},{-9.02189,11.9059}}, textString = "r = 0.03 [m],center (0.25,0.075)", fontSize = 4, fontName = "Arial", horizontalAlignment = TextAlignment.Left)}));
end Data;

