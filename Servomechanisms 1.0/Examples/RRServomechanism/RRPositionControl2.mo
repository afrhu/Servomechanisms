within Servomechanisms.Examples.RRServomechanism;
model RRPositionControl2
  extends Modelica.Icons.Example;
  extends Servomechanisms.Examples.RRServomechanism.Data;
  Servomechanisms.Control.RRInverseKinematics rrinversekinematics1(l1 = l1, l2 = l2) annotation(Placement(visible = true, transformation(origin = {-50.2487,-8.48059}, extent = {{-10,-10},{10,10}}, rotation = 0)));
  Servomechanisms.Control.CircleTrayectory circletrayectory1(r = r, xc = xc, yc = yc, period = period, startTime = 1) annotation(Placement(visible = true, transformation(origin = {-83.1533,-8.12721}, extent = {{-10,-10},{10,10}}, rotation = 0)));
  Servomechanisms.Mechanism.RR rr1(boxLength1 = l1, boxWidth1 = w1, boxHeight1 = h1, cylinderLength1 = l1, density1 = d1, boxLength2 = l2, boxWidth2 = w2, boxHeight2 = h2, density2 = d2, g = 9.81) annotation(Placement(visible = true, transformation(origin = {128.255,-14.6019}, extent = {{-27.2482,-27.2482},{27.2482,27.2482}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.IdealGear idealgear1(ratio = ratio1) annotation(Placement(visible = true, transformation(origin = {62.7781,-51.7283}, extent = {{-10,-10},{10,10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sensors.AngleSensor anglesensor1 annotation(Placement(visible = true, transformation(origin = {30.4813,-86.1453}, extent = {{10,-10},{-10,10}}, rotation = 0)));
  Servomechanisms.Electrical.IdealDCMotor idealdcmotor1(R = R, L = L, kt = k, J = J) annotation(Placement(visible = true, transformation(origin = {38.7033,-51.4406}, extent = {{-10,-10},{10,10}}, rotation = 0)));
  Servomechanisms.Electrical.IdealHBridge idealhbridge2 annotation(Placement(visible = true, transformation(origin = {13.0432,-51.7842}, extent = {{-10,-10},{10,10}}, rotation = 0)));
  Servomechanisms.Electrical.DCSource dcsource1(V = Voltage, R = 0) annotation(Placement(visible = true, transformation(origin = {12.9347,-28.3845}, extent = {{-10,-10},{10,10}}, rotation = 0)));
  Servomechanisms.Control.Controller controller1(controllerType = .Modelica.Blocks.Types.SimpleController.P, k = kp1, yMax = Voltage) annotation(Placement(visible = true, transformation(origin = {-10.5788,-51.9403}, extent = {{-10,-10},{10,10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sensors.AngleSensor anglesensor2 annotation(Placement(visible = true, transformation(origin = {30.324,-1.0998}, extent = {{10,-10},{-10,10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.IdealGear idealgear2(ratio = ratio2) annotation(Placement(visible = true, transformation(origin = {63.3275,30.137}, extent = {{-10,-10},{10,10}}, rotation = 0)));
  Servomechanisms.Electrical.IdealHBridge idealhbridge1 annotation(Placement(visible = true, transformation(origin = {14.3042,29.5958}, extent = {{-10,-10},{10,10}}, rotation = 0)));
  Servomechanisms.Electrical.DCSource dcsource2(V = Voltage, R = 0) annotation(Placement(visible = true, transformation(origin = {14.4127,53.2124}, extent = {{-10,-10},{10,10}}, rotation = 0)));
  Servomechanisms.Control.Controller controller2(controllerType = .Modelica.Blocks.Types.SimpleController.P, k = kp1, yMax = Voltage) annotation(Placement(visible = true, transformation(origin = {-10.3121,29.6423}, extent = {{-10,-10},{10,10}}, rotation = 0)));
  Servomechanisms.Electrical.IdealDCMotor idealdcmotor2(R = R, L = L, kt = k, J = J) annotation(Placement(visible = true, transformation(origin = {40.0301,29.7886}, extent = {{-10,-10},{10,10}}, rotation = 0)));
equation
  connect(idealhbridge1.MotorA,idealdcmotor2.pin_p) annotation(Line(points = {{24.3042,34.5958},{29.7476,34.5958},{30.1119,34.7306},{30.1119,34.7306}}));
  connect(idealhbridge1.MotorB,idealdcmotor2.pin_n) annotation(Line(points = {{24.3042,24.5958},{30.1119,24.5958},{30.1119,25.19},{30.1119,25.19}}));
  connect(idealdcmotor2.flange_b,idealgear2.flange_a) annotation(Line(points = {{50.0301,29.7886},{52.7268,29.7886},{52.3625,29.4303},{52.7268,29.4303}}));
  connect(anglesensor2.phi,controller2.feedback) annotation(Line(points = {{19.324,-1.0998},{-10.5241,-1.0998},{-10.8884,19.8897},{-10.5241,19.8897}}));
  connect(controller2.reference,rrinversekinematics1.y[2]) annotation(Line(points = {{-20.3121,29.6423},{-38.8693,29.6423},{-38.8693,-8.48057},{-38.8693,-8.48057}}));
  connect(controller2.pwm,idealhbridge1.PWM) annotation(Line(points = {{-0.312109,34.6423},{3.95257,34.6423},{4.31687,34.7306},{4.31686,34.7306}}));
  connect(controller2.direction,idealhbridge1.ENABLE) annotation(Line(points = {{-0.312109,24.6423},{3.59922,24.6423},{3.59922,24.1299},{3.96351,24.1299}}));
  connect(dcsource2.pin_p,idealhbridge1.Vpos) annotation(Line(points = {{9.41269,43.2124},{9.61723,43.2124},{9.61723,40.031},{9.61726,40.031}}));
  connect(dcsource2.pin_n,idealhbridge1.Vneg) annotation(Line(points = {{19.4127,43.2124},{19.8646,43.2124},{19.8646,38.9709},{19.8646,38.9709}}));
  connect(anglesensor2.flange,idealgear2.flange_b) annotation(Line(points = {{40.324,-1.0998},{73.2215,-1.0998},{72.8572,29.0769},{73.2215,29.0769}}));
  connect(idealgear2.flange_b,rr1.flange_rotational2) annotation(Line(points = {{73.3275,30.137},{121.78,30.137},{121.78,2.34192},{121.78,2.34192}}));
  connect(anglesensor1.phi,controller1.feedback) annotation(Line(points = {{19.4813,-86.1453},{-10.6167,-86.1453},{-10.6167,-61.7747},{-10.981,-61.7747}}));
  connect(controller1.reference,rrinversekinematics1.y[1]) annotation(Line(points = {{-20.5788,-51.9403},{-39.2226,-51.9403},{-39.2226,-8.48057},{-39.2226,-8.48057}}));
  connect(controller1.pwm,idealhbridge2.PWM) annotation(Line(points = {{-0.578802,-46.9403},{3.55546,-46.9403},{3.55546,-46.9933},{3.55548,-46.9933}}));
  connect(controller1.direction,idealhbridge2.ENABLE) annotation(Line(points = {{-0.578802,-56.9403},{2.84874,-56.9403},{2.84874,-57.2406},{2.84876,-57.2406}}));
  connect(idealhbridge2.Vpos,dcsource1.pin_p) annotation(Line(points = {{8.0432,-41.7842},{8.86675,-41.7842},{8.50245,-38.5127},{8.5024,-38.5127}}));
  connect(idealhbridge2.Vneg,dcsource1.pin_n) annotation(Line(points = {{18.0432,-41.7842},{18.4074,-41.7842},{18.4074,-38.1594},{18.0431,-38.1594}}));
  connect(idealhbridge2.MotorB,idealdcmotor1.pin_n) annotation(Line(points = {{23.0432,-56.7842},{28.6438,-56.7842},{29.0081,-56.5339},{28.6438,-56.5339}}));
  connect(idealhbridge2.MotorA,idealdcmotor1.pin_p) annotation(Line(points = {{23.0432,-46.7842},{29.3615,-46.7842},{28.9972,-46.6399},{28.9972,-46.6399}}));
  connect(idealdcmotor1.flange_b,idealgear1.flange_a) annotation(Line(points = {{48.7033,-51.4406},{53.0254,-51.4406},{53.0254,-51.9403},{53.0254,-51.9403}}));
  connect(anglesensor1.flange,idealgear1.flange_b) annotation(Line(points = {{40.4813,-86.1453},{73.5311,-86.1453},{73.5311,-51.9403},{73.1668,-51.9403}}));
  connect(idealgear1.flange_b,rr1.flange_rotational1) annotation(Line(points = {{72.7781,-51.7283},{101.171,-51.7283},{101.171,-18.7354},{101.171,-18.7354}}));
  connect(circletrayectory1.y[1],rrinversekinematics1.u[1]) annotation(Line(points = {{-72.1533,-8.12721},{-62.7635,-8.12721},{-62.7635,-7.96253},{-62.7635,-7.96253}}));
  connect(circletrayectory1.y[2],rrinversekinematics1.u[2]) annotation(Line(points = {{-72.1533,-8.12721},{-63.2319,-8.12721},{-63.2319,-8.43091},{-63.2319,-8.43091}}));
  annotation(Icon(coordinateSystem(extent = {{-100,-100},{100,100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2,2})), experiment(StartTime = 0, StopTime = 9, Tolerance = 0.000001), Documentation(info = "<html>
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

</html>"), Diagram(coordinateSystem(extent = {{-100,-100},{150,100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2,2}), graphics = {Rectangle(origin = {30.0572,-71.1982}, lineColor = {85,85,127}, fillColor = {170,170,255}, pattern = LinePattern.Dash, fillPattern = FillPattern.Solid, lineThickness = 1, extent = {{-57.6081,57.6142},{55.1237,-24.9117}}),Rectangle(origin = {30.6773,14.6246}, lineColor = {85,85,127}, fillColor = {170,170,255}, pattern = LinePattern.Dash, fillPattern = FillPattern.Solid, lineThickness = 1, extent = {{-58.3367,53.6069},{55.1237,-24.9117}}),Rectangle(origin = {-40.9187,-29.0813}, lineColor = {255,170,0}, fillColor = {255,255,127}, pattern = LinePattern.Dash, fillPattern = FillPattern.Solid, lineThickness = 1, extent = {{-57.2438,39.3993},{6.71378,4.41696}})}));
end RRPositionControl2;

