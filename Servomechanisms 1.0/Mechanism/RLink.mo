within Servomechanisms.Mechanism;
class RLink "Rotational Link"
  //Imports
  import SI = Modelica.Units.SI;
  //Inheritance
  extends Modelica.Mechanics.MultiBody.Interfaces.PartialTwoFrames;
  //Icon
  extends Servomechanisms.Utilities.IconName;
  //Parameters************************
  parameter String shape = "box" "shape of visualizer:\"shape\", \"box\", \"cylinder\" ";
  parameter Modelica.Mechanics.MultiBody.Types.Axis n = {0,0,1} "Axis of rotation resolved in frame_a (= same as in frame_b)" annotation(Evaluate = true);
  //SHAPE Parameters
  parameter SI.Position r[3](start = {0,0,0}) "Vector from frame_a to frame_b resolved in frame_a" annotation(Dialog(tab = "if shape"));
  parameter SI.Position r_CM[3](start = {0,0,0}) "Vector from frame_a to center of mass, resolved in frame_a" annotation(Dialog(tab = "if shape"));
  parameter SI.Mass m(min = 0, start = 1) "Mass of rigid body" annotation(Dialog(tab = "if shape"));
  parameter SI.Length shapeLength = 1 annotation(Dialog(tab = "if shape"));
  parameter SI.Distance shapeWidth = boxLength / 20 annotation(Dialog(tab = "if shape"));
  parameter SI.Distance shapeHeight = boxWidth annotation(Dialog(tab = "if shape"));
  parameter String shapeType = "modelica://Servomechanisms//Resources//b2.dxf" "Type of shape" annotation(Dialog(tab = "if shape"));
  parameter Real extra = 1 "Additional parameter depending on shapeType (see docu of Visualizers.Advanced.Shape)" annotation(Dialog(tab = "if shape"));
  parameter SI.Inertia I_11 = 0.001 "(1,1) element of inertia tensor" annotation(Dialog(tab = "if shape", group = "Inertia tensor (resolved in center of mass, parallel to frame_a)"));
  parameter SI.Inertia I_22 = 0.001 "(2,2) element of inertia tensor" annotation(Dialog(tab = "if shape", group = "Inertia tensor (resolved in center of mass, parallel to frame_a)"));
  parameter SI.Inertia I_33 = 0.001 "(3,3) element of inertia tensor" annotation(Dialog(tab = "if shape", group = "Inertia tensor (resolved in center of mass, parallel to frame_a)"));
  parameter SI.Inertia I_21 = 0 "(2,1) element of inertia tensor" annotation(Dialog(tab = "if shape", group = "Inertia tensor (resolved in center of mass, parallel to frame_a)"));
  parameter SI.Inertia I_31 = 0 "(3,1) element of inertia tensor" annotation(Dialog(tab = "if shape", group = "Inertia tensor (resolved in center of mass, parallel to frame_a)"));
  parameter SI.Inertia I_32 = 0 "(3,2) element of inertia tensor" annotation(Dialog(tab = "if shape", group = "Inertia tensor (resolved in center of mass, parallel to frame_a)"));
  //BOX Parameters
  parameter SI.Length boxLength = 1 annotation(Dialog(tab = "if box"));
  parameter SI.Distance boxWidth = boxLength / 20 annotation(Dialog(tab = "if box"));
  parameter SI.Distance boxHeight = boxWidth annotation(Dialog(tab = "if box"));
  //CYLINDER Parameters
  parameter SI.Length cylinderLength = 1 annotation(Dialog(tab = "if cylinder"));
  parameter SI.Distance cylinderDiameter = cylinderLength / 20 annotation(Dialog(tab = "if cylinder"));
  //COMMON Parameters
  parameter SI.Density density = 7700 "Density of link (e.g., steel: 7700 .. 7900, wood : 400 .. 800)" annotation(Dialog(group = "Parameters only for cylinder and box"));
  //FRAMES Parameters
  parameter Real frameFactor = 0.1 "ratio of frame respect world origin frame" annotation(Dialog(group = "Frames"));
  parameter SI.Position rFrame[3] = {0,0,0} annotation(Dialog(group = "Frames"));
  //Components
  Modelica.Mechanics.MultiBody.Joints.Revolute revolute1(useAxisFlange = true, n = n) annotation(Placement(visible = true, transformation(origin = {-50,0}, extent = {{-10,-10},{10,10}}, rotation = 0)));
  Link link(cylinderLength = cylinderLength, cylinderDiameter = cylinderDiameter, shape = shape, r = r, r_CM = r_CM, m = m, shapeLength = shapeLength, shapeWidth = shapeWidth, shapeHeight = shapeHeight, I_11 = I_11, I_22 = I_22, I_33 = I_33, shapeType = shapeType, extra = extra, I_21 = I_21, I_31 = I_31, I_32 = I_32, boxLength = boxLength, boxWidth = boxWidth, boxHeight = boxHeight, density = density) annotation(Placement(visible = true, transformation(origin = {0,0}, extent = {{-10,-10},{10,10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Visualizers.FixedFrame origin(length = 0.1) annotation(Placement(visible = true, transformation(origin = {-48.3988,-44.6021}, extent = {{-10,-10},{10,10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.FixedRotation fixedrotation1(animation = false) annotation(Placement(visible = true, transformation(origin = {3.18021,51.2367}, extent = {{-10,-10},{10,10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Visualizers.FixedFrame fixedframe1(length = frameFactor) annotation(Placement(visible = true, transformation(origin = {72.944,51.6523}, extent = {{-10,-10},{10,10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.FixedTranslation fixedtranslation1(r = rFrame, animation = false) annotation(Placement(visible = true, transformation(origin = {35.7793,50.9131}, extent = {{-10,-10},{10,10}}, rotation = 0)));
  //Interfaces
  Modelica.Mechanics.Rotational.Interfaces.Flange_a flange_a annotation(Placement(visible = true, transformation(origin = {-50,50}, extent = {{-10,-10},{10,10}}, rotation = 0), iconTransformation(origin = {-76.4183,0.76943}, extent = {{-7.52312,-7.52312},{7.52312,7.52312}}, rotation = 0)));
equation
  connect(fixedtranslation1.frame_b,fixedframe1.frame_a) annotation(Line(points = {{45.7793,50.9131},{63.6042,50.9131},{63.6042,51.6523},{62.944,51.6523}}));
  connect(fixedrotation1.frame_b,fixedtranslation1.frame_a) annotation(Line(points = {{13.1802,51.2367},{26.1484,51.2367},{25.7793,51.8499},{25.7793,50.9131}}));
  connect(link.frame_b,fixedrotation1.frame_a) annotation(Line(points = {{10,0},{18.7279,0},{18.7279,32.1555},{-21.2014,32.1555},{-21.2014,51.5901},{-7.06714,51.5901},{-7.06714,51.5901}}));
  connect(origin.frame_a,revolute1.frame_b) annotation(Line(points = {{-58.3988,-44.6021},{-67.1378,-44.6021},{-67.1378,-22.9682},{-30.742,-22.9682},{-30.742,0},{-39.576,0},{-39.576,0}}));
  connect(flange_a,revolute1.axis) annotation(Line(points = {{-50,50},{-49.4662,50},{-49.4662,9.96441},{-49.4662,9.96441}}));
  connect(revolute1.frame_b,link.frame_a) annotation(Line(points = {{-40,0},{-9.96441,0},{-9.96441,0.355872},{-9.96441,0.355872}}));
  connect(frame_a,revolute1.frame_a) annotation(Line(points = {{-50,0},{-100,0}}));
  connect(frame_b,link.frame_b) annotation(Line(points = {{10,0},{100,0}}));
  annotation(Diagram(coordinateSystem(extent = {{-100,-100},{100,100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2,2})), Documentation(info = "
<html>
<head>
<style type=\"text/css\">
h4      { border-radius:8%;background-color: #D8D8D8 ;}
</style>
</head>

<h4>General</h4>
<p>
This is the model of a rotational link.
</p>

<h4>Implementation</h4>
<p>
Using the component
<a href=\"modelica://Servomechanisms.Mechanism.Link\">Link</a> 
and 
<a href=\"modelica://Modelica.Mechanics.MultiBody.Joints.Revolute\">Revolute Joint</a> 
.
The revolute joint uses:
<pre>
useAxisFlange = true
</pre>
to enable the mechanical rotational interface (for example a motor or a torque source).
</p>

<h4>Notes</h4>
<ul>
<li>
The user can modify parameters of the link.
</li>
<li>
A fixed frame is added to visualize the frame_b of the link (although it can be placed in other location in the parameters).
</li>
<li>
For some reason, in the diagraman view the connections with frame_a
and frame_b are not visible.
</li>
<li>
To use this element it is necessary to include a 
<a href=\"modelica://Modelica.Mechanics.MultiBody.World\">World</a> 
component.
</li>
</ul>

<h4>Example</h4>
<a href=\"modelica://Servomechanisms.Mechanism.RR\">RR</a> 

</html>
"), Icon(coordinateSystem(extent = {{-100,-100},{100,100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2,2}), graphics = {Rectangle(lineColor = {0,85,255}, fillColor = {0,170,255}, fillPattern = FillPattern.HorizontalCylinder, lineThickness = 1, extent = {{-100,10},{100,-10}}),Ellipse(origin = {-77.0037,0.749064}, lineColor = {170,0,0}, fillColor = {255,87,87}, fillPattern = FillPattern.VerticalCylinder, lineThickness = 1, extent = {{-20,20},{20,-20}}, endAngle = 360),Text(origin = {-2.10773,-74.0047}, lineColor = {94,94,94}, extent = {{-48.9461,11.7096},{48.9461,-11.7096}}, textString = "n = %n")}));
end RLink;

