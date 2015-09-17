within Servomechanisms.Examples.PRServomechanism;
record Data
  //Imports
  import Modelica.Constants.*;
  //Parameters of link 1
  parameter Real l1 = 0.3,w1 = 0.01,h1 = 0.075,d1 = 888.889,min1 = -0.3,max1 = 0;
  //Parameters of link 2
  parameter Real l2 = 0.085,w2 = 0.02,h2 = 0.005,d2 = 2352.94,min2 = -pi / 2,max2 = pi / 2;
  //Parameters of flower trajectory
  parameter Real a = 0.075,b = 1 / 8,xc = 0.15,yc = 0;
  //Motor parameters
  parameter Real R = 0.101,L = 0.0000266,k = 0.0115,J = 0.0000119,Voltage = 12;
  //Time
  parameter Real period = 60;
  //Reduction parameters
  parameter Real ratio1 = 50,ratio2 = 5;
  //Controller parameters
  parameter Real kprot = 3.9551,kppris = 5.4292;
  annotation( Diagram(coordinateSystem(extent = {{-100,-100},{100,100}}, preserveAspectRatio = true, grid = {2,2}), graphics = {Rectangle(origin = {-40.7209,82.5159}, lineColor = {0,85,255}, fillColor = {170,255,255}, pattern = LinePattern.Dash, fillPattern = FillPattern.Solid, lineThickness = 1, extent = {{-55.0106,10.4876},{55.0106,-10.4876}}),Text(origin = {-36.4126,70.7681}, extent = {{-54.3326,21.7799},{23.765,10.0844}}, textString = "l1 = 0.3 [m], min1 = -0.3, max1 = 0", fontSize = 4, fontName = "Arial", horizontalAlignment = TextAlignment.Left),Text(origin = {-36.5963,62.6692}, extent = {{-54.3326,21.7799},{49.8852,9.29292}}, textString = "l2 = 0.085 [m], min2 = -pi/2, max2 = pi/2", fontSize = 4, horizontalAlignment = TextAlignment.Left)}));
  annotation(Documentation(info = "<html>
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
Parameters of flower trajectory
</li>
<li>
Motor parameters
</li>
<li>
Control parameters
</li>
<li>
Reduction parameters
</li>
</ul>

<p>
All this parameters can be change in the <strong>Text View</strong>.
</p>

</html>"));
end Data;

