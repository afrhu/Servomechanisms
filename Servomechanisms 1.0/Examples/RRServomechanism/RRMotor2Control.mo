within Servomechanisms.Examples.RRServomechanism;
model RRMotor2Control
  extends Modelica.Icons.Example;
  extends Servomechanisms.Examples.RRServomechanism.Data;
  Servomechanisms.Electrical.SignalDCMotor signaldcmotor2(R = R, L = L, kt = k, J = J) annotation(Placement(transformation(origin = {-12.7499,54.2523}, extent = {{-10,-10},{10,10}})));
  Modelica.Mechanics.Rotational.Components.IdealGear idealgear2(ratio = ratio2) annotation(Placement(transformation(origin = {24.7059,54.2523}, extent = {{-10,-10},{10,10}})));
  Modelica.Blocks.Sources.Step step1(height = 1) annotation(Placement(transformation(origin = {-79.3931,45.2064}, extent = {{-10,-10},{10,10}})));
  Modelica.Blocks.Continuous.LimPID limpid1(yMax = Voltage, controllerType = .Modelica.Blocks.Types.SimpleController.PI, k = 4.423, Ti = 0.1) annotation(Placement(transformation(origin = {-44.9727,44.3899}, extent = {{-10,-10},{10,10}})));
  Modelica.Mechanics.Rotational.Sources.Position position1(exact = true) annotation(Placement(transformation(origin = {23.8828,-2.5101}, extent = {{-10,-10},{10,10}})));
  Modelica.Mechanics.Rotational.Sensors.AngleSensor anglesensor1 annotation(Placement(transformation(origin = {-5.65371,23.3216}, extent = {{10,-10},{-10,10}})));
  Modelica.Blocks.Sources.Step step2(height = 0) annotation(Placement(transformation(origin = {-13.7394,-2.59986}, extent = {{-10,-10},{10,10}})));
  Servomechanisms.Mechanism.RR rr1(boxLength1 = l1, boxWidth1 = w1, boxHeight1 = h1, density1 = d1, boxLength2 = l1, boxWidth2 = w2, boxHeight2 = h2, density2 = d2) annotation(Placement(transformation(origin = {74.7381,34.3199}, extent = {{-18.5481,-18.5481},{18.5481,18.5481}})));
equation
  connect(idealgear2.flange_b,rr1.flange_rotational2) annotation(Line(points = {{34.7059,54.2523},{70.318,54.2523},{70.318,46.2898},{70.318,46.2898}}));
  connect(position1.flange,rr1.flange_rotational1) annotation(Line(points = {{33.8828,-2.5101},{56.8905,-2.5101},{56.8905,32.1555},{56.8905,32.1555}}));
  connect(step2.y,position1.phi_ref) annotation(Line(points = {{-2.7394,-2.59986},{10.2473,-2.59986},{10.2473,-1.41343},{10.2473,-1.41343}}));
  connect(anglesensor1.flange,idealgear2.flange_b) annotation(Line(points = {{4.34629,23.3216},{35.2941,23.3216},{35.2941,54.1176},{35.2941,54.1176}}));
  connect(anglesensor1.phi,limpid1.u_m) annotation(Line(points = {{-16.6537,23.3216},{-45.2297,23.3216},{-45.2297,31.4488},{-45.2297,31.4488}}));
  connect(limpid1.y,signaldcmotor2.u) annotation(Line(points = {{-33.9727,44.3899},{-29.682,44.3899},{-29.682,54.417},{-24.3816,54.417},{-24.3816,54.417}}));
  connect(step1.y,limpid1.u_s) annotation(Line(points = {{-68.3931,45.2064},{-58.6572,45.2064},{-58.6572,43.8163},{-58.6572,43.8163}}));
  connect(signaldcmotor2.flange_b,idealgear2.flange_a) annotation(Line(points = {{-2.74992,54.2523},{14.2465,54.2523},{14.2465,54.8643},{14.2466,54.3937}}));
  annotation( experiment(StartTime = 0, StopTime = 1, Tolerance = 0.000001));
  annotation(Documentation(info = "<html>
<head>
<style type=\"text/css\">
h4      { border-radius:8%;background-color: #D8D8D8 ;}
</style>
</head>

<h4>General</h4>
<p>
With this example the position control of the motor can be verified.<br>
The weigth of the links when the centroid is outside the motor or transmition axis generates disturbances
that sometimes reduce the precision of the control loop.<br>
If those disturbances are relatively small the proportional control P can be used otherwise a PI or PID control is preferred.
</p>

<h4>Implementation</h4>
The effect of disturbances for proportional position control are.
<a href=\"modelica://Modelica\">MSL</a>
<img src=\"modelica://Servomechanisms/Resources/Images/Electrical/dcmotorequation.png\" alt=\"dcmotorequation.png\" >

</html>"));
end RRMotor2Control;

