within Servomechanisms.Examples.PRServomechanism;
model PRWorkspace
  extends Modelica.Icons.Example;
  extends Servomechanisms.Utilities.Visual3d;
  extends Servomechanisms.Examples.PRServomechanism.Data;
  Modelica.Mechanics.Translational.Sources.Position position1(exact = true) annotation(Placement(visible = true, transformation(origin = {1.40365,-33.634}, extent = {{-10,-10},{10,10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sources.Position position2(exact = true) annotation(Placement(visible = true, transformation(origin = {-1.82883,15.2562}, extent = {{-10,-10},{10,10}}, rotation = 0)));
  Servomechanisms.Mechanism.Workspace2d workspace1(max1 = max1, min2 = min2, max2 = max2, min1 = min1) annotation(Placement(visible = true, transformation(origin = {-55.5921,-12.0141}, extent = {{-10,-10},{10,10}}, rotation = 0)));
  Servomechanisms.Control.FlowerTrayectory flowertrayectory1(xc = xc, b = 2 * Modelica.Constants.pi, a = a, yc = yc) annotation(Placement(visible = true, transformation(origin = {-54.4476,-59.0164}, extent = {{-10,-10},{10,10}}, rotation = 0)));
  Servomechanisms.Mechanism.PR pr1(boxLength1 = l1, boxWidth1 = w1, boxHeight1 = h1, density1 = d1, boxLength2 = l2, boxWidth2 = w2, boxHeight2 = h2, density2 = d2, n2 = {0,0,1}) annotation(Placement(visible = true, transformation(origin = {60.0905,-10.422}, extent = {{-22.595,-22.595},{22.595,22.595}}, rotation = 0)));
equation
  connect(position2.phi_ref,workspace1.y[2]) annotation(Line(points = {{-13.8288,15.2562},{-44.8763,15.2562},{-44.8763,-12.3675},{-44.8763,-12.3675}}));
  connect(position1.s_ref,workspace1.y[1]) annotation(Line(points = {{-10.5963,-33.634},{-44.523,-33.634},{-44.523,-12.3675},{-44.523,-12.3675}}));
  connect(position2.flange,pr1.flange_r2) annotation(Line(points = {{8.17117,15.2562},{64.6643,15.2562},{64.6643,-11.3074},{64.6643,-11.3074}}));
  connect(position1.flange,pr1.flange_p1) annotation(Line(points = {{11.4037,-33.634},{47.7032,-33.634},{47.7032,-11.6608},{47.7032,-11.6608}}));
  annotation(Icon(coordinateSystem(extent = {{-100,-100},{100,100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2,2})), Diagram(coordinateSystem(extent = {{-100,-100},{100,100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2,2})), experiment(StartTime = 0, StopTime = 1, Tolerance = 0.000001));
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
and 
<a href=\"modelica://Modelica.Mechanics.Translational.Sources.Position\">Translational position sources</a>
(from
<a href=\"modelica://Modelica\">MSL</a>  
) and then connected to the  
<a href=\"modelica://Servomechanisms.Mechanism.RR\">RR</a>
component.
</p>

<h4>Notes</h4>
<ul>
<li>
The block flowertrayectory is utilized to verify that the trayectory is within the workspace.
</li>
<li>
Note that the parameter <b>exact</b> in each position source is <b>true</b> to avoid the minimal frequency.
</li>
<li>
Both, the workspace and flower trayectory are completed in 1 sec.
</li>
</ul>

<h4>Results</h4>
<p>
The simulation results in parametric plot are:
</p>
<img src=\"modelica://Servomechanisms/Resources/Images/Examples/prworkspace.png\">
</html>"));
end PRWorkspace;

