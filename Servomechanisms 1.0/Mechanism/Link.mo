within Servomechanisms.Mechanism;
class Link "Link"
  //Imports
  import SI = Modelic.Units.SI;
  import ShapePath = Modelica.Mechanics.MultiBody.Parts;
  import Types = Modelica.Mechanics.MultiBody.Types;
  import Modelic.Units.SI.Conversions.to_unit1;
  //Inheritance
  extends Modelica.Mechanics.MultiBody.Interfaces.PartialTwoFrames;
  //Icon
  extends Servomechanisms.Utilities.IconName;
  //Parameters***************************
  parameter String shape = "box" "shape of visualizer:\"shape\", \"box\", \"cylinder\" ";
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
  //Components
  ShapePath.BodyShape shape1(animateSphere = false, r = r, r_CM = r_CM, m = m, length = shapeLength, width = shapeWidth, height = shapeHeight, shapeType = shapeType, extra = extra, I_11 = I_11, I_22 = I_22, I_33 = I_33, I_21 = I_21, I_31 = I_31, I_32 = I_32) if shape == "shape";
  ShapePath.BodyBox box1(each r = {boxLength,0,0}, length = boxLength, width = boxWidth, height = boxHeight, density = density) if shape == "box";
  ShapePath.BodyCylinder cylinder1(each r = {cylinderLength,0,0}, length = cylinderLength, diameter = cylinderDiameter, density = density) if shape == "cylinder";
  /*
	//Alternative Code for replaceable classes but doesn´t work in the OMEdit yet
	class LinkShapetest
  replaceable class Shape = Modelica.Mechanics.MultiBody.Parts.BodyShape;
  //extends Modelica.Mechanics.MultiBody.Interfaces.PartialTwoFrames;
  //replaceable class shape = Modelica.Mechanics.MultiBody.Parts.BodyShape;
  //replaceable class Shape = Modelica.Mechanics.MultiBody.Parts.BodyShape annotation(choices(choice(redeclare class shape = Shape.BodyBox), choice(redeclare class shape = Shape.BodyCylinder)));
   replaceable class Shape = Modelica.Mechanics.MultiBody.Parts.BodyShape;
   Shape bodyshape(r = {1,0,0}) annotation(Placement(visible = true, transformation(origin = {0,0}, extent = {{-10,-10},{10,10}}, rotation = 0)));
  end LinkShapetest;
  LinkShapetest linkshape1(redeclare class Shape = ShapePath.BodyShape, bodyshape.animateSphere = false, bodyshape.r = r, bodyshape.r_CM = r_CM, bodyshape.m = m, bodyshape.length = shapeLength, bodyshape.width = shapeWidth, bodyshape.height = shapeHeight, bodyshape.shapeType = shapeType, bodyshape.extra = extra, bodyshape.I_11 = I_11, bodyshape.I_22 = I_22, bodyshape.I_33 = I_33, bodyshape.I_21 = I_21, bodyshape.I_31 = I_31, bodyshape.I_32 = I_32) if shape == "shape";
  LinkShapetest linkshape2(redeclare class Shape = ShapePath.BodyBox, each bodyshape.r = {boxLength,0,0}, bodyshape.length = boxLength, bodyshape.width = boxWidth, bodyshape.height = boxHeight, bodyshape.density = density) if shape == "box";
  LinkShapetest linkshape3(redeclare class Shape = ShapePath.BodyCylinder, each bodyshape.r = {cylinderLength,0,0}, bodyshape.length = cylinderLength, bodyshape.diameter = cylinderDiameter, bodyshape.density = density) if shape == "cylinder";
	*/
equation
  if shape == "shape" then
    connect(frame_a,shape1.frame_a);
    connect(frame_b,shape1.frame_b);
  elseif shape == "box" then
    connect(frame_a,box1.frame_a);
    connect(frame_b,box1.frame_b);
  elseif shape == "cylinder" then
    connect(frame_a,cylinder1.frame_a);
    connect(frame_b,cylinder1.frame_b);
  else
  end if;
  annotation(Diagram(coordinateSystem(extent = {{-100,-100},{100,100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2,2})), Documentation(info = "
<html>
<head>
<style type=\"text/css\">
h4      { border-radius:8%;background-color: #D8D8D8 ;}
</style>
</head>

<h4>General</h4>
<p>
This class enables the creation of a <strong>link</strong> element by selecting one of the predefine components from Multibody library:
<a href=\"modelica://Modelica.Mechanics.MultiBody.Parts.BodyBox\">BodyBox</a> 
,
<a href=\"modelica://Modelica.Mechanics.MultiBody.Parts.BodyCylinder\">BodyCylinder</a> 
or
<a href=\"modelica://Modelica.Mechanics.MultiBody.Parts.BodyShape\">BodyShape</a> 
.
</p>

<h4>Implementation</h4>
<em>IF statements</em> allow the selection of one 
kind of link from the 
<a href=\"modelica://Modelica.Multibody\">Multibody</a> 
library.<br>
<em>Replaceable</em> statement was intended at the beginning but
it did not work well.<br>

<h4>Notes</h4>
<ul>
<li>
The advantage of using this component is that if one selects for
example box or cylinder it is necessary only to input the dimensions
length, width and heigth or length and diameter because the density and
values of mass and inertia are automatically calculate.
</li>
<li>
In the other case (bodyshape), the user must input the directory of a 3d model for
visualization (it has been tested with modelica3d library but it is
yet under development) and the values of mass, vector from frame_a to
frame_b, vector from frame_a to center of mass and the inertia tensor.
</li>
<li>
At the moment, not all the parameters of the original elements (BodyShape,
BodyBox, BodyCylinder) are utilized. This could be a limitation for
the user.
</li></ul>

</html>
"), Icon(coordinateSystem(extent = {{-100,-100},{100,100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2,2}), graphics = {Rectangle(origin = {18.6667,0.8}, lineColor = {0,85,255}, fillColor = {0,170,255}, fillPattern = FillPattern.VerticalCylinder, lineThickness = 1, extent = {{-87.4667,49.3333},{49.0667,-48.2667}}),Text(origin = {-20.5795,-66.2898}, lineColor = {128,128,128}, extent = {{-47.0954,8.90459},{91.0247,-26.318}}, textString = "shape = %shape")}));
end Link;

