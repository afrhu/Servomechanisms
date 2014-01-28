within Servomechanisms.Examples.PPServomechanism;
record Data
  //Imports
  import Modelica.Constants.*;
  //Inheritance
  extends Servomechanisms.Utilities.Visual3d;
  //Parameters of link 1
  parameter Real l1 = 0.2,w1 = 0.02,h1 = 0.005,d1 = 400,min1 = -0.2,max1 = 0;
  //Parameters of link 2
  parameter Real l2 = 0.2,w2 = 0.02,h2 = 0.005,d2 = 400,min2 = -0.2,max2 = 0;
  //Parameters of circle trayectory
  parameter Real r = 0.08,xc = 0.1,yc = 0.1;
  //Raduction parameters
  parameter Real ratio1 = 5,ratio2 = 5;
  //Motor parameters
  parameter Real R = 0.635,I = 0.0000208,k = 0.00348,J = 0.000000173;
  //Controller parameters
  parameter Real kprot = 4.5,kppris = 5;
  //Time
  parameter Real period = 60;
  annotation(Icon(coordinateSystem(extent = {{-100,-100},{100,100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2,2})), Diagram(coordinateSystem(extent = {{-100,-100},{100,100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2,2}), graphics = {Rectangle(origin = {-40.3675,82.5159}, lineColor = {0,85,255}, fillColor = {170,255,255}, fillPattern = FillPattern.Solid, extent = {{-55.0106,10.4876},{55.0106,-10.4876}}),Text(origin = {-36.4126,70.7681}, extent = {{-54.3326,21.7799},{23.765,10.0844}}, textString = "l1 = 0.2 [m], min1 = 0, max1 = pi", fontSize = 4, fontName = "Arial", horizontalAlignment = TextAlignment.Left),Text(origin = {-36.5963,62.6692}, extent = {{-54.3326,21.7799},{49.8852,9.29292}}, textString = "l2 =0.1 [m], min2 = -pi/2, max2 = pi/2", fontSize = 4, horizontalAlignment = TextAlignment.Left)}));
end Data;

