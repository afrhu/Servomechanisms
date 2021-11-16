within Servomechanisms.Electrical;
class DCMotor "DC Motor"
  //Icon
  extends Servomechanisms.Utilities.MotorIcon;
  extends Servomechanisms.Utilities.IconName;
  //Parameters
  parameter SI.Resistance R = 0.128 "Armature Resistance";
  parameter SI.Inductance L = 0.000062 "Armature Inductance";
  parameter SI.ElectricalTorqueConstant kt = 0.0305 "Torque Constant";
  parameter SI.Inertia J = 0.000121 "Rotor Inertia";
  parameter SI.RotationalDampingConstant b = 0 "Damping Factor";
  parameter SI.Torque t_m = 0.001 "Max. Friction torque";
  //Components
  Modelica.Electrical.Analog.Basic.Resistor resistor(R = R) annotation(Placement(visible = true, transformation(origin = {-75,50}, extent = {{-10,-10},{10,10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Inductor inductor(L = L) annotation(Placement(visible = true, transformation(origin = {-25,50}, extent = {{-10,-10},{10,10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.RotationalEMF emf(k = kt) annotation(Placement(visible = true, transformation(origin = {0,0}, extent = {{-10,-10},{10,10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.Inertia inertia(J = J) annotation(Placement(visible = true, transformation(origin = {75,0}, extent = {{-10,-10},{10,10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.Damper damper(d = b) annotation(Placement(visible = true, transformation(origin = {60,-25}, extent = {{-10,-10},{10,10}}, rotation = 90)));
  Modelica.Mechanics.Rotational.Components.Fixed fixed annotation(Placement(visible = true, transformation(origin = {60,-50}, extent = {{-10,-10},{10,10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.BearingFriction bearingfriction(peak = 1, tau_pos = [0,t_m]) annotation(Placement(visible = true, transformation(origin = {40,0}, extent = {{-10,-10},{10,10}}, rotation = 0)));
  //Sensors
  Modelica.Mechanics.Rotational.Sensors.AngleSensor anglesensor annotation(Placement(visible = true, transformation(origin = {75,50}, extent = {{10,-10},{-10,10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sensors.SpeedSensor speedsensor annotation(Placement(visible = true, transformation(origin = {75,25}, extent = {{10,-10},{-10,10}}, rotation = 0)));
  //Interfaces
  Modelica.Mechanics.Rotational.Interfaces.Flange_b flange_b annotation(Placement(visible = true, transformation(origin = {100,0}, extent = {{-10,-10},{10,10}}, rotation = 0), iconTransformation(origin = {100,0}, extent = {{-10,-10},{10,10}}, rotation = 0)));
  Modelica.Electrical.Analog.Interfaces.NegativePin pin_n annotation(Placement(visible = true, transformation(origin = {-100,-50}, extent = {{-10,-10},{10,10}}, rotation = 0), iconTransformation(origin = {-100,-50}, extent = {{-10,-10},{10,10}}, rotation = 0)));
  Modelica.Electrical.Analog.Interfaces.PositivePin pin_p annotation(Placement(visible = true, transformation(origin = {-100.902,49.0984}, extent = {{-9.09836,-9.09836},{9.09836,9.09836}}, rotation = 0), iconTransformation(origin = {-100,50}, extent = {{-10,-10},{10,10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput angle annotation(Placement(visible = true, transformation(origin = {50,50}, extent = {{10,-10},{-10,10}}, rotation = 0), iconTransformation(origin = {-50,-100}, extent = {{-10,-10},{10,10}}, rotation = -90)));
  Modelica.Blocks.Interfaces.RealOutput speed annotation(Placement(visible = true, transformation(origin = {50,25}, extent = {{10,-10},{-10,10}}, rotation = 0), iconTransformation(origin = {50,-100}, extent = {{-10,-10},{10,10}}, rotation = -90)));
equation
  connect(speedsensor.w,speed) annotation(Line(points = {{64,25},{56.2061,25},{56.2061,24.356},{56.2061,24.356}}));
  connect(anglesensor.phi,angle) annotation(Line(points = {{64,50},{57.1429,50},{57.1429,48.7119},{57.1429,48.7119}}));
  connect(speedsensor.flange,flange_b) annotation(Line(points = {{85,25},{100.234,25},{100.234,0},{100.234,0}}));
  connect(anglesensor.flange,flange_b) annotation(Line(points = {{85,50},{100.234,50},{100.234,0.468384},{100.234,0.468384}}));
  connect(fixed.flange,damper.flange_a) annotation(Line(points = {{60,-50},{59.9532,-50},{59.9532,-35.1288},{59.9532,-35.1288}}));
  connect(damper.flange_b,inertia.flange_a) annotation(Line(points = {{60,-15},{60,0},{64.637,0},{64.637,0}}));
  connect(inertia.flange_b,flange_b) annotation(Line(points = {{85,0},{97.8923,0},{97.8923,-1.40515},{97.8923,-1.40515}}));
  connect(bearingfriction.flange_b,inertia.flange_a) annotation(Line(points = {{50,0},{65.1054,0},{65.1054,-0.936768},{65.1054,-0.936768}}));
  connect(emf.flange,bearingfriction.flange_a) annotation(Line(points = {{10,0},{30.445,0},{30.445,-0.468384},{30.445,-0.468384}}));
  connect(inductor.n,emf.p) annotation(Line(points = {{-15,50},{0.468384,50},{0.468384,9.83607},{0.468384,9.83607}}));
  connect(pin_n,emf.n) annotation(Line(points = {{-100,-50},{0.936768,-50},{0.936768,-10.7728},{0.936768,-10.7728}}));
  connect(resistor.n,inductor.p) annotation(Line(points = {{-65,50},{-34.6604,50},{-34.6604,50.1171},{-34.6604,50.1171}}));
  connect(resistor.p,pin_p) annotation(Line(points = {{-85,50},{-100.234,50},{-100.234,48.7119},{-100.234,48.7119}}));
  annotation(Documentation(info = "<html>
<head>
<style type=\"text/css\">
h4      { border-radius:8%;background-color: #D8D8D8 ;}
</style>
</head>

<h4>General</h4>
<p>
This is the model of a permanent magnet DC motor, one of the most common electromechanical actuator 
with caractheristics as low inductance and low friction.
It includes dead zone.
</p>

<h4>Implementation</h4>
<strong>DCMotor</strong> is based upon the mathematical model of a 
permanent magnet dc motor.
It is similar to the
<a href=\"modelica://Servomechanisms.Electrical.IdealDCMotor\">
IdealDCMotor
</a> 
class but this model is nonlinear. A dead zone is added by 
using the static friction of 
<a href=\"modelica://Modelica.Mechanics.Rotational.Components.BearingFriction\">
BearingFriction
</a>
component.<br>
Using elements from 
<a href=\"modelica://Modelica\">MSL</a>  
the model was developed to represent the mathematical equations:<br>
<img src=\"modelica://Servomechanisms/Resources/Images/Electrical/dcmotorequation.png\" alt=\"dcmotorequation.png\" >

<h4>Notes</h4>
<ul>
<li>
The behavior of the voltage source is given by a <strong>real input</strong> (for example a real source block could be connected as an input, see 
<a href=\"modelica://Modelica.Blocks.Sources\">Modelica.Blocks.Sources</a>  
).
</li>
<li>This model is linear</li>
<li>All the parameters and variables are in SI units</li>
<li>Has angle and speed sensors as <strong>real outputs</strong> .</li>
</ul>


</html>"), Diagram(coordinateSystem(extent = {{-100,-100},{100,100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2,2})), Icon(coordinateSystem(extent = {{-100,-100},{100,100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2,2}), graphics = {Text(origin = {-38.7173,-67.4584}, lineColor = {255,255,255}, extent = {{-14.4893,12.3515},{14.4893,-12.3515}}, textString = "Phi", fontSize = 30),Text(origin = {50.6413,-66.9359}, extent = {{-14.4893,12.3515},{14.4893,-12.3515}}, textString = "w", fontSize = 30)}));
end DCMotor;

