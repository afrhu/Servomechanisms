within Servomechanisms.Mechanism;
class TorqueAnalysis "Torque Analysis element"
  //Icon
  extends Servomechanisms.Utilities.IconName;
  extends Modelica.Icons.RotationalSensor;
  //Inheritance
  extends Modelica.Mechanics.Rotational.Interfaces.PartialTwoFlanges;
  //Parameters
  parameter Modelica.SIunits.Time period(start = 1 / 50) "Rootmeansquare Base period";
  //Components
  Modelica.Mechanics.Rotational.Sensors.AngleSensor anglesensor1 annotation(Placement(transformation(origin = {0,75}, extent = {{-10,-10},{10,10}})));
  Modelica.Mechanics.Rotational.Sensors.SpeedSensor speedsensor1 annotation(Placement(transformation(origin = {0,50}, extent = {{-10,-10},{10,10}})));
  Modelica.Mechanics.Rotational.Sensors.AccSensor accsensor1 annotation(Placement(transformation(origin = {0,25}, extent = {{-10,-10},{10,10}})));
  Modelica.Mechanics.Rotational.Sensors.TorqueSensor torquesensor1 annotation(Placement(transformation(extent = {{-10,-10},{10,10}})));
  Modelica.Blocks.Math.RootMeanSquare rootmeansquare1(f = 1 / period) annotation(Placement(transformation(origin = {50,-50}, extent = {{-10,-10},{10,10}})));
equation
  connect(torquesensor1.flange_b,flange_b) annotation(Line(points = {{10,0},{102.239,0},{102.239,-1.1194},{102.239,-1.1194}}));
  connect(rootmeansquare1.u,torquesensor1.tau) annotation(Line(points = {{38,-50},{-7.46269,-50},{-7.46269,-10.8209},{-7.46269,-10.8209}}));
  connect(anglesensor1.flange,flange_a) annotation(Line(points = {{-10,75},{-98.5075,75},{-98.5075,0.373134},{-98.5075,0.373134}}));
  connect(speedsensor1.flange,flange_a) annotation(Line(points = {{-10,50},{-98.5075,50},{-98.5075,-2.61194},{-98.5075,-2.61194}}));
  connect(accsensor1.flange,flange_a) annotation(Line(points = {{-10,25},{-98.5075,25},{-98.5075,-0.373134},{-98.5075,-0.373134}}));
  connect(flange_a,torquesensor1.flange_a) annotation(Line(points = {{-100,0},{-9.70149,0},{-9.70149,0.373134},{-9.70149,0.373134}}));
  annotation( Documentation(info = "<html>
<head>
<style type=\"text/css\">
h4      { border-radius:8%;background-color: #D8D8D8 ;}
</style>
</head>

<h4>General</h4>
<p>
This element is used to measure angle, speed, acceleration, torque and RMS torque between two mechanical rotational components.
</p>

<h4>Implementation</h4>
It uses several sensor form
<a href=\"modelica://Modelica\">MSL</a>
to measure the variables between two mechanical rotational ports.

<h4>Notes</h4>
<ul>
<li>
The user must input the period to calculate the RMS torque value which is displayed since the second cycle.
</li>
<li>
All the parameters are in SI units.
</li>
</ul>

<h4>Example</h4>
<a href=\"modelica://RRTorqueAnalysis\">RRTorqueAnalysis<a>

</html>"), Icon(coordinateSystem(extent = {{-100,-100},{100,100}}, preserveAspectRatio = true, grid = {2,2}), graphics = {Rectangle(origin = {2.06791,17.6822}, fillColor = {255,255,255}, fillPattern = FillPattern.HorizontalCylinder, extent = {{-99.4611,32.2108},{-74.329,-67.3495}}),Rectangle(origin = {172.245,16.8342}, fillColor = {255,255,255}, fillPattern = FillPattern.HorizontalCylinder, extent = {{-99.4611,32.2108},{-74.329,-67.3495}})}));
end TorqueAnalysis;

