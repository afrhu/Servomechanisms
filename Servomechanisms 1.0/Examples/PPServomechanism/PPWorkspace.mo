within Servomechanisms.Examples.PPServomechanism;
model PPWorkspace
  extends Modelica.Icons.Example;
  extends Servomechanisms.Examples.PPServomechanism.Data;
  Servomechanisms.Mechanism.Workspace2d workspace1(min1 = min1, max1 = max1, min2 = min2, max2 = max2) annotation(Placement(transformation(origin = {-77.0732,-2.92683}, extent = {{-10,-10},{10,10}})));
  Modelica.Mechanics.Translational.Sources.Position position1(exact = true) annotation(Placement(transformation(origin = {-14.1463,-38.0488}, extent = {{-10,-10},{10,10}})));
  Modelica.Mechanics.Translational.Sources.Position position2(exact = true) annotation(Placement(transformation(origin = {-12.6829,17.561}, extent = {{-10,-10},{10,10}})));
  Servomechanisms.Control.CircleTrayectory circletrayectory1(r = r, xc = xc, yc = yc) annotation(Placement(transformation(origin = {-59.9556,-71.6164}, extent = {{-10,-10},{10,10}})));
  Servomechanisms.Mechanism.PP pp1(n2 = {1,0,0}, boxLength1 = l1, boxWidth1 = w1, boxHeight1 = h1, boxLength2 = l1, boxWidth2 = w1, boxHeight2 = h1, density1 = d1, density2 = d2) annotation(Placement(transformation(origin = {50.2693,-6.87354}, extent = {{-27.9508,-27.9508},{27.9508,27.9508}})));
equation
  connect(position2.flange,pp1.flange_p2) annotation(Line(points = {{-2.6829,17.561},{57.1429,17.561},{57.1429,-20.6089},{57.1429,-20.6089}}));
  connect(position1.flange,pp1.flange_p1) annotation(Line(points = {{-4.1463,-38.0488},{36.0656,-38.0488},{36.0656,-23.8876},{36.0656,-23.8876}}));
  connect(position2.s_ref,workspace1.y[2]) annotation(Line(points = {{-24.6829,17.561},{-65.5738,17.561},{-65.5738,-2.8103},{-65.5738,-2.8103}}));
  connect(position1.s_ref,workspace1.y[1]) annotation(Line(points = {{-26.1463,-38.0488},{-66.0422,-38.0488},{-66.0422,-3.27869},{-66.0422,-3.27869}}));
  annotation( experiment(StartTime = 0, StopTime = 1, Tolerance = 0.000001));
  annotation(Documentation(info = "
<html>
<head>
<style type=\"text/css\">
h4      { border-radius:8%;background-color: #D8D8D8 ;}
</style>
</head>

<h4>General</h4>
<p>
The purpose of this model is to determine the workspace and possible trayectory of the mechanism.
The parameters used are located in the <b>record</b>. This parameters are used as the parameters of each component as needed.
</p>

<h4>Implementation</h4>
<p>
The
<a href=\"modelica://Servomechanisms.Mechanism.Workspace2d\">Workspace2d</a>
generates references values between the ranges of the joints feasible motion.
This values are then introduced into
<a href=\"modelica://Modelica.Mechanics.Rotational.Sources.Position\">Angular position sources</a>
(from
<a href=\"modelica://Modelica\">MSL</a>
) and then connected to the
<a href=\"modelica://Servomechanisms.Mechanism.RR\">RR</a>
component.
</p>

<h4>Notes</h4>
<ul>
<li>
The block circletrayectory is utilized to verify that the trayectory is within the workspace.
</li>
<li>
Note that the parameter <b>exact</b> in each position source is <b>true</b> to avoid the minimal frequency.
</li>
<li>
Both, the workspace and circle trayectory are completed in 1 sec.
</li>
</ul>

<h4>Results</h4>
<p>
The simulation results in parametric plot are:
</p>
<img src=\"modelica://Servomechanisms/Resources/Images/Examples/ppworkspace.png\">
</html>"));
end PPWorkspace;

