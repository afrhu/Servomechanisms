within Servomechanisms.Examples.RRServomechanism;
model RRPositionControl
  extends Modelica.Icons.Example;
  extends Servomechanisms.Examples.RRServomechanism.Data;
  Modelica.Mechanics.Rotational.Sensors.AngleSensor anglesensor2 annotation(Placement(visible = true, transformation(origin = {27.7739,7.27907}, extent = {{10,-10},{-10,10}}, rotation = 0)));
  Modelica.Blocks.Continuous.LimPID PID(controllerType = .Modelica.Blocks.Types.SimpleController.P, k = kp1, yMax = Voltage) annotation(Placement(visible = true, transformation(origin = {-9.54063,37.4558}, extent = {{-10,-10},{10,10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.IdealGear idealgear2(ratio = ratio2) annotation(Placement(visible = true, transformation(origin = {60.7774,38.5159}, extent = {{-10,-10},{10,10}}, rotation = 0)));
  Servomechanisms.Electrical.SignalDCMotor signaldcmotor2(R = R, L = L, kt = k, J = J) annotation(Placement(visible = true, transformation(origin = {27.193,38.9232}, extent = {{-10,-10},{10,10}}, rotation = 0)));
  Modelica.Blocks.Continuous.LimPID limpid1(controllerType = .Modelica.Blocks.Types.SimpleController.P, k = kp2, yMax = Voltage) annotation(Placement(visible = true, transformation(origin = {-6.85512,-40.0707}, extent = {{-10,-10},{10,10}}, rotation = 0)));
  Servomechanisms.Electrical.SignalDCMotor signaldcmotor1(R = R, L = L, kt = k, J = J) annotation(Placement(visible = true, transformation(origin = {28.4651,-39.31}, extent = {{-10,-10},{10,10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.IdealGear idealgear1(ratio = ratio1) annotation(Placement(visible = true, transformation(origin = {62.0495,-40.0707}, extent = {{-10,-10},{10,10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sensors.AngleSensor anglesensor1 annotation(Placement(visible = true, transformation(origin = {29.7527,-74.4877}, extent = {{10,-10},{-10,10}}, rotation = 0)));
  Servomechanisms.Control.RRInverseKinematics rrinversekinematics1(l1 = l1, l2 = l2) annotation(Placement(visible = true, transformation(origin = {-50.2487,-8.48059}, extent = {{-10,-10},{10,10}}, rotation = 0)));
  Servomechanisms.Control.CircleTrayectory circletrayectory1(r = r, xc = xc, yc = yc, period = period, startTime = 1) annotation(Placement(visible = true, transformation(origin = {-83.1533,-8.12721}, extent = {{-10,-10},{10,10}}, rotation = 0)));
  Servomechanisms.Mechanism.RR rr1(boxLength1 = l1, boxWidth1 = w1, boxHeight1 = h1, cylinderLength1 = l1, density1 = d1, boxLength2 = l2, boxWidth2 = w2, boxHeight2 = h2, density2 = d2, g = 9.81) annotation(Placement(visible = true, transformation(origin = {128.255,-14.6019}, extent = {{-27.2482,-27.2482},{27.2482,27.2482}}, rotation = 0)));
equation
  connect(idealgear2.flange_b,rr1.flange_rotational2) annotation(Line(points = {{70.7774,38.5159},{121.78,38.5159},{121.78,2.34192},{121.78,2.34192}}));
  connect(idealgear1.flange_b,rr1.flange_rotational1) annotation(Line(points = {{72.0495,-40.0707},{101.171,-40.0707},{101.171,-18.7354},{101.171,-18.7354}}));
  connect(circletrayectory1.y[1],rrinversekinematics1.u[1]) annotation(Line(points = {{-72.1533,-8.12721},{-62.7635,-8.12721},{-62.7635,-7.96253},{-62.7635,-7.96253}}));
  connect(circletrayectory1.y[2],rrinversekinematics1.u[2]) annotation(Line(points = {{-72.1533,-8.12721},{-63.2319,-8.12721},{-63.2319,-8.43091},{-63.2319,-8.43091}}));
  connect(PID.u_s,rrinversekinematics1.y[2]) annotation(Line(points = {{-21.5406,37.4558},{-38.8693,37.4558},{-38.8693,-9.18728},{-38.8693,-9.18728}}));
  connect(limpid1.u_s,rrinversekinematics1.y[1]) annotation(Line(points = {{-18.8551,-40.0707},{-38.8693,-40.0707},{-38.8693,-8.83392},{-38.8693,-8.83392}}));
  connect(anglesensor2.phi,PID.u_m) annotation(Line(points = {{16.7739,7.27907},{-10.2473,7.27907},{-10.2473,24.735},{-10.2473,24.735}}));
  connect(anglesensor2.flange,idealgear2.flange_b) annotation(Line(points = {{37.7739,7.27907},{70.6714,7.27907},{70.6714,37.4558},{70.6714,37.4558}}));
  connect(signaldcmotor2.flange_b,idealgear2.flange_a) annotation(Line(points = {{37.193,38.9232},{50.1767,38.9232},{50.1767,38.5159},{50.1767,38.5159}}));
  connect(PID.y,signaldcmotor2.u) annotation(Line(points = {{1.45937,37.4558},{16.6078,37.4558},{16.6078,39.2226},{16.6078,39.2226}}));
  connect(anglesensor1.phi,limpid1.u_m) annotation(Line(points = {{18.7527,-74.4877},{-6.36042,-74.4877},{-6.36042,-53.7102},{-6.36042,-53.7102}}));
  connect(anglesensor1.flange,idealgear1.flange_b) annotation(Line(points = {{39.7527,-74.4877},{72.4382,-74.4877},{72.4382,-40.2827},{72.4382,-40.2827}}));
  connect(signaldcmotor1.flange_b,idealgear1.flange_a) annotation(Line(points = {{38.4651,-39.31},{52.6502,-39.31},{52.6502,-39.9293},{52.6502,-39.9293}}));
  connect(limpid1.y,signaldcmotor1.u) annotation(Line(points = {{4.14488,-40.0707},{18.0212,-40.0707},{18.0212,-39.9293},{18.0212,-39.9293}}));
  annotation(Icon(coordinateSystem(extent = {{-100,-100},{100,100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2,2})), experiment(StartTime = 0, StopTime = 9, Tolerance = 0.000001), Diagram(coordinateSystem(extent = {{-100,-100},{150,100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2,2}), graphics = {Rectangle(origin = {29.3286,-59.5406}, lineColor = {85,85,127}, fillColor = {170,170,255}, pattern = LinePattern.Dash, fillPattern = FillPattern.Solid, lineThickness = 1, extent = {{-57.2438,39.3993},{55.1237,-24.9117}}),Rectangle(origin = {28.1272,23.0035}, lineColor = {85,85,127}, fillColor = {170,170,255}, pattern = LinePattern.Dash, fillPattern = FillPattern.Solid, lineThickness = 1, extent = {{-57.2438,39.3993},{55.1237,-24.9117}}),Rectangle(origin = {-40.9187,-29.0813}, lineColor = {255,170,0}, fillColor = {255,255,127}, pattern = LinePattern.Dash, fillPattern = FillPattern.Solid, lineThickness = 1, extent = {{-57.2438,39.3993},{6.71378,4.41696}})}));
  annotation(Documentation(info = "<html>
<head>
<style type=\"text/css\">
h4      { border-radius:8%;background-color: #D8D8D8 ;}
</style>
</head>

<h4>General</h4>
<p>
In this model the trayectory trackintg for RR servomechanisms is tested using PID block and signal DC motor.
</p>

<h4>Example</h4>
<p>Results:</p>
<img src=\"modelica://Servomechanisms/Resources/Images/Examples/rrpositioncontrol.png\" alt=\"rrpositioncontrol.png\" >
<img src=\"modelica://Servomechanisms/Resources/Images/Examples/rrpositioncontrolparametric.png\" alt=\"rrpositioncontrolparametric.png\" >


</html>"));
end RRPositionControl;

