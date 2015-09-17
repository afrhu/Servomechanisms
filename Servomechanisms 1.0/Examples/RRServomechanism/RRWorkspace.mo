within Servomechanisms.Examples.RRServomechanism;
model RRWorkspace
  extends Modelica.Icons.Example;
  extends Servomechanisms.Examples.RRServomechanism.Data;
  import Modelica.Constants.*;
  Modelica.Mechanics.Rotational.Sources.Position position1(exact = true) annotation(Placement(transformation(origin = {-14.5199,-30.445}, extent = {{-10,-10},{10,10}})));
  Modelica.Mechanics.Rotational.Sources.Position position2(exact = true) annotation(Placement(transformation(origin = {-17.0023,8.87381}, extent = {{-10,-10},{10,10}})));
  Servomechanisms.Mechanism.Workspace2d workspace1(min2 = min2, max2 = max2, min1 = min1, max1 = max1, paso1 = (max1 - min1) / 50, paso2 = (max2 - min2) / 50) annotation(Placement(transformation(origin = {-66.6146,6.08899}, extent = {{-10,-10},{10,10}})));
  Servomechanisms.Mechanism.RR rr1(boxLength1 = l1, boxWidth1 = w1, boxHeight1 = h1, density1 = d1, boxLength2 = l2, boxWidth2 = w2, boxHeight2 = h2, density2 = d2) annotation(Placement(transformation(origin = {64.1711,-14.4866}, extent = {{-27.0641,-27.0641},{27.0641,27.0641}})));
  Servomechanisms.Control.CircleTrayectory circletrayectory1(xc = xc, yc = yc, r = r, paso = 2 * 3.1415) annotation(Placement(transformation(origin = {-69.131,-68.6224}, extent = {{-10,-10},{10,10}})));
equation
  connect(position1.flange,rr1.flange_rotational1) annotation(Line(points = {{-4.5199,-30.445},{38.2979,-30.445},{37.6774,-17.4941},{37.6774,-17.4022}}));
  connect(position2.flange,rr1.flange_rotational2) annotation(Line(points = {{-7.0023,8.87381},{56.7376,8.87381},{57.8329,1.41844},{57.8329,1.48566}}));
  connect(workspace1.y[2],position2.phi_ref) annotation(Line(points = {{-55.6146,6.08899},{-45.9016,6.08899},{-45.9016,8.43091},{-28.5714,8.43091},{-28.5714,8.43091}}));
  connect(workspace1.y[1],position1.phi_ref) annotation(Line(points = {{-55.6146,6.08899},{-51.0539,6.08899},{-51.0539,-31.3817},{-27.1663,-31.3817},{-27.1663,-31.3817}}));
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
<img src=\"modelica://Servomechanisms/Resources/Images/Examples/RRWorkspace01.png\">
</html>"));
end RRWorkspace;

