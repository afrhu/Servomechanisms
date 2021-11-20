within Servomechanisms.Mechanism;
model PLink "Prismatic Link"
  //Imports
  import SI = Modelica.Units.SI;
  //Inheritance
  extends Modelica.Mechanics.MultiBody.Interfaces.PartialTwoFrames;
  //Icon
  extends Servomechanisms.Utilities.IconName;
  //Parameters***************************
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
  Modelica.Mechanics.MultiBody.Joints.Prismatic prismatic1(useAxisFlange = true, n = n) annotation(Placement(visible = true, transformation(origin = {-50,0}, extent = {{-10,-10},{10,10}}, rotation = 0)));
  Link link(cylinderLength = cylinderLength, cylinderDiameter = cylinderDiameter, shape = shape, r = r, r_CM = r_CM, m = m, shapeLength = shapeLength, shapeWidth = shapeWidth, shapeHeight = shapeHeight, I_11 = I_11, I_22 = I_22, I_33 = I_33, shapeType = shapeType, extra = extra, I_21 = I_21, I_31 = I_31, I_32 = I_32, boxLength = boxLength, boxWidth = boxWidth, boxHeight = boxHeight, density = density) annotation(Placement(visible = true, transformation(origin = {0,0}, extent = {{-10,-10},{10,10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Visualizers.FixedFrame origin(length = 0.1) annotation(Placement(visible = true, transformation(origin = {-48.3988,-44.6021}, extent = {{-10,-10},{10,10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.FixedRotation fixedrotation1(animation = false) annotation(Placement(visible = true, transformation(origin = {3.18021,51.2367}, extent = {{-10,-10},{10,10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Visualizers.FixedFrame fixedframe1(length = frameFactor) annotation(Placement(visible = true, transformation(origin = {72.944,51.6523}, extent = {{-10,-10},{10,10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.FixedTranslation fixedtranslation1(r = rFrame, animation = false) annotation(Placement(visible = true, transformation(origin = {35.7793,50.9131}, extent = {{-10,-10},{10,10}}, rotation = 0)));
  //Interfaces
  Modelica.Mechanics.Translational.Interfaces.Flange_a flange_a annotation(Placement(visible = true, transformation(origin = {-50,50}, extent = {{-10,-10},{10,10}}, rotation = 0), iconTransformation(origin = {-44.1281,5.71332}, extent = {{-10,-10},{10,10}}, rotation = 0)));
equation
  connect(flange_a,prismatic1.axis) annotation(Line(points = {{-50,50},{-41.791,50},{-41.791,5.97015},{-41.791,5.97015}}));
  connect(prismatic1.frame_b,origin.frame_a) annotation(Line(points = {{-40,0},{-29.3144,0},{-29.3144,-23.6407},{-70.4492,-23.6407},{-70.4492,-44.9173},{-57.6832,-44.9173},{-57.6832,-44.9173}}));
  connect(fixedtranslation1.frame_b,fixedframe1.frame_a) annotation(Line(points = {{45.7793,50.9131},{62.8842,50.9131},{62.8842,52.0095},{62.8842,52.0095}}));
  connect(fixedrotation1.frame_b,fixedtranslation1.frame_a) annotation(Line(points = {{13.1802,51.2367},{25.5319,51.2367},{25.5319,50.1182},{25.5319,50.1182}}));
  connect(link.frame_b,fixedrotation1.frame_a) annotation(Line(points = {{10,0},{27.896,0},{27.896,25.5319},{-20.8038,25.5319},{-20.8038,51.0638},{-6.61939,51.0638},{-6.61939,51.0638}}));
  connect(prismatic1.frame_b,link.frame_a) annotation(Line(points = {{-40,0},{-9.45626,0},{-9.45626,-0.945626},{-9.45626,-0.945626}}));
  connect(frame_a,prismatic1.frame_a) annotation(Line(points = {{-50,0},{-100,0}}));
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
This is the model of a prismatic link. 
</p>

<h4>Implementation</h4>
<p>
Using the component
<a href=\"modelica://Servomechanisms.Mechanism.Link\">Link</a> 
and 
<a href=\"modelica://Modelica.Mechanics.MultiBody.Joints.Prismatic\">Prismatic Joint</a> 
.
The revolute joint uses:
<pre>
useAxisFlange = true
</pre>
to enable the mechanical translational interface (for example a force source).
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
<a href=\"modelica://Servomechanisms.Mechanism.PP\">PP<a>

</html>
"), Icon(coordinateSystem(extent = {{-100,-100},{100,100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2,2}), graphics = {Rectangle(origin = {2.8103,-0.468384}, lineColor = {0,85,255}, fillColor = {0,170,255}, fillPattern = FillPattern.HorizontalCylinder, lineThickness = 1, extent = {{-100,10},{100,-10}}),Rectangle(origin = {-41.452,0.234192}, lineColor = {170,0,0}, fillColor = {255,65,65}, fillPattern = FillPattern.HorizontalCylinder, lineThickness = 1, extent = {{-32.5527,18.5012},{32.5527,-18.5012}}),Rectangle(origin = {-40.7494,4.21546}, lineColor = {0,85,255}, fillColor = {0,170,255}, fillPattern = FillPattern.HorizontalCylinder, lineThickness = 1, extent = {{-26.6979,4.21546},{26.6979,-4.21546}}),Text(origin = {-5.30035,-67.3145}, lineColor = {128,128,128}, extent = {{-50.53,14.311},{50.53,-14.311}}, textString = "n = %n")}));
end PLink;

