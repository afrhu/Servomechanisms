within Servomechanisms.Examples.RPServomechanism;
model RPWorkspace
  extends Modelica.Icons.Example;
  extends Servomechanisms.Examples.RPServomechanism.Data;
  Modelica.Mechanics.Translational.Sources.Position position2(exact = true) annotation(Placement(transformation(origin = {-15.9251,10.7728}, extent = {{-10,-10},{10,10}})));
  Servomechanisms.Mechanism.Workspace2d workspace1(min1 = min1, max1 = max1, min2 = min2, max2 = max2) annotation(Placement(transformation(origin = {-78.2201,-4.68384}, extent = {{-10,-10},{10,10}})));
  Servomechanisms.Mechanism.RP rp1(boxLength1 = l1, boxWidth1 = w1, boxHeight1 = h1, density1 = d1, boxLength2 = l2, boxWidth2 = w2, boxHeight2 = h2, density2 = d2) annotation(Placement(transformation(origin = {60.5477,-7.65018}, extent = {{-21.4311,-21.4311},{21.4311,21.4311}})));
  Servomechanisms.Control.FlowerTrayectory flowertrayectory1(a = a, xc = xc, yc = yc, period = 1) annotation(Placement(transformation(origin = {-68.1978,-72.7915}, extent = {{-10,-10},{10,10}})));
  Modelica.Mechanics.Rotational.Sources.Position position1(exact = true) annotation(Placement(transformation(origin = {-14.5199,-35.5972}, extent = {{-10,-10},{10,10}})));
equation
  connect(position2.s_ref,workspace1.y[2]) annotation(Line(points = {{-27.9251,10.7728},{-66.9789,10.7728},{-66.9789,-4.68384},{-66.9789,-4.68384}}));
  connect(position1.phi_ref,workspace1.y[1]) annotation(Line(points = {{-26.5199,-35.5972},{-67.4473,-35.5972},{-67.4473,-5.15222},{-67.4473,-5.15222}}));
  connect(position2.flange,rp1.flange_p2) annotation(Line(points = {{-5.9251,10.7728},{57.6112,10.7728},{57.6112,-7.02576},{57.6112,-7.02576}}));
  connect(position1.flange,rp1.flange_r1) annotation(Line(points = {{-4.5199,-35.5972},{43.0913,-35.5972},{43.0913,-24.356},{43.0913,-24.356}}));
  annotation(experiment(StartTime = 0, StopTime = 1, Tolerance = 0.000001));
  annotation(Documentation(info = "
<html>
<head>
<style type=\"text/css\">
h4      { border-radius:8%;background-color: #D8D8D8 ;}
</style>
</head>

<h4>General</h4>
<p>
The purpose of this model is to determine de workspace and possible trayectory of the mechanism.
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
<img src=\"modelica://Servomechanisms/Resources/Images/Examples/rpworkspace.png\">
</html>"));
end RPWorkspace;

