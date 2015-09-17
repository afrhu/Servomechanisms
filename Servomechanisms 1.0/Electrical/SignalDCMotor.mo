within Servomechanisms.Electrical;
class SignalDCMotor "Signal DC Motor"
  //Icon
  extends Servomechanisms.Utilities.IconName;
  extends Modelica.Icons.MotorIcon;
  //Parameters
  parameter SI.Resistance R = 0.128 "Armature Resistance";
  parameter SI.Inductance L = 0.000062 "Armature Inductance";
  parameter SI.ElectricalTorqueConstant kt = 0.0305 "Torque Constant";
  parameter SI.Inertia J = 0.000121 "Rotor Inertia";
  parameter SI.RotationalDampingConstant b = 0 "Damping Factor";
  //Components
  Modelica.Electrical.Analog.Sources.SignalVoltage signalVoltage annotation(Placement(transformation(origin = {-75,0}, extent = {{-10,10},{10,-10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Resistor resistor(R = R) annotation(Placement(transformation(origin = {-50,25}, extent = {{-10,-10},{10,10}})));
  Modelica.Electrical.Analog.Basic.Inductor inductor(L = L) annotation(Placement(transformation(origin = {0,25}, extent = {{-10,-10},{10,10}})));
  Modelica.Electrical.Analog.Basic.Ground ground annotation(Placement(transformation(origin = {-25,-25}, extent = {{-10,-10},{10,10}})));
  Modelica.Electrical.Analog.Basic.EMF emf(k = kt) annotation(Placement(transformation(origin = {25,0}, extent = {{-10,-10},{10,10}})));
  Modelica.Mechanics.Rotational.Components.Inertia inertia(J = J) annotation(Placement(transformation(origin = {75,0}, extent = {{-10,-10},{10,10}})));
  Modelica.Mechanics.Rotational.Components.Damper damper(d = b) annotation(Placement(transformation(origin = {50,-25}, extent = {{-10,-10},{10,10}}, rotation = -90)));
  Modelica.Mechanics.Rotational.Components.Fixed fixed annotation(Placement(transformation(origin = {50,-50}, extent = {{-10,-10},{10,10}})));
  //Sensors
  Modelica.Mechanics.Rotational.Sensors.AngleSensor anglesensor annotation(Placement(transformation(origin = {75,50}, extent = {{10,-10},{-10,10}})));
  Modelica.Mechanics.Rotational.Sensors.SpeedSensor speedsensor annotation(Placement(transformation(origin = {75,25}, extent = {{10,-10},{-10,10}})));
  //Interfaces
  Modelica.Mechanics.Rotational.Interfaces.Flange_b flange_b annotation(Placement(transformation(origin = {100,0}, extent = {{-10,-10},{10,10}}), iconTransformation(origin = {100,0}, extent = {{-10,-10},{10,10}})));
  Modelica.Blocks.Interfaces.RealInput u annotation(Placement(transformation(origin = {-100,0}, extent = {{-10,-10},{10,10}}), iconTransformation(origin = {-100,0}, extent = {{-10,-10},{10,10}})));
  Modelica.Blocks.Interfaces.RealOutput angle annotation(Placement(transformation(origin = {50,50}, extent = {{10,-10},{-10,10}}), iconTransformation(origin = {-50,-100}, extent = {{-10,-10},{10,10}}, rotation = -90)));
  Modelica.Blocks.Interfaces.RealOutput speed annotation(Placement(transformation(origin = {49.6113,24.6113}, extent = {{10.3887,-10.3887},{-10.3887,10.3887}}), iconTransformation(origin = {50,-100}, extent = {{-10,-10},{10,10}}, rotation = -90)));
equation
  connect(damper.flange_a,emf.flange) annotation(Line(points = {{50,-15},{50,0},{35.3357,0},{35.3357,0}}));
  connect(emf.flange,inertia.flange_a) annotation(Line(points = {{35,0},{65.0177,0},{65.0177,-0.353357},{65.0177,-0.353357}}));
  connect(speedsensor.w,speed) annotation(Line(points = {{64,25},{57.2438,25},{49.6113,24.735},{49.6113,24.6113}}));
  connect(anglesensor.phi,angle) annotation(Line(points = {{64,50},{56.8905,50},{56.8905,49.1166},{56.8905,49.1166}}));
  connect(anglesensor.flange,flange_b) annotation(Line(points = {{85,50},{100,50},{100,-0.706714},{100,-0.706714}}));
  connect(speedsensor.flange,flange_b) annotation(Line(points = {{85,25},{100,25},{100,0},{100,0}}));
  connect(damper.flange_b,fixed.flange) annotation(Line(points = {{50,-35},{50,-49.1166},{50.1767,-49.1166},{50.1767,-49.1166}}));
  connect(inertia.flange_b,flange_b) annotation(Line(points = {{85,0},{100.353,0},{100.353,-0.706714},{100.353,-0.706714}}));
  connect(u,signalVoltage.v) annotation(Line(points = {{-100,0},{-83.0389,0},{-83.0389,0.706714},{-83.0389,0.706714}}));
  connect(ground.p,signalVoltage.n) annotation(Line(points = {{-25,-15},{-74.9117,-15},{-74.9117,-10.6007},{-74.9117,-10.6007}}));
  connect(ground.p,emf.n) annotation(Line(points = {{-25,-15},{25.0883,-15},{25.0883,-10.2473},{25.0883,-10.2473}}));
  connect(inductor.n,emf.p) annotation(Line(points = {{10,25},{25.4417,25},{25.4417,10.2473},{25.4417,10.2473}}));
  connect(resistor.n,inductor.p) annotation(Line(points = {{-40,25},{-9.54064,25},{-9.54064,24.735},{-9.54064,24.735}}));
  connect(signalVoltage.p,resistor.p) annotation(Line(points = {{-75,10},{-75,25.0883},{-60.0707,25.0883},{-60.0707,25.0883}}));
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
<strong>SignalDCMotor</strong> is based upon the mathematical model of a
permanent magnet dc motor.
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

<h4>Example</h4>
<p>
An example of usage with step input, inertial load and default parameters:
</p>
<img src=\"modelica://Servomechanisms/Resources/Images/Electrical/signaldcmotor1.png\" alt=\"signaldcmotor1.png\" style=\"height:40%;\">
<p>
Results:
</p>
<img src=\"modelica://Servomechanisms/Resources/Images/Electrical/signaldcmotor2.png\" alt=\"signaldcmotor2.png\" style=\"height:60%;\">

<h4>See also</h4>
<dd>
<a href=\"modelica://Servomechanisms.Electrical.IdealDCMotor\">Servomechanisms.Electrical.IdealDCMotor</a>
</dd>
<dd>
<a href=\"modelica://Servomechanisms.Electrical.DCMotor\">Servomechanisms.Electrical.DCMotor</a>
</dd>
</html>"), Icon(coordinateSystem(extent = {{-100,-100},{100,100}}, preserveAspectRatio = true, grid = {2,2}), graphics = {Text(origin = {-44.3283,-67.3702}, lineColor = {255,255,255}, extent = {{-30,10},{30,-10}}, textString = "Phi", fontSize = 30),Text(origin = {50.58,-64.66}, extent = {{-30,10},{30,-10}}, textString = "w", fontSize = 30)}));
end SignalDCMotor;

