within Servomechanisms.Mechanism;

class RR "RR Mechanism"
  //Icon
  extends Servomechanisms.Utilities.IconNameB;
  import SI = Modelica.Units.SI;
  //Parameters 1
  parameter String shape1 = "box" "shape of visualizer:\"shape\", \"box\", \"cylinder\" ";
  parameter Modelica.Mechanics.MultiBody.Types.Axis n1 = {0, 0, 1} "Axis of rotation resolved in frame_a (= same as in frame_b)" annotation(
    Evaluate = true);
  //SHAPE Parameters
  parameter SI.Position r1[3](start = {0, 0, 0}) "Vector from frame_a to frame_b resolved in frame_a" annotation(
    Dialog(tab = "if shape"));
  parameter SI.Position r_CM1[3](start = {0, 0, 0}) "Vector from frame_a to center of mass, resolved in frame_a" annotation(
    Dialog(tab = "if shape"));
  parameter SI.Mass m1(min = 0, start = 1) "Mass of rigid body" annotation(
    Dialog(tab = "if shape"));
  parameter SI.Length shapeLength1 = 1 annotation(
    Dialog(tab = "if shape"));
  parameter SI.Distance shapeWidth1 = boxLength1 / 20 annotation(
    Dialog(tab = "if shape"));
  parameter SI.Distance shapeHeight1 = boxWidth1 annotation(
    Dialog(tab = "if shape"));
  parameter String shapeType1 = "modelica://Servomechanisms//Resources//b2.dxf" "Type of shape" annotation(
    Dialog(tab = "if shape"));
  parameter Real extra1 = 1 "Additional parameter depending on shapeType (see docu of Visualizers.Advanced.Shape)" annotation(
    Dialog(tab = "if shape"));
  parameter SI.Inertia I_111 = 0.001 "(1,1) element of inertia tensor" annotation(
    Dialog(tab = "if shape", group = "Inertia tensor (resolved in center of mass, parallel to frame_a)"));
  parameter SI.Inertia I_221 = 0.001 "(2,2) element of inertia tensor" annotation(
    Dialog(tab = "if shape", group = "Inertia tensor (resolved in center of mass, parallel to frame_a)"));
  parameter SI.Inertia I_331 = 0.001 "(3,3) element of inertia tensor" annotation(
    Dialog(tab = "if shape", group = "Inertia tensor (resolved in center of mass, parallel to frame_a)"));
  parameter SI.Inertia I_211 = 0 "(2,1) element of inertia tensor" annotation(
    Dialog(tab = "if shape", group = "Inertia tensor (resolved in center of mass, parallel to frame_a)"));
  parameter SI.Inertia I_311 = 0 "(3,1) element of inertia tensor" annotation(
    Dialog(tab = "if shape", group = "Inertia tensor (resolved in center of mass, parallel to frame_a)"));
  parameter SI.Inertia I_321 = 0 "(3,2) element of inertia tensor" annotation(
    Dialog(tab = "if shape", group = "Inertia tensor (resolved in center of mass, parallel to frame_a)"));
  //BOX Parameters
  parameter SI.Length boxLength1 = 1 annotation(
    Dialog(tab = "if box"));
  parameter SI.Distance boxWidth1 = boxLength1 / 20 annotation(
    Dialog(tab = "if box"));
  parameter SI.Distance boxHeight1 = boxWidth1 annotation(
    Dialog(tab = "if box"));
  //CYLINDER Parameters
  parameter SI.Length cylinderLength1 = 1 annotation(
    Dialog(tab = "if cylinder"));
  parameter SI.Distance cylinderDiameter1 = cylinderLength1 / 20 annotation(
    Dialog(tab = "if cylinder"));
  //COMMON Parameters
  parameter SI.Density density1 = 7700 "Density of link (e.g., steel: 7700 .. 7900, wood : 400 .. 800)" annotation(
    Dialog(group = "Parameters only for cylinder and box"));
  //Parameters 2
  parameter String shape2 = "box" "shape of visualizer:\"shape\", \"box\", \"cylinder\" ";
  parameter Modelica.Mechanics.MultiBody.Types.Axis n2 = {0, 0, 1} "Axis of rotation resolved in frame_a (= same as in frame_b)" annotation(
    Evaluate = true);
  //SHAPE Parameters
  parameter SI.Position r2[3](start = {0, 0, 0}) "Vector from frame_a to frame_b resolved in frame_a" annotation(
    Dialog(tab = "if shape"));
  parameter SI.Position r_CM2[3](start = {0, 0, 0}) "Vector from frame_a to center of mass, resolved in frame_a" annotation(
    Dialog(tab = "if shape"));
  parameter SI.Mass m2(min = 0, start = 1) "Mass of rigid body" annotation(
    Dialog(tab = "if shape"));
  parameter SI.Length shapeLength2 = 1 annotation(
    Dialog(tab = "if shape"));
  parameter SI.Distance shapeWidth2 = boxLength2 / 20 annotation(
    Dialog(tab = "if shape"));
  parameter SI.Distance shapeHeight2 = boxWidth2 annotation(
    Dialog(tab = "if shape"));
  parameter String shapeType2 = "modelica://Servomechanisms//Resources//b2.dxf" "Type of shape" annotation(
    Dialog(tab = "if shape"));
  parameter Real extra2 = 1 "Additional parameter depending on shapeType (see docu of Visualizers.Advanced.Shape)" annotation(
    Dialog(tab = "if shape"));
  parameter SI.Inertia I_112 = 0.001 "(1,1) element of inertia tensor" annotation(
    Dialog(tab = "if shape", group = "Inertia tensor (resolved in center of mass, parallel to frame_a)"));
  parameter SI.Inertia I_222 = 0.001 "(2,2) element of inertia tensor" annotation(
    Dialog(tab = "if shape", group = "Inertia tensor (resolved in center of mass, parallel to frame_a)"));
  parameter SI.Inertia I_332 = 0.001 "(3,3) element of inertia tensor" annotation(
    Dialog(tab = "if shape", group = "Inertia tensor (resolved in center of mass, parallel to frame_a)"));
  parameter SI.Inertia I_212 = 0 "(2,1) element of inertia tensor" annotation(
    Dialog(tab = "if shape", group = "Inertia tensor (resolved in center of mass, parallel to frame_a)"));
  parameter SI.Inertia I_312 = 0 "(3,1) element of inertia tensor" annotation(
    Dialog(tab = "if shape", group = "Inertia tensor (resolved in center of mass, parallel to frame_a)"));
  parameter SI.Inertia I_322 = 0 "(3,2) element of inertia tensor" annotation(
    Dialog(tab = "if shape", group = "Inertia tensor (resolved in center of mass, parallel to frame_a)"));
  //BOX Parameters
  parameter SI.Length boxLength2 = 1 annotation(
    Dialog(tab = "if box"));
  parameter SI.Distance boxWidth2 = boxLength2 / 20 annotation(
    Dialog(tab = "if box"));
  parameter SI.Distance boxHeight2 = boxWidth2 annotation(
    Dialog(tab = "if box"));
  //CYLINDER Parameters
  parameter SI.Length cylinderLength2 = 1 annotation(
    Dialog(tab = "if cylinder"));
  parameter SI.Distance cylinderDiameter2 = cylinderLength2 / 20 annotation(
    Dialog(tab = "if cylinder"));
  //COMMON Parameters
  parameter SI.Density density2 = 7700 "Density of link (e.g., steel: 7700 .. 7900, wood : 400 .. 800)" annotation(
    Dialog(group = "Parameters only for cylinder and box"));
  //Other parameters
  parameter SI.Acceleration g = 9.81 "Constant gravity acceleration";
  //Components
  Servomechanisms.Mechanism.RLink rotational2(shape = shape2, n = n2, r = r2, r_CM = r_CM2, m = m2, shapeLength = shapeLength2, shapeWidth = shapeWidth2, shapeHeight = shapeHeight2, shapeType = shapeType2, extra = extra2, I_11 = I_112, I_22 = I_222, I_33 = I_332, I_21 = I_212, I_31 = I_312, I_32 = I_322, boxLength = boxLength2, boxWidth = boxWidth2, boxHeight = boxHeight2, cylinderLength = cylinderLength2, cylinderDiameter = cylinderDiameter2, density = density2) annotation(
    Placement(visible = true, transformation(origin = {54.5785, 4.15691}, extent = {{-27.2482, -27.2482}, {27.2482, 27.2482}}, rotation = 0)));
  Servomechanisms.Mechanism.RLink rotational1(shape = shape1, n = n1, r = r1, r_CM = r_CM1, m = m1, shapeLength = shapeLength1, shapeWidth = shapeWidth1, shapeHeight = shapeHeight1, shapeType = shapeType1, extra = extra1, I_11 = I_111, I_22 = I_221, I_33 = I_331, I_21 = I_211, I_31 = I_311, I_32 = I_321, boxLength = boxLength1, boxWidth = boxWidth1, boxHeight = boxHeight1, cylinderLength = cylinderLength1, cylinderDiameter = cylinderDiameter1, density = density1) annotation(
    Placement(visible = true, transformation(origin = {-23.5012, 4.29742}, extent = {{-27.2482, -27.2482}, {27.2482, 27.2482}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.Fixed fixed1 annotation(
    Placement(visible = true, transformation(origin = {-82.904, 3.27869}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Interfaces.Flange_a flange_rotational1 annotation(
    Placement(visible = true, transformation(origin = {-45.4333, -44.9649}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-97.8923, -10.7729}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Interfaces.Flange_a flange_rotational2 annotation(
    Placement(visible = true, transformation(origin = {34.6604, -48.7119}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-23.4192, 59.0164}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(rotational2.flange_a, flange_rotational2) annotation(
    Line(points = {{33.2405, 4.36657}, {36.0656, 4.36657}, {36.0656, -48.7119}, {36.0656, -48.7119}}));
  connect(rotational1.flange_a, flange_rotational1) annotation(
    Line(points = {{-44.8392, 4.50708}, {-44.9649, 4.50708}, {-44.9649, -48.2436}, {-44.9649, -48.2436}}));
  connect(fixed1.frame_b, rotational1.frame_a) annotation(
    Line(points = {{-72.904, 3.27869}, {-50.5855, 3.27869}, {-50.5855, 3.27869}, {-50.5855, 3.27869}}));
  connect(rotational1.frame_b, rotational2.frame_a) annotation(
    Line(points = {{3.747, 4.29742}, {26.6979, 4.29742}, {26.6979, 4.21546}, {26.6979, 4.21546}}));
  annotation(
    Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})),
    Documentation(info = "<html>
<head>
<style type=\"text/css\">
h4      { border-radius:8%;background-color: #D8D8D8 ;}
</style>
</head>

<h4>General</h4>
<p>
This class models a 2R mechanism. It is intended to be used as a RR planar mechanism also known as planar elbow manipulator.
</p>

<h4>Implementation</h4>
<p>
It uses
<a href=\"modelica://Servomechanisms.Mechanism.RLink\">RLink</a>
element and it's based on the next scheme:
</p>
<img src=\"modelica://Servomechanisms/Resources/Images/Mechanism/RR.png\" style=\"width:45%;\">
<h4>Notes</h4>
<ul>
<li>The first joint is fixed in the origin.</li>
<li>
By default the joint axis is the z axis (rotation axis in direction
<pre>n=[0,0,1]</pre>
) and gravity is in direction
<pre>n=[0,-1,0]</pre>
</li>
<li>
The generalized coordinates theta1 and theta2 are the angles of each joint in radians as shown in the figure.
</li>
<li>
The interfaces are
<a href=\"modelica://Modelica.Mechanics.Rotational\">Modelica.Mechanics.Rotational</a>
</li>
<li>
The mechanical parameters of each link are editable (dimensions, mass, etc)
</li>
<li>
The
<a href=\"modelica://Modelica.Mechanics.MultiBody.World\">World</a>
element is included in the model.
</li>
</ul>
</html>"),
    Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2}), graphics = {Rectangle(origin = {-63.2319, 22.4824}, rotation = 45, lineColor = {0, 85, 255}, fillColor = {0, 170, 255}, fillPattern = FillPattern.HorizontalCylinder, extent = {{-50, 10}, {50, -10}}), Rectangle(origin = {15.7845, 22.3419}, rotation = -45, lineColor = {0, 85, 255}, fillColor = {0, 170, 255}, fillPattern = FillPattern.HorizontalCylinder, extent = {{-50, 10}, {50, -10}}), Ellipse(origin = {-23.3255, 59.1101}, lineColor = {170, 0, 0}, fillColor = {255, 65, 65}, fillPattern = FillPattern.VerticalCylinder, lineThickness = 1, extent = {{-20, 20}, {20, -20}}), Line(origin = {-91.4813, -24.8514}, points = {{-28.8934, -0.441299}, {29.1863, -0.441299}}, thickness = 1), Line(origin = {-108.952, -24.0552}, rotation = 45, points = {{-28.8934, -0.441299}, {-2.19543, -0.688384}}, thickness = 1), Line(origin = {-93.6359, -25.1325}, rotation = 45, points = {{-28.8934, -0.441299}, {-2.19543, -0.688384}}, thickness = 1), Line(origin = {-76.4462, -24.8046}, rotation = 45, points = {{-28.8934, -0.441299}, {-2.19543, -0.688384}}, thickness = 1), Ellipse(origin = {-97.7986, -11.1475}, lineColor = {170, 0, 0}, fillColor = {255, 65, 65}, fillPattern = FillPattern.VerticalCylinder, lineThickness = 1, extent = {{-20, 20}, {20, -20}})}));
end RR;
