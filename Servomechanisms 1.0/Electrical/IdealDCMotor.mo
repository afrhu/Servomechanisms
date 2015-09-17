within Servomechanisms.Electrical;
class IdealDCMotor "Ideal DC Motor"
  //Icon
  extends Modelica.Icons.MotorIcon;
  extends Servomechanisms.Utilities.IconName;
  //Parameters
  parameter SI.Resistance R = 0.128 "Armature Resistance";
  parameter SI.Inductance L = 0.000062 "Armature Inductance";
  parameter SI.ElectricalTorqueConstant kt = 0.0305 "Torque Constant";
  parameter SI.Inertia J = 0.000121 "Rotor Inertia";
  parameter SI.RotationalDampingConstant b = 0 "Damping Factor";
  //Components
  Modelica.Electrical.Analog.Basic.Resistor resistor(R = R) annotation(Placement(transformation(origin = {-75,50}, extent = {{-10,-10},{10,10}})));
  Modelica.Electrical.Analog.Basic.Inductor inductor(L = L) annotation(Placement(transformation(origin = {-25,50}, extent = {{-10,-10},{10,10}})));
  Modelica.Electrical.Analog.Basic.EMF emf(k = kt) annotation(Placement(transformation(extent = {{-10,-10},{10,10}})));
  Modelica.Mechanics.Rotational.Components.Inertia inertia(J = J) annotation(Placement(transformation(origin = {75,0}, extent = {{-10,-10},{10,10}})));
  Modelica.Mechanics.Rotational.Components.Damper damper(d = b) annotation(Placement(transformation(origin = {25.2927,-33.7237}, extent = {{-10,-10},{10,10}}, rotation = 90)));
  Modelica.Mechanics.Rotational.Components.Fixed fixed annotation(Placement(transformation(origin = {24.356,-67.4473}, extent = {{-10,-10},{10,10}})));
  //Sensors
  Modelica.Mechanics.Rotational.Sensors.AngleSensor anglesensor annotation(Placement(transformation(origin = {75,50}, extent = {{10,-10},{-10,10}})));
  Modelica.Mechanics.Rotational.Sensors.SpeedSensor speedsensor annotation(Placement(transformation(origin = {75,25}, extent = {{10,-10},{-10,10}})));
  //Interfaces
  Modelica.Mechanics.Rotational.Interfaces.Flange_b flange_b annotation(Placement(transformation(origin = {100,0}, extent = {{-10,-10},{10,10}}), iconTransformation(origin = {100,0}, extent = {{-10,-10},{10,10}})));
  Modelica.Electrical.Analog.Interfaces.NegativePin pin_n annotation(Placement(transformation(origin = {-100,-50}, extent = {{-10,-10},{10,10}}), iconTransformation(origin = {-100,-50}, extent = {{-10,-10},{10,10}})));
  Modelica.Electrical.Analog.Interfaces.PositivePin pin_p annotation(Placement(transformation(origin = {-100.902,49.0984}, extent = {{-9.09836,-9.09836},{9.09836,9.09836}}), iconTransformation(origin = {-100,50}, extent = {{-10,-10},{10,10}})));
  Modelica.Blocks.Interfaces.RealOutput angle annotation(Placement(transformation(origin = {50,50}, extent = {{10,-10},{-10,10}}), iconTransformation(origin = {-50,-100}, extent = {{-10,-10},{10,10}}, rotation = -90)));
  Modelica.Blocks.Interfaces.RealOutput speed annotation(Placement(transformation(origin = {50,25}, extent = {{10,-10},{-10,10}}), iconTransformation(origin = {50,-100}, extent = {{-10,-10},{10,10}}, rotation = -90)));
equation
  connect(damper.flange_b,emf.flange) annotation(Line(points = {{25.2927,-23.7237},{25.2927,0},{9.45626,0},{9.45626,0}}));
  connect(emf.flange,inertia.flange_a) annotation(Line(points = {{10,0},{65.721,0},{65.721,-0.472813},{65.721,-0.472813}}));
  connect(speedsensor.w,speed) annotation(Line(points = {{64,25},{57.1429,25},{57.1429,24.8244},{57.1429,24.8244}}));
  connect(anglesensor.phi,angle) annotation(Line(points = {{64,50},{55.7377,50},{55.7377,50.1171},{55.7377,50.1171}}));
  connect(anglesensor.flange,flange_b) annotation(Line(points = {{85,50},{100.234,50},{100.234,-0.936768},{100.234,-0.936768}}));
  connect(speedsensor.flange,flange_b) annotation(Line(points = {{85,25},{100.234,25},{100.234,0.468384},{100.234,0.468384}}));
  connect(inertia.flange_b,flange_b) annotation(Line(points = {{85,0},{100.234,0},{100.234,0.468384},{100.234,0.468384}}));
  connect(fixed.flange,damper.flange_a) annotation(Line(points = {{24.356,-67.4473},{25.2927,-67.4473},{25.2927,-44.4965},{25.2927,-44.4965}}));
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
</p>

<h4>Implementation</h4>
<strong>IdealDCMotor</strong> is based upon the mathematical model of a
permanent magnet dc motor.
Using elements from
<a href=\"modelica://Modelica\">MSL</a>
the model was developed to represent the mathematical equations:<br>
<img src=\"modelica://Servomechanisms/Resources/Images/Electrical/dcmotorequation.png\" alt=\"dcmotorequation.png\" >

<h4>Notes</h4>
<ul>
<li>
The voltage should be applied on the electrical interfaces
<strong>pin_p</strong> and <strong>pin_n</strong> for example with and electrical
voltage source
<a href=\"modelica://Modelica.Electrical.Analog.Sources\">
Modelica.Electrical.Analog.Sources
</a>.
</li>
<li>This model is linear</li>
<li>All the parameters and variables are in SI units</li>
<li>Has angle and speed sensors as <strong>real outputs</strong> .</li>
</ul>

<h4>Examples</h4>
<p>
An example of usage with voltage source, inertial load, and
default parameters:
</p>
<img src=\"modelica://Servomechanisms/Resources/Images/Electrical/idealdcmotor1.png\" alt=\"idealdcmotor1.png\" style=\"height:60%;\">
<p>
Results:
</p>
<img src=\"modelica://Servomechanisms/Resources/Images/Electrical/idealdcmotor2.png\" alt=\"idealdcmotor2.png\" style=\"height:60%;\">

<h4>See also</h4>
<dd>
<a href=\"modelica://Servomechanisms.Electrical.SignalDCMotor\">Servomechanisms.Electrical.SignalDCMotor</a>
</dd>
<dd>
<a href=\"modelica://Servomechanisms.Electrical.DCMotor\">Servomechanisms.Electrical.DCMotor</a>
</dd>
</html>"), Icon(coordinateSystem(extent = {{-100,-100},{100,100}}, preserveAspectRatio = true, grid = {2,2}), graphics = {Rectangle(origin = {65.5738,0}, lineColor = {47,47,47}, fillColor = {255,255,255}, fillPattern = FillPattern.HorizontalCylinder, extent = {{-35.5972,9.83607},{35.5972,-9.83607}}),Text(origin = {-36.2191,-68.5512}, lineColor = {255,255,255}, extent = {{-30,10},{30,-10}}, textString = "Phi", fontSize = 30),Text(origin = {52.6855,-65.8657}, extent = {{-30,10},{30,-10}}, textString = "w", fontSize = 30)}));
end IdealDCMotor;

