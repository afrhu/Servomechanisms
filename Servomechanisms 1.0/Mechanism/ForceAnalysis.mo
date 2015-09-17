within Servomechanisms.Mechanism;
model ForceAnalysis
  //Inheritance
  extends Modelica.Icons.TranslationalSensor;
  extends Servomechanisms.Utilities.IconName;
  extends Modelica.Mechanics.Translational.Interfaces.PartialTwoFlanges;
  //Parameters
  parameter Modelica.SIunits.Time period(start = 1 / 50) "Rootmeansquare Base frequency";
  //Components
  Modelica.Mechanics.Translational.Sensors.PositionSensor positionsensor1 annotation(Placement(transformation(origin = {0,75}, extent = {{-10,-10},{10,10}})));
  Modelica.Mechanics.Translational.Sensors.SpeedSensor speedsensor1 annotation(Placement(transformation(origin = {0,50}, extent = {{-10,-10},{10,10}})));
  Modelica.Mechanics.Translational.Sensors.AccSensor accsensor1 annotation(Placement(transformation(origin = {-0,25}, extent = {{-10,-10},{10,10}})));
  Modelica.Mechanics.Translational.Sensors.ForceSensor forcesensor1 annotation(Placement(transformation(extent = {{-10,-10},{10,10}})));
  Modelica.Blocks.Math.RootMeanSquare rootmeansquare1(f = 1 / period) annotation(Placement(transformation(origin = {50,-50}, extent = {{-10,-10},{10,10}})));
equation
  connect(rootmeansquare1.u,forcesensor1.f) annotation(Line(points = {{38,-50},{-7.08955,-50},{-7.08955,-11.194},{-7.08955,-11.194}}));
  connect(positionsensor1.flange,flange_a) annotation(Line(points = {{-10,75},{-98.1343,75},{-98.1343,-0.373134},{-98.1343,-0.373134}}));
  connect(speedsensor1.flange,flange_a) annotation(Line(points = {{-10,50},{-98.1343,50},{-98.1343,0},{-98.1343,0}}));
  connect(accsensor1.flange,flange_a) annotation(Line(points = {{-10,25},{-98.1343,25},{-98.1343,0.746269},{-98.1343,0.746269}}));
  connect(forcesensor1.flange_b,flange_b) annotation(Line(points = {{10,0},{97.3881,0},{97.3881,-0.373134},{97.3881,-0.373134}}));
  connect(flange_a,forcesensor1.flange_a) annotation(Line(points = {{-100,0},{-9.32836,0},{-9.32836,-0.373134},{-9.32836,-0.373134}}));
  annotation(Documentation(info = "<html>
<head>
<style type=\"text/css\">
h4      { border-radius:8%;background-color: #D8D8D8 ;}
</style>
</head>

<h4>General</h4>
<p>
This element is used to measure position, speed, acceleration, force and RMS force between two mechanical translational components.
</p>

<h4>Implementation</h4>
It uses several sensor form
<a href=\"modelica://Modelica\">MSL</a>
to measure the variables between two mechanical translation ports.

<h4>Notes</h4>
<ul>
<li>
The user must input the period to calculate the RMS force value which is displayed since the second cycle.
</li>
<li>
All the parameters are in SI units.
</li>
</ul>

<h4>Example</h4>
<a href=\"modelica://Servomechanisms.Examples.PRServomechanism.PRTorqueAnalysis\">PRTorqueAnalysis<a>

</html>"), Icon(coordinateSystem(extent = {{-100,-100},{100,100}}, preserveAspectRatio = true, grid = {2,2}), graphics = {Rectangle(origin = {-84.8057,5.47703}, fillColor = {255,255,255}, fillPattern = FillPattern.VerticalCylinder, lineThickness = 1, extent = {{-12.3675,49.6466},{12.3675,-49.6466}}),Rectangle(origin = {85.0177,2.50883}, fillColor = {255,255,255}, fillPattern = FillPattern.VerticalCylinder, lineThickness = 1, extent = {{-12.3675,49.6466},{12.3675,-49.6466}})}));
end ForceAnalysis;

