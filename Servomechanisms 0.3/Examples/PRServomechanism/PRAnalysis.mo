within Servomechanisms.Examples.PRServomechanism;
model PRAnalysis
  extends Modelica.Icons.Example;
  extends Servomechanisms.Utilities.Visual3d;
  extends Servomechanisms.Examples.PRServomechanism.Data;
  Servomechanisms.Control.FlowerTrayectory flowertrayectory1(a = a, period = period, xc = xc, yc = yc, startTime = 1) annotation(Placement(visible = true, transformation(origin = {-84.9745,-8.06099}, extent = {{-10,-10},{10,10}}, rotation = 0)));
  Servomechanisms.Control.PRInverseKinematics prinversekinematics1(l1 = l1, l2 = l2) annotation(Placement(visible = true, transformation(origin = {-55.2445,-7.46932}, extent = {{-10,-10},{10,10}}, rotation = 0)));
  Servomechanisms.Mechanism.PR pr1(boxLength1 = l1, boxWidth1 = w1, boxHeight1 = h1, boxLength2 = l2, boxWidth2 = w2, boxHeight2 = h2, density1 = d1, density2 = d2, g = 0) annotation(Placement(visible = true, transformation(origin = {118.322,-7.82686}, extent = {{-25.4947,-25.4947},{25.4947,25.4947}}, rotation = 0)));
  Servomechanisms.Electrical.SignalDCMotor signaldcmotor2(R = R, L = L, kt = k, J = J) annotation(Placement(visible = true, transformation(origin = {26.665,38.9497}, extent = {{-10,-10},{10,10}}, rotation = 0)));
  Modelica.Blocks.Continuous.LimPID PID2(controllerType = .Modelica.Blocks.Types.SimpleController.P, k = kprot, yMax = Voltage) annotation(Placement(visible = true, transformation(origin = {-7.05874,38.4813}, extent = {{-10,-10},{10,10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.IdealGear idealgear2(ratio = ratio2) annotation(Placement(visible = true, transformation(origin = {60.6359,38.9669}, extent = {{-10,-10},{10,10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sensors.AngleSensor anglesensor1 annotation(Placement(visible = true, transformation(origin = {27.3227,7.24009}, extent = {{10,-10},{-10,10}}, rotation = 0)));
  Modelica.Blocks.Continuous.LimPID PID1(controllerType = .Modelica.Blocks.Types.SimpleController.P, k = kppris, yMax = Voltage, Ti = 20) annotation(Placement(visible = true, transformation(origin = {-4.52668,-50.3306}, extent = {{-10,-10},{10,10}}, rotation = 0)));
  Servomechanisms.Electrical.SignalDCMotor signaldcmotor1(R = R, L = L, kt = k, J = J) annotation(Placement(visible = true, transformation(origin = {26.4604,-49.6239}, extent = {{-10,-10},{10,10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.IdealGearR2T idealgearr2t1(ratio = ratio1) annotation(Placement(visible = true, transformation(origin = {58.7457,-50.0923}, extent = {{-10,-10},{10,10}}, rotation = 0)));
  Modelica.Mechanics.Translational.Sensors.PositionSensor positionsensor1 annotation(Placement(visible = true, transformation(origin = {25.7288,-82.7724}, extent = {{10,-10},{-10,10}}, rotation = 0)));
equation
  connect(positionsensor1.flange,idealgearr2t1.flangeT) annotation(Line(points = {{35.7288,-82.7724},{68.9046,-82.7724},{68.9046,-50.0923},{68.7457,-50.0923}}));
  connect(positionsensor1.s,PID1.u_m) annotation(Line(points = {{14.7288,-82.7724},{-3.88693,-82.7724},{-3.88693,-62.3306},{-4.52668,-62.3306}}));
  connect(idealgearr2t1.flangeT,pr1.flange_p1) annotation(Line(points = {{68.7457,-50.0923},{102.473,-50.0923},{102.473,-9.53852},{103.367,-9.53852}}));
  connect(signaldcmotor1.flange_b,idealgearr2t1.flangeR) annotation(Line(points = {{36.4604,-49.6239},{49.47,-49.6239},{49.47,-50.0923},{48.7457,-50.0923}}));
  connect(PID1.y,signaldcmotor1.u) annotation(Line(points = {{6.47332,-50.3306},{16.2544,-50.3306},{16.2544,-49.6239},{16.4604,-49.6239}}));
  connect(PID1.u_s,prinversekinematics1.y[1]) annotation(Line(points = {{-16.5267,-50.3306},{-44.1696,-50.3306},{-44.1696,-7.46932},{-44.2445,-7.46932}}));
  connect(anglesensor1.flange,idealgear2.flange_b) annotation(Line(points = {{37.3227,7.24009},{71.0247,7.24009},{71.0247,38.9669},{70.6359,38.9669}}));
  connect(anglesensor1.phi,PID2.u_m) annotation(Line(points = {{16.3227,7.24009},{-6.71378,7.24009},{-6.71378,26.4813},{-7.05874,26.4813}}));
  connect(idealgear2.flange_b,pr1.flange_r2) annotation(Line(points = {{70.6359,38.9669},{125.088,38.9669},{125.088,-9.89887},{123.907,-9.89887}}));
  connect(signaldcmotor2.flange_b,idealgear2.flange_a) annotation(Line(points = {{36.665,38.9497},{50.8834,38.9497},{50.8834,38.9669},{50.6359,38.9669}}));
  connect(PID2.y,signaldcmotor2.u) annotation(Line(points = {{3.94126,38.4813},{15.9011,38.4813},{15.9011,38.9497},{16.665,38.9497}}));
  connect(PID2.u_s,prinversekinematics1.y[2]) annotation(Line(points = {{-19.0587,38.4813},{-44.1696,38.4813},{-44.1696,-7.46932},{-44.2445,-7.46932}}));
  connect(flowertrayectory1.y[2],prinversekinematics1.u[2]) annotation(Line(points = {{-73.9745,-8.06099},{-68.5512,-8.06099},{-68.5512,-8.12721},{-68.5512,-8.12721}}));
  connect(flowertrayectory1.y[1],prinversekinematics1.u[1]) annotation(Line(points = {{-73.9745,-8.06099},{-68.9046,-8.06099},{-68.9046,-7.06714},{-68.9046,-7.06714}}));
  annotation(Icon(coordinateSystem(extent = {{-100,-100},{100,100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2,2})), experiment(StartTime = 0, StopTime = 61, Tolerance = 0.000001), Diagram(coordinateSystem(extent = {{-100,-100},{150,100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2,2}), graphics = {Rectangle(origin = {28.6219,-61.4841}, lineColor = {0,85,255}, fillColor = {170,170,255}, pattern = LinePattern.Dash, fillPattern = FillPattern.Solid, lineThickness = 1, extent = {{-54.417,33.5689},{54.417,-33.5689}}),Rectangle(origin = {25.6537,29.1873}, lineColor = {0,85,255}, fillColor = {170,170,255}, pattern = LinePattern.Dash, fillPattern = FillPattern.Solid, lineThickness = 1, extent = {{-54.417,33.5689},{54.417,-33.5689}}),Rectangle(origin = {-44.311,-24.1696}, lineColor = {255,170,0}, fillColor = {255,255,127}, pattern = LinePattern.Dash, fillPattern = FillPattern.Solid, lineThickness = 1, extent = {{-54.417,33.5689},{2.82685,3.53357}})}));
  annotation(Documentation(info = "<html>
<head>
<style type=\"text/css\">
h4      { border-radius:8%;background-color: #D8D8D8 ;}
</style>
</head>

<h4>General</h4>
<p>
In this model the trayectory tracking for PR servomechanisms is tested using PID block and signal DC motor.
</p>

<h4>Example</h4>
<p>Results:</p>
<img src=\"modelica://Servomechanisms/Resources/Images/Examples/pranalysis1.png\" alt=\"pranalysis1.png\" >
<img src=\"modelica://Servomechanisms/Resources/Images/Examples/pranalysis2.png\" alt=\"pranalysis2.png\" >


</html>"));
end PRAnalysis;

