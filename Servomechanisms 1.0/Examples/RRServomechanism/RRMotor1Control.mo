within Servomechanisms.Examples.RRServomechanism;
model RRMotor1Control
  extends Modelica.Icons.Example;
  extends Servomechanisms.Examples.RRServomechanism.Data;
  Servomechanisms.Electrical.SignalDCMotor signaldcmotor2(R = R, L = L, kt = k, J = J) annotation(Placement(transformation(origin = {-18.397,10.9582}, extent = {{-10,-10},{10,10}})));
  Modelica.Mechanics.Rotational.Components.IdealGear idealgear2(ratio = ratio1) annotation(Placement(transformation(origin = {19.0588,10.9582}, extent = {{-10,-10},{10,10}})));
  Modelica.Mechanics.Rotational.Sources.Position position1 annotation(Placement(transformation(origin = {9.88237,48.4706}, extent = {{-10,-10},{10,10}})));
  Modelica.Blocks.Sources.Step step2(height = 0) annotation(Placement(transformation(origin = {-21.6205,48.143}, extent = {{-10,-10},{10,10}})));
  Modelica.Blocks.Sources.Step step1(height = 1) annotation(Placement(transformation(origin = {-84.444,13.5548}, extent = {{-10,-10},{10,10}})));
  Modelica.Mechanics.Rotational.Sensors.AngleSensor anglesensor1 annotation(Placement(transformation(origin = {-13.1765,-23.5294}, extent = {{10,-10},{-10,10}})));
  Modelica.Blocks.Continuous.LimPID PID(k = 7.1543, yMax = Voltage, controllerType = .Modelica.Blocks.Types.SimpleController.P) annotation(Placement(transformation(origin = {-47.0392,16.4706}, extent = {{-10,-10},{10,10}})));
  Servomechanisms.Mechanism.RR rr1(boxLength1 = l1, boxWidth1 = w1, boxHeight1 = h1, density1 = d1, boxLength2 = l2, boxWidth2 = w2, boxHeight2 = h2, density2 = d2) annotation(Placement(transformation(origin = {74.3705,18.168}, extent = {{-19.2543,-19.2543},{19.2543,19.2543}})));
equation
  connect(position1.flange,rr1.flange_rotational2) annotation(Line(points = {{19.8824,48.4706},{70.318,48.4706},{70.318,29.682},{70.318,29.682}}));
  connect(idealgear2.flange_b,rr1.flange_rotational1) annotation(Line(points = {{29.0588,10.9582},{55.1237,10.9582},{55.1237,16.6078},{55.1237,16.6078}}));
  connect(anglesensor1.phi,PID.u_m) annotation(Line(points = {{-24.1765,-23.5294},{-45.9016,-23.5294},{-45.9016,4.21546},{-45.9016,4.21546}}));
  connect(PID.y,signaldcmotor2.u) annotation(Line(points = {{-36.0392,16.4706},{-28.2353,16.4706},{-28.2353,10.9582},{-28.397,10.9582}}));
  connect(step1.y,PID.u_s) annotation(Line(points = {{-73.444,13.5548},{-58.8235,13.5548},{-59.0392,13.1765},{-59.0392,16.4706}}));
  connect(anglesensor1.flange,idealgear2.flange_b) annotation(Line(points = {{-3.17647,-23.5294},{29.6471,-23.5294},{29.6471,10.3529},{29.6471,10.3529}}));
  connect(step2.y,position1.phi_ref) annotation(Line(points = {{-10.6205,48.143},{-2.82353,49.0842},{-3.29412,48},{-3.29415,48}}));
  connect(signaldcmotor2.flange_b,idealgear2.flange_a) annotation(Line(points = {{-8.39698,10.9582},{8.59946,11.4288},{8.59946,11.0996},{8.59949,11.0996}}));
  annotation( experiment(StartTime = 0, StopTime = 2, Tolerance = 0.000001));
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

</html>"));
end RRMotor1Control;

