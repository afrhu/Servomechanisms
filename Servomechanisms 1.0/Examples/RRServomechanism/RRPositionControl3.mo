within Servomechanisms.Examples.RRServomechanism;
model RRPositionControl3
  extends Modelica.Icons.Example;
  extends Servomechanisms.Examples.RRServomechanism.Data;
  Modelica.Mechanics.Rotational.Sensors.AngleSensor anglesensor2 annotation(Placement(transformation(origin = {27.7739,7.27907}, extent = {{10,-10},{-10,10}})));
  Modelica.Mechanics.Rotational.Components.IdealGear idealgear2(ratio = ratio2) annotation(Placement(transformation(origin = {60.7774,38.5159}, extent = {{-10,-10},{10,10}})));
  Modelica.Mechanics.Rotational.Components.IdealGear idealgear1(ratio = ratio1) annotation(Placement(transformation(origin = {62.0495,-40.0707}, extent = {{-10,-10},{10,10}})));
  Modelica.Mechanics.Rotational.Sensors.AngleSensor anglesensor1 annotation(Placement(transformation(origin = {29.7527,-74.4877}, extent = {{10,-10},{-10,10}})));
  Servomechanisms.Control.RRInverseKinematics rrinversekinematics1(l1 = l1, l2 = l2) annotation(Placement(transformation(origin = {-50.2487,-8.48059}, extent = {{-10,-10},{10,10}})));
  Servomechanisms.Control.CircleTrajectory circletrajectory1(r = r, xc = xc, yc = yc, period = period, startTime = 1) annotation(Placement(transformation(origin = {-83.1533,-8.12721}, extent = {{-10,-10},{10,10}})));
  Servomechanisms.Mechanism.RR rr1(boxLength1 = l1, boxWidth1 = w1, boxHeight1 = h1, cylinderLength1 = l1, density1 = d1, boxLength2 = l2, boxWidth2 = w2, boxHeight2 = h2, density2 = d2, g = 9.81) annotation(Placement(transformation(origin = {128.255,-14.6019}, extent = {{-27.2482,-27.2482},{27.2482,27.2482}})));
  Servomechanisms.Electrical.IdealDCMotor idealdcmotor1(R = R, L = L, kt = k, J = J) annotation(Placement(transformation(origin = {37.9747,-39.783}, extent = {{-10,-10},{10,10}})));
  Servomechanisms.Electrical.DCSource dcsource1(V = Voltage, R = 0.1) annotation(Placement(transformation(origin = {12.2061,-16.7269}, extent = {{-10,-10},{10,10}})));
  Servomechanisms.Electrical.DCSource dcsource2(V = Voltage, R = 0.1) annotation(Placement(transformation(origin = {11.8626,61.5913}, extent = {{-10,-10},{10,10}})));
  Servomechanisms.Control.Controller controller1(controllerType = .Modelica.Blocks.Types.SimpleController.P, k = kp1, yMax = Voltage) annotation(Placement(transformation(origin = {-11.3074,-40.2827}, extent = {{-10,-10},{10,10}})));
  Servomechanisms.Control.Controller controller2(controllerType = .Modelica.Blocks.Types.SimpleController.P, k = kp1, yMax = Voltage) annotation(Placement(transformation(origin = {-12.8622,38.0212}, extent = {{-10,-10},{10,10}})));
  Servomechanisms.Electrical.IdealDCMotor idealdcmotor2(R = R, L = L, kt = k, J = J) annotation(Placement(transformation(origin = {37.48,38.1675}, extent = {{-10,-10},{10,10}})));
  Servomechanisms.Electrical.HBridge hbridge1 annotation(Placement(transformation(origin = {13.0742,-39.9293}, extent = {{-10,-10},{10,10}})));
  Servomechanisms.Electrical.HBridge hbridge2 annotation(Placement(transformation(origin = {12.2261,38.0212}, extent = {{-10,-10},{10,10}})));
equation
  connect(dcsource2.pin_n,hbridge2.pin_n) annotation(Line(points = {{16.8626,51.5913},{15.1943,51.5913},{15.1943,47.3498},{15.1943,47.3498}}));
  connect(dcsource2.pin_p,hbridge2.pin_p) annotation(Line(points = {{6.8626,51.5913},{7.77385,51.5913},{7.77385,48.0565},{7.77385,48.0565}}));
  connect(hbridge1.pin_n,dcsource1.pin_n) annotation(Line(points = {{16.4466,-30.3274},{17.3145,-30.3274},{17.3145,-26.1484},{17.3145,-26.1484}}));
  connect(hbridge1.pin_p,dcsource1.pin_p) annotation(Line(points = {{8.203,-30.2806},{7.77385,-30.2806},{7.77385,-27.2085},{7.77385,-27.2085}}));
  connect(controller1.direction,hbridge1.DIR) annotation(Line(points = {{-1.3074,-45.2827},{2.82686,-45.2827},{2.82686,-43.8163},{2.82686,-43.8163}}));
  connect(controller1.pwm,hbridge1.PWM) annotation(Line(points = {{-1.3074,-35.2827},{2.4735,-35.2827},{2.4735,-33.9223},{2.4735,-33.9223}}));
  connect(controller2.direction,hbridge2.DIR) annotation(Line(points = {{-2.8622,33.0212},{2.12014,33.0212},{2.12014,33.5689},{2.12014,33.5689}}));
  connect(controller2.pwm,hbridge2.PWM) annotation(Line(points = {{-2.8622,43.0212},{2.12014,43.0212},{2.12014,42.7562},{2.12014,42.7562}}));
  connect(hbridge2.MotorB,idealdcmotor2.pin_n) annotation(Line(points = {{22.109,33.6652},{28.103,33.6652},{28.103,33.2553},{28.103,33.2553}}));
  connect(hbridge2.MotorA,idealdcmotor2.pin_p) annotation(Line(points = {{22.109,42.5645},{28.103,42.5645},{28.103,43.5597},{28.103,43.5597}}));
  connect(idealdcmotor2.flange_b,idealgear2.flange_a) annotation(Line(points = {{47.48,38.1675},{50.1767,38.1675},{50.1767,37.8092},{50.1767,37.8092}}));
  connect(idealdcmotor1.flange_b,idealgear1.flange_a) annotation(Line(points = {{47.9747,-39.783},{52.2968,-39.783},{52.2968,-40.2827},{52.2968,-40.2827}}));
  connect(controller2.reference,rrinversekinematics1.y[2]) annotation(Line(points = {{-22.8622,38.0212},{-38.8693,38.0212},{-38.8693,-8.48057},{-38.8693,-8.48057}}));
  connect(controller1.reference,rrinversekinematics1.y[1]) annotation(Line(points = {{-21.3074,-40.2827},{-39.2226,-40.2827},{-39.2226,-8.48057},{-39.2226,-8.48057}}));
  connect(anglesensor2.phi,controller2.feedback) annotation(Line(points = {{16.7739,7.27907},{-13.0742,7.27907},{-13.0742,28.2686},{-13.0742,28.2686}}));
  connect(anglesensor1.phi,controller1.feedback) annotation(Line(points = {{18.7527,-74.4877},{-11.7096,-74.4877},{-11.7096,-50.1171},{-11.7096,-50.1171}}));
  connect(idealgear2.flange_b,rr1.flange_rotational2) annotation(Line(points = {{70.7774,38.5159},{121.78,38.5159},{121.78,2.34192},{121.78,2.34192}}));
  connect(idealgear1.flange_b,rr1.flange_rotational1) annotation(Line(points = {{72.0495,-40.0707},{101.171,-40.0707},{101.171,-18.7354},{101.171,-18.7354}}));
  connect(circletrajectory1.y[1],rrinversekinematics1.u[1]) annotation(Line(points = {{-72.1533,-8.12721},{-62.7635,-8.12721},{-62.7635,-7.96253},{-62.7635,-7.96253}}));
  connect(circletrajectory1.y[2],rrinversekinematics1.u[2]) annotation(Line(points = {{-72.1533,-8.12721},{-63.2319,-8.12721},{-63.2319,-8.43091},{-63.2319,-8.43091}}));
  connect(anglesensor2.flange,idealgear2.flange_b) annotation(Line(points = {{37.7739,7.27907},{70.6714,7.27907},{70.6714,37.4558},{70.6714,37.4558}}));
  connect(anglesensor1.flange,idealgear1.flange_b) annotation(Line(points = {{39.7527,-74.4877},{72.4382,-74.4877},{72.4382,-40.2827},{72.4382,-40.2827}}));
  annotation( experiment(StartTime = 0, StopTime = 9, Tolerance = 0.000001), Diagram(coordinateSystem(extent = {{-100,-100},{150,100}}, preserveAspectRatio = true, grid = {2,2}), graphics = {Rectangle(origin = {29.3286,-59.5406}, lineColor = {85,85,127}, fillColor = {170,170,255}, pattern = LinePattern.Dash, fillPattern = FillPattern.Solid, lineThickness = 1, extent = {{-57.2438,39.3993},{55.1237,-24.9117}}),Rectangle(origin = {28.1272,23.0035}, lineColor = {85,85,127}, fillColor = {170,170,255}, pattern = LinePattern.Dash, fillPattern = FillPattern.Solid, lineThickness = 1, extent = {{-57.2438,39.3993},{55.1237,-24.9117}}),Rectangle(origin = {-40.9187,-29.0813}, lineColor = {255,170,0}, fillColor = {255,255,127}, pattern = LinePattern.Dash, fillPattern = FillPattern.Solid, lineThickness = 1, extent = {{-57.2438,39.3993},{6.71378,4.41696}})}));
  annotation(Documentation(info = "<html>
<head>
<style type=\"text/css\">
h4      { border-radius:8%;background-color: #D8D8D8 ;}
</style>
</head>

<h4>General</h4>
<p>
In this model the trajectory trackintg for RR servomechanisms is tested using a real H bridge.
</p>

<h4>Limitations</h4>
The simulations takes a lot of time to complete.

</html>"));
end RRPositionControl3;

