within Servomechanisms.Examples.RRServomechanism;
model RRPositionControl2
  extends Modelica.Icons.Example;
  extends Servomechanisms.Examples.RRServomechanism.Data;
  Modelica.Mechanics.Rotational.Sensors.AngleSensor anglesensor2 annotation(Placement(visible = true, transformation(origin = {27.7739,7.27907}, extent = {{10,-10},{-10,10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.IdealGear idealgear2(ratio = ratio2) annotation(Placement(visible = true, transformation(origin = {60.7774,38.5159}, extent = {{-10,-10},{10,10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.IdealGear idealgear1(ratio = ratio1) annotation(Placement(visible = true, transformation(origin = {62.0495,-40.0707}, extent = {{-10,-10},{10,10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sensors.AngleSensor anglesensor1 annotation(Placement(visible = true, transformation(origin = {29.7527,-74.4877}, extent = {{10,-10},{-10,10}}, rotation = 0)));
  Servomechanisms.Control.RRInverseKinematics rrinversekinematics1(l1 = l1, l2 = l2) annotation(Placement(visible = true, transformation(origin = {-50.2487,-8.48059}, extent = {{-10,-10},{10,10}}, rotation = 0)));
  Servomechanisms.Control.CircleTrayectory circletrayectory1(r = r, xc = xc, yc = yc, period = period, startTime = 1) annotation(Placement(visible = true, transformation(origin = {-83.1533,-8.12721}, extent = {{-10,-10},{10,10}}, rotation = 0)));
  Servomechanisms.Mechanism.RR rr1(boxLength1 = l1, boxWidth1 = w1, boxHeight1 = h1, cylinderLength1 = l1, density1 = d1, boxLength2 = l2, boxWidth2 = w2, boxHeight2 = h2, density2 = d2, g = 9.81) annotation(Placement(visible = true, transformation(origin = {128.255,-14.6019}, extent = {{-27.2482,-27.2482},{27.2482,27.2482}}, rotation = 0)));
  Servomechanisms.Electrical.IdealDCMotor idealdcmotor1(R = R, L = L, kt = k, J = J) annotation(Placement(visible = true, transformation(origin = {37.9747,-39.783}, extent = {{-10,-10},{10,10}}, rotation = 0)));
  Servomechanisms.Electrical.IdealHBridge idealhbridge1 annotation(Placement(visible = true, transformation(origin = {11.7541,37.9747}, extent = {{-10,-10},{10,10}}, rotation = 0)));
  Servomechanisms.Electrical.IdealHBridge idealhbridge2 annotation(Placement(visible = true, transformation(origin = {12.3146,-40.1266}, extent = {{-10,-10},{10,10}}, rotation = 0)));
  Servomechanisms.Electrical.DCSource dcsource1(V = Voltage, R = 0) annotation(Placement(visible = true, transformation(origin = {12.2061,-16.7269}, extent = {{-10,-10},{10,10}}, rotation = 0)));
  Servomechanisms.Electrical.DCSource dcsource2(V = Voltage, R = 0) annotation(Placement(visible = true, transformation(origin = {11.8626,61.5913}, extent = {{-10,-10},{10,10}}, rotation = 0)));
  Servomechanisms.Control.Controller controller1(controllerType = .Modelica.Blocks.Types.SimpleController.P, k = kp1, yMax = Voltage) annotation(Placement(visible = true, transformation(origin = {-11.3074,-40.2827}, extent = {{-10,-10},{10,10}}, rotation = 0)));
  Servomechanisms.Control.Controller controller2(controllerType = .Modelica.Blocks.Types.SimpleController.P, k = kp1, yMax = Voltage) annotation(Placement(visible = true, transformation(origin = {-12.8622,38.0212}, extent = {{-10,-10},{10,10}}, rotation = 0)));
  Servomechanisms.Electrical.IdealDCMotor idealdcmotor2(R = R, L = L, kt = k, J = J) annotation(Placement(visible = true, transformation(origin = {37.48,38.1675}, extent = {{-10,-10},{10,10}}, rotation = 0)));
equation
  connect(idealdcmotor2.flange_b,idealgear2.flange_a) annotation(Line(points = {{47.48,38.1675},{50.1767,38.1675},{50.1767,37.8092},{50.1767,37.8092}}));
  connect(idealhbridge1.MotorB,idealdcmotor2.pin_n) annotation(Line(points = {{21.7541,32.9747},{27.5618,32.9747},{27.5618,33.5689},{27.5618,33.5689}}));
  connect(idealhbridge1.MotorA,idealdcmotor2.pin_p) annotation(Line(points = {{21.7541,42.9747},{27.5618,42.9747},{27.5618,43.1095},{27.5618,43.1095}}));
  connect(dcsource2.pin_n,idealhbridge1.Vneg) annotation(Line(points = {{16.8626,51.5913},{17.3145,51.5913},{17.3145,47.3498},{17.3145,47.3498}}));
  connect(dcsource2.pin_p,idealhbridge1.Vpos) annotation(Line(points = {{6.86257,51.5913},{7.06714,51.5913},{7.06714,48.4099},{7.06714,48.4099}}));
  connect(controller2.direction,idealhbridge1.ENABLE) annotation(Line(points = {{-2.86219,33.0212},{1.41343,33.0212},{1.41343,32.5088},{1.41343,32.5088}}));
  connect(controller2.pwm,idealhbridge1.PWM) annotation(Line(points = {{-2.86219,43.0212},{1.76678,43.0212},{1.76678,43.1095},{1.76678,43.1095}}));
  connect(controller1.direction,idealhbridge2.ENABLE) annotation(Line(points = {{-1.30742,-45.2827},{2.12014,-45.2827},{2.12014,-45.583},{2.12014,-45.583}}));
  connect(controller1.pwm,idealhbridge2.PWM) annotation(Line(points = {{-1.30742,-35.2827},{2.82686,-35.2827},{2.82686,-35.3357},{2.82686,-35.3357}}));
  connect(idealhbridge2.Vneg,dcsource1.pin_n) annotation(Line(points = {{17.3146,-30.1266},{17.3145,-30.1266},{17.3145,-26.5018},{17.3145,-26.5018}}));
  connect(idealhbridge2.Vpos,dcsource1.pin_p) annotation(Line(points = {{7.31465,-30.1266},{7.77385,-30.1266},{7.77385,-26.8551},{7.77385,-26.8551}}));
  connect(idealhbridge2.MotorA,idealdcmotor1.pin_p) annotation(Line(points = {{22.3146,-35.1266},{28.2686,-35.1266},{28.2686,-34.9823},{28.2686,-34.9823}}));
  connect(idealhbridge2.MotorB,idealdcmotor1.pin_n) annotation(Line(points = {{22.3146,-45.1266},{27.9152,-45.1266},{27.9152,-44.8763},{27.9152,-44.8763}}));
  connect(idealdcmotor1.flange_b,idealgear1.flange_a) annotation(Line(points = {{47.9747,-39.783},{52.2968,-39.783},{52.2968,-40.2827},{52.2968,-40.2827}}));
  connect(controller2.reference,rrinversekinematics1.y[2]) annotation(Line(points = {{-22.8622,38.0212},{-38.8693,38.0212},{-38.8693,-8.48057},{-38.8693,-8.48057}}));
  connect(controller1.reference,rrinversekinematics1.y[1]) annotation(Line(points = {{-21.3074,-40.2827},{-39.2226,-40.2827},{-39.2226,-8.48057},{-39.2226,-8.48057}}));
  connect(anglesensor2.phi,controller2.feedback) annotation(Line(points = {{16.7739,7.27907},{-13.0742,7.27907},{-13.0742,28.2686},{-13.0742,28.2686}}));
  connect(anglesensor1.phi,controller1.feedback) annotation(Line(points = {{18.7527,-74.4877},{-11.7096,-74.4877},{-11.7096,-50.1171},{-11.7096,-50.1171}}));
  connect(idealgear2.flange_b,rr1.flange_rotational2) annotation(Line(points = {{70.7774,38.5159},{121.78,38.5159},{121.78,2.34192},{121.78,2.34192}}));
  connect(idealgear1.flange_b,rr1.flange_rotational1) annotation(Line(points = {{72.0495,-40.0707},{101.171,-40.0707},{101.171,-18.7354},{101.171,-18.7354}}));
  connect(circletrayectory1.y[1],rrinversekinematics1.u[1]) annotation(Line(points = {{-72.1533,-8.12721},{-62.7635,-8.12721},{-62.7635,-7.96253},{-62.7635,-7.96253}}));
  connect(circletrayectory1.y[2],rrinversekinematics1.u[2]) annotation(Line(points = {{-72.1533,-8.12721},{-63.2319,-8.12721},{-63.2319,-8.43091},{-63.2319,-8.43091}}));
  connect(anglesensor2.flange,idealgear2.flange_b) annotation(Line(points = {{37.7739,7.27907},{70.6714,7.27907},{70.6714,37.4558},{70.6714,37.4558}}));
  connect(anglesensor1.flange,idealgear1.flange_b) annotation(Line(points = {{39.7527,-74.4877},{72.4382,-74.4877},{72.4382,-40.2827},{72.4382,-40.2827}}));
  annotation(Icon(coordinateSystem(extent = {{-100,-100},{100,100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2,2})), experiment(StartTime = 0, StopTime = 9, Tolerance = 0.000001), Diagram(coordinateSystem(extent = {{-100,-100},{150,100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2,2}), graphics = {Rectangle(origin = {29.3286,-59.5406}, lineColor = {85,85,127}, fillColor = {170,170,255}, pattern = LinePattern.Dash, fillPattern = FillPattern.Solid, lineThickness = 1, extent = {{-57.2438,39.3993},{55.1237,-24.9117}}),Rectangle(origin = {28.1272,23.0035}, lineColor = {85,85,127}, fillColor = {170,170,255}, pattern = LinePattern.Dash, fillPattern = FillPattern.Solid, lineThickness = 1, extent = {{-57.2438,39.3993},{55.1237,-24.9117}}),Rectangle(origin = {-40.9187,-29.0813}, lineColor = {255,170,0}, fillColor = {255,255,127}, pattern = LinePattern.Dash, fillPattern = FillPattern.Solid, lineThickness = 1, extent = {{-57.2438,39.3993},{6.71378,4.41696}})}));
  annotation(Documentation(info = "<html>
<head>
<style type=\"text/css\">
h4      { border-radius:8%;background-color: #D8D8D8 ;}
</style>
</head>

<h4>General</h4>
<p>
In this model the trayectory trackintg for RR servomechanisms is tested using Controller block, Ideal DC motor and an Ideal H bridge.
</p>


<h4>Example</h4>
<p>Results:</p>
<img src=\"modelica://Servomechanisms/Resources/Images/Examples/rrpositioncontrol2.png\" alt=\"rrpositioncontrol2.png\" >
<img src=\"modelica://Servomechanisms/Resources/Images/Examples/rrpositioncontrol2parametric.png\" alt=\"rrpositioncontrol2parametric.png\" >


<h4>See also</h4>

</html>"));
end RRPositionControl2;

