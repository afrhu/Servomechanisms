within Servomechanisms.Mechanism;
class SimpleGearAxes
  //Parameters
  parameter Real ratio = 1 "Gear Ratio for velocity reducer";
  parameter SI.Inertia InertiaDriver = 1 "Inertia of Driver Axe";
  parameter SI.Inertia InertiaDriven = 1 "Inertia of Driven Axe";
  //Components
  Modelica.Mechanics.Rotational.Components.IdealGear idealgear1(ratio = ratio) annotation(Placement(transformation(extent = {{-10,-10},{10,10}})));
  Modelica.Mechanics.Rotational.Components.Inertia inertia2(J = InertiaDriver) annotation(Placement(transformation(origin = {50,0}, extent = {{-10,-10},{10,10}})));
  Modelica.Mechanics.Rotational.Components.Inertia inertia1(J = InertiaDriven) annotation(Placement(transformation(origin = {-50,0}, extent = {{-10,-10},{10,10}})));
  //Interfaces
  Modelica.Mechanics.Rotational.Interfaces.Flange_b flange_b annotation(Placement(transformation(origin = {100,0}, extent = {{-10,-10},{10,10}}), iconTransformation(origin = {100,-50}, extent = {{-10,-10},{10,10}})));
  Modelica.Mechanics.Rotational.Interfaces.Flange_a flange_a annotation(Placement(transformation(origin = {-100,0}, extent = {{-10,-10},{10,10}}), iconTransformation(origin = {-100,50}, extent = {{-10,-10},{10,10}})));
equation
  connect(inertia2.flange_b,flange_b) annotation(Line(points = {{60,0},{98.5866,0},{98.5866,-1.76678},{98.5866,-1.76678}}));
  connect(idealgear1.flange_b,inertia2.flange_a) annotation(Line(points = {{10,0},{39.2226,0},{39.2226,0},{39.2226,0}}));
  connect(inertia1.flange_b,idealgear1.flange_a) annotation(Line(points = {{-40,0},{-9.18728,0},{-9.18728,0},{-9.18728,0}}));
  connect(flange_a,inertia1.flange_a) annotation(Line(points = {{-100,0},{-61.1307,0},{-61.1307,0.353357},{-61.1307,0.353357}}));
  annotation( Icon(coordinateSystem(extent = {{-100,-100},{100,100}}, preserveAspectRatio = true, grid = {2,2}), graphics = {Rectangle(origin = {-33.9223,55.8304}, lineColor = {0,85,255}, fillColor = {0,170,255}, fillPattern = FillPattern.HorizontalCylinder, lineThickness = 1, extent = {{-66.0777,16.9611},{20.8481,-40.9894}}),Rectangle(origin = {94.9117,-49.258}, lineColor = {0,85,255}, fillColor = {0,170,255}, fillPattern = FillPattern.HorizontalCylinder, lineThickness = 1, extent = {{-87.6325,16.2544},{5.41538,-39.1159}}),Rectangle(origin = {-4.24028,27.5618}, fillColor = {112,112,112}, fillPattern = FillPattern.Horizontal, lineThickness = 1, extent = {{-7.42049,64.6643},{8.48057,-49.8233}}),Rectangle(origin = {-5.08834,-88.8339}, fillColor = {112,112,112}, fillPattern = FillPattern.Horizontal, lineThickness = 1, extent = {{-7.42049,64.6643},{10.2474,-8.48057}})}));
  annotation(Documentation(info = "<html>
<head>
<style type=\"text/css\">
h4      { border-radius:8%;background-color: #D8D8D8 ;}
</style>
</head>

<h4>General</h4>
<p>
This component model a driven axel and  a driver axel connected with a gear ratio.
</p>

<h4>Implementation</h4>
<p>
Connection of inertia elements and a Ideal gear.
The inertia that sees and element connected to the frame_a is:
</p>
<img src=\"modelica://Servomechanisms/Resources/Images/Mechanism/simplegearaxes.png\" alt=\"simplegearaxes.png\" >

<h4>Notes</h4>
<ul>
<li>
This model is ideal, no losses are taken into account
</li>
</ul>
</html>"));
end SimpleGearAxes;

