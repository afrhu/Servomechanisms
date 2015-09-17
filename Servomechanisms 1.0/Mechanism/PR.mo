within Servomechanisms.Mechanism;
model PR "PR Mechanism"
  //Imports
  import SI = Modelica.SIunits;
  //Icon
  extends Servomechanisms.Utilities.IconNameB;
  //Inner declarations
  inner Modelica.Mechanics.MultiBody.World world(enableAnimation = true, animateWorld = true, g = g) annotation(Placement(transformation(origin = {-83.2282,-83.6844}, extent = {{-10,-10},{10,10}})));
  //Parameters 1
  parameter String shape1 = "box" "shape of visualizer:\"shape\", \"box\", \"cylinder\" ";
  parameter Modelica.Mechanics.MultiBody.Types.Axis n1 = {1,0,0} "Axis of rotation resolved in frame_a (= same as in frame_b)" annotation(Evaluate = true);
  //SHAPE Parameters
  parameter SI.Position r1[3](start = {0,0,0}) "Vector from frame_a to frame_b resolved in frame_a" annotation(Dialog(tab = "if shape"));
  parameter SI.Position r_CM1[3](start = {0,0,0}) "Vector from frame_a to center of mass, resolved in frame_a" annotation(Dialog(tab = "if shape"));
  parameter SI.Mass m1(min = 0, start = 1) "Mass of rigid body" annotation(Dialog(tab = "if shape"));
  parameter SI.Length shapeLength1 = 1 annotation(Dialog(tab = "if shape"));
  parameter SI.Distance shapeWidth1 = boxLength1 / 20 annotation(Dialog(tab = "if shape"));
  parameter SI.Distance shapeHeight1 = boxWidth1 annotation(Dialog(tab = "if shape"));
  parameter String shapeType1 = "modelica://Servomechanisms//Resources//b2.dxf" "Type of shape" annotation(Dialog(tab = "if shape"));
  parameter Real extra1 = 1 "Additional parameter depending on shapeType (see docu of Visualizers.Advanced.Shape)" annotation(Dialog(tab = "if shape"));
  parameter SI.Inertia I_111 = 0.001 "(1,1) element of inertia tensor" annotation(Dialog(tab = "if shape", group = "Inertia tensor (resolved in center of mass, parallel to frame_a)"));
  parameter SI.Inertia I_221 = 0.001 "(2,2) element of inertia tensor" annotation(Dialog(tab = "if shape", group = "Inertia tensor (resolved in center of mass, parallel to frame_a)"));
  parameter SI.Inertia I_331 = 0.001 "(3,3) element of inertia tensor" annotation(Dialog(tab = "if shape", group = "Inertia tensor (resolved in center of mass, parallel to frame_a)"));
  parameter SI.Inertia I_211 = 0 "(2,1) element of inertia tensor" annotation(Dialog(tab = "if shape", group = "Inertia tensor (resolved in center of mass, parallel to frame_a)"));
  parameter SI.Inertia I_311 = 0 "(3,1) element of inertia tensor" annotation(Dialog(tab = "if shape", group = "Inertia tensor (resolved in center of mass, parallel to frame_a)"));
  parameter SI.Inertia I_321 = 0 "(3,2) element of inertia tensor" annotation(Dialog(tab = "if shape", group = "Inertia tensor (resolved in center of mass, parallel to frame_a)"));
  //BOX Parameters
  parameter SI.Length boxLength1 = 1 annotation(Dialog(tab = "if box"));
  parameter SI.Distance boxWidth1 = boxLength1 / 20 annotation(Dialog(tab = "if box"));
  parameter SI.Distance boxHeight1 = boxWidth1 annotation(Dialog(tab = "if box"));
  //CYLINDER Parameters
  parameter SI.Length cylinderLength1 = 1 annotation(Dialog(tab = "if cylinder"));
  parameter SI.Distance cylinderDiameter1 = cylinderLength1 / 20 annotation(Dialog(tab = "if cylinder"));
  //COMMON Parameters
  parameter SI.Density density1 = 7700 "Density of link (e.g., steel: 7700 .. 7900, wood : 400 .. 800)" annotation(Dialog(group = "Parameters only for cylinder and box"));
  //Parameters 2
  parameter String shape2 = "box" "shape of visualizer:\"shape\", \"box\", \"cylinder\" ";
  parameter Modelica.Mechanics.MultiBody.Types.Axis n2 = {0,0,1} "Axis of rotation resolved in frame_a (= same as in frame_b)" annotation(Evaluate = true);
  //SHAPE Parameters
  parameter SI.Position r2[3](start = {0,0,0}) "Vector from frame_a to frame_b resolved in frame_a" annotation(Dialog(tab = "if shape"));
  parameter SI.Position r_CM2[3](start = {0,0,0}) "Vector from frame_a to center of mass, resolved in frame_a" annotation(Dialog(tab = "if shape"));
  parameter SI.Mass m2(min = 0, start = 1) "Mass of rigid body" annotation(Dialog(tab = "if shape"));
  parameter SI.Length shapeLength2 = 1 annotation(Dialog(tab = "if shape"));
  parameter SI.Distance shapeWidth2 = boxLength2 / 20 annotation(Dialog(tab = "if shape"));
  parameter SI.Distance shapeHeight2 = boxWidth2 annotation(Dialog(tab = "if shape"));
  parameter String shapeType2 = "modelica://Servomechanisms//Resources//b2.dxf" "Type of shape" annotation(Dialog(tab = "if shape"));
  parameter Real extra2 = 1 "Additional parameter depending on shapeType (see docu of Visualizers.Advanced.Shape)" annotation(Dialog(tab = "if shape"));
  parameter SI.Inertia I_112 = 0.001 "(1,1) element of inertia tensor" annotation(Dialog(tab = "if shape", group = "Inertia tensor (resolved in center of mass, parallel to frame_a)"));
  parameter SI.Inertia I_222 = 0.001 "(2,2) element of inertia tensor" annotation(Dialog(tab = "if shape", group = "Inertia tensor (resolved in center of mass, parallel to frame_a)"));
  parameter SI.Inertia I_332 = 0.001 "(3,3) element of inertia tensor" annotation(Dialog(tab = "if shape", group = "Inertia tensor (resolved in center of mass, parallel to frame_a)"));
  parameter SI.Inertia I_212 = 0 "(2,1) element of inertia tensor" annotation(Dialog(tab = "if shape", group = "Inertia tensor (resolved in center of mass, parallel to frame_a)"));
  parameter SI.Inertia I_312 = 0 "(3,1) element of inertia tensor" annotation(Dialog(tab = "if shape", group = "Inertia tensor (resolved in center of mass, parallel to frame_a)"));
  parameter SI.Inertia I_322 = 0 "(3,2) element of inertia tensor" annotation(Dialog(tab = "if shape", group = "Inertia tensor (resolved in center of mass, parallel to frame_a)"));
  //BOX Parameters
  parameter SI.Length boxLength2 = 1 annotation(Dialog(tab = "if box"));
  parameter SI.Distance boxWidth2 = boxLength2 / 20 annotation(Dialog(tab = "if box"));
  parameter SI.Distance boxHeight2 = boxWidth2 annotation(Dialog(tab = "if box"));
  //CYLINDER Parameters
  parameter SI.Length cylinderLength2 = 1 annotation(Dialog(tab = "if cylinder"));
  parameter SI.Distance cylinderDiameter2 = cylinderLength2 / 20 annotation(Dialog(tab = "if cylinder"));
  //COMMON Parameters
  parameter SI.Density density2 = 7700 "Density of link (e.g., steel: 7700 .. 7900, wood : 400 .. 800)" annotation(Dialog(group = "Parameters only for cylinder and box"));
  //Other parameters
  parameter SI.Acceleration g = 9.81 "Constant gravity acceleration";
  //Components
  Modelica.Mechanics.MultiBody.Parts.Fixed fixed1 annotation(Placement(transformation(origin = {-84.0989,9.18728}, extent = {{-10,-10},{10,10}})));
  Servomechanisms.Mechanism.PLink plink1(shape = shape1, n = n1, r = r1, r_CM = r_CM1, m = m1, shapeLength = shapeLength1, shapeWidth = shapeWidth1, shapeHeight = shapeHeight1, shapeType = shapeType1, extra = extra1, I_11 = I_111, I_22 = I_221, I_33 = I_331, I_21 = I_211, I_31 = I_311, I_32 = I_321, boxLength = boxLength1, boxWidth = boxWidth1, boxHeight = boxHeight1, cylinderLength = cylinderLength1, cylinderDiameter = cylinderDiameter1, density = density1) annotation(Placement(transformation(origin = {-28.3216,8.78092}, extent = {{-25.4947,-25.4947},{25.4947,25.4947}})));
  Servomechanisms.Mechanism.RLink rlink1(shape = shape2, n = n2, r = r2, r_CM = r_CM2, m = m2, shapeLength = shapeLength2, shapeWidth = shapeWidth2, shapeHeight = shapeHeight2, shapeType = shapeType2, extra = extra2, I_11 = I_112, I_22 = I_222, I_33 = I_332, I_21 = I_212, I_31 = I_312, I_32 = I_322, boxLength = boxLength2, boxWidth = boxWidth2, boxHeight = boxHeight2, cylinderLength = cylinderLength2, cylinderDiameter = cylinderDiameter2, density = density2) annotation(Placement(transformation(origin = {42.7032,9.48763}, extent = {{-23.3746,-23.3746},{23.3746,23.3746}})));
  //Interfaces
  Modelica.Mechanics.Rotational.Interfaces.Flange_a flange_r2 annotation(Placement(transformation(origin = {28.9753,-42.7562}, extent = {{-10,-10},{10,10}}), iconTransformation(origin = {21.9082,-8.12722}, extent = {{-10,-10},{10,10}})));
  Modelica.Mechanics.Translational.Interfaces.Flange_a flange_p1 annotation(Placement(transformation(origin = {-35.3357,-35.3357}, extent = {{-10,-10},{10,10}}), iconTransformation(origin = {-58.6573,-6.71379}, extent = {{-10,-10},{10,10}})));
equation
  connect(plink1.flange_a,flange_p1) annotation(Line(points = {{-41.3589,9.90838},{-37.1025,9.90838},{-37.1025,-34.2756},{-37.1025,-34.2756}}));
  connect(rlink1.flange_a,flange_r2) annotation(Line(points = {{24.3986,9.66748},{27.2085,9.66748},{27.2085,-43.1095},{27.2085,-43.1095}}));
  connect(fixed1.frame_b,plink1.frame_a) annotation(Line(points = {{-74.0989,9.18728},{-54.417,9.18728},{-54.417,8.48057},{-54.417,8.48057}}));
  connect(plink1.frame_b,rlink1.frame_a) annotation(Line(points = {{-2.82686,8.78092},{19.4346,8.78092},{19.4346,8.83392},{19.4346,8.83392}}));
  annotation(Documentation(info = "<html>
<head>
<style type=\"text/css\">
h4      { border-radius:8%;background-color: #D8D8D8 ;}
</style>
</head>

<h4>General</h4>
<p>
This class models a PR mechanism.
</p>

<h4>Implementation</h4>
<p>
It uses
<a href=\"modelica://Servomechanisms.Mechanism.RLink\">RLink</a>
and
<a href=\"modelica://Servomechanisms.Mechanism.PLink\">PLink</a>
elements.
</p>
<img src=\"modelica://Servomechanisms/Resources/Images/Mechanism/pr.png\">
<h4>Notes</h4>
<ul>
<li>The first joint is fixed in the origin.</li>
<li>
By default the revolute joint axis is the z axis (rotation axis in direction
<pre>n=[0,0,1]</pre>
), the prismatic joint axis is the x axis
<pre>n=[1,0,0]</pre>
 and gravity is in direction
<pre>n=[0,-1,0]</pre>
</li>
<li>
The generalized coordinates theta and d are the angle in radians and distance in meters respectively.
</li>
<li>
The interfaces are
<a href=\"modelica://Modelica.Mechanics.Rotational\">Modelica.Mechanics.Rotational</a>
and
<a href=\"modelica://Modelica.Mechanics.Translational\">Modelica.Mechanics.Translational</a>
</li>
<li>
The mechanical parameters of each link are editable (dimensions, mass, etc)
</li>
</ul>

<h4>Example</h4>
</html>"), Icon(coordinateSystem(extent = {{-100,-100},{100,100}}, preserveAspectRatio = true, grid = {2,2}), graphics = {Rectangle(origin = {-37.9859,-9.18728}, lineColor = {0,85,255}, fillColor = {0,170,255}, fillPattern = FillPattern.HorizontalCylinder, lineThickness = 1, extent = {{-60,10},{60,-10}}),Rectangle(origin = {56.2191,22.4735}, rotation = 45, lineColor = {0,85,255}, fillColor = {0,170,255}, fillPattern = FillPattern.HorizontalCylinder, lineThickness = 1, extent = {{-50,10},{50,-10}}),Ellipse(origin = {21.941,-8.13815}, lineColor = {170,0,0}, fillColor = {255,65,65}, fillPattern = FillPattern.VerticalCylinder, lineThickness = 1, extent = {{-20,20},{20,-20}}, endAngle = 360),Line(origin = {-85.159,-25.6184}, points = {{0,0},{60,0}}, thickness = 1),Line(origin = {-92.3675,-45.901}, rotation = 45, points = {{0,0},{30,0}}, thickness = 1),Line(origin = {-77.6678,-47.1025}, rotation = 45, points = {{0,0},{30,0}}, thickness = 1),Line(origin = {-60.1413,-47.2438}, rotation = 45, points = {{0,0},{30,0}}, thickness = 1),Rectangle(origin = {-56.6431,-11.2367}, lineColor = {170,0,0}, fillColor = {255,65,65}, fillPattern = FillPattern.HorizontalCylinder, lineThickness = 1, extent = {{-25,20},{25,-20}}),Rectangle(origin = {-15.6537,-8.76325}, lineColor = {0,85,255}, fillColor = {0,170,255}, fillPattern = FillPattern.HorizontalCylinder, lineThickness = 1, extent = {{-60,10},{-21.6254,-1.51943}})}));
end PR;

