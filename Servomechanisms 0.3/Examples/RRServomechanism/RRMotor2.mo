within Servomechanisms.Examples.RRServomechanism;
model RRMotor2
  extends Modelica.Icons.Example;
  extends Servomechanisms.Examples.RRServomechanism.Data;
  Modelica.Blocks.Sources.Step step1(height = Voltage) annotation(Placement(visible = true, transformation(origin = {-72.6793,41.3195}, extent = {{-10,-10},{10,10}}, rotation = 0)));
  Servomechanisms.Electrical.SignalDCMotor signaldcmotor2(R = R, L = L, kt = k, J = J) annotation(Placement(visible = true, transformation(origin = {-12.7499,54.2523}, extent = {{-10,-10},{10,10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.IdealGear idealgear2(ratio = ratio2) annotation(Placement(visible = true, transformation(origin = {24.7059,54.2523}, extent = {{-10,-10},{10,10}}, rotation = 0)));
  Modelica.Blocks.Continuous.FirstOrder firstorder2(k = 208.7 / 12, T = 0.0093) annotation(Placement(visible = true, transformation(origin = {-5.05508,-59.4288}, extent = {{-10,-10},{10,10}}, rotation = 0)));
  Modelica.Blocks.Continuous.Integrator integrator1 annotation(Placement(visible = true, transformation(origin = {32.3567,-59.6641}, extent = {{-10,-10},{10,10}}, rotation = 0)));
  Modelica.Blocks.Sources.Step step3(height = 1) annotation(Placement(visible = true, transformation(origin = {-68.3226,-57.6387}, extent = {{-10,-10},{10,10}}, rotation = 0)));
  Modelica.Blocks.Continuous.Integrator integrator2 annotation(Placement(visible = true, transformation(origin = {-2.70214,-7.19351}, extent = {{-10,-10},{10,10}}, rotation = 0)));
  Modelica.Blocks.Continuous.FirstOrder firstorder1(k = 208.7 / 12, T = 0.0093) annotation(Placement(visible = true, transformation(origin = {-37.902,-6.88235}, extent = {{-10,-10},{10,10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sensors.SpeedSensor speedsensor1 annotation(Placement(visible = true, transformation(origin = {83.3922,57.2438}, extent = {{-10,-10},{10,10}}, rotation = 0)));
  Modelica.Blocks.Sources.Step step2(height = 3.14 / 4) annotation(Placement(visible = true, transformation(origin = {-14.4462,29.5556}, extent = {{-10,-10},{10,10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sources.Position position1(exact = true) annotation(Placement(visible = true, transformation(origin = {23.8828,30.3521}, extent = {{-10,-10},{10,10}}, rotation = 0)));
  Servomechanisms.Mechanism.RR rr1(boxLength1 = l1, boxWidth1 = w1, boxHeight1 = h1, density1 = d1, boxLength2 = l2, boxWidth2 = w2, boxHeight2 = h2, density2 = d2) annotation(Placement(visible = true, transformation(origin = {73.6781,24.4259}, extent = {{-17.1347,-17.1347},{17.1347,17.1347}}, rotation = 0)));
  Modelica.Blocks.Continuous.LimPID PID(yMax = Voltage, controllerType = .Modelica.Blocks.Types.SimpleController.P, k = 4.423) annotation(Placement(visible = true, transformation(origin = {-35.66,-57.7621}, extent = {{-10,-10},{10,10}}, rotation = 0)));
equation
  connect(step3.y,PID.u_s) annotation(Line(points = {{-57.3226,-57.6387},{-47.7605,-57.5215},{-47.66,-58.6057},{-47.66,-57.7621}}));
  connect(PID.y,firstorder2.u) annotation(Line(points = {{-24.66,-57.7621},{-17.5257,-57.7621},{-17.5257,-58.9582},{-17.0551,-59.4288}}));
  connect(integrator1.y,PID.u_m) annotation(Line(points = {{43.3567,-59.6641},{61.4841,-59.6641},{61.4841,-87.6325},{-35.689,-87.6325},{-35.66,-71.0247},{-35.66,-69.7621}}));
  connect(position1.flange,rr1.flange_rotational1) annotation(Line(points = {{33.8828,30.3521},{57.2438,30.3521},{57.2438,22.6148},{57.2438,22.6148}}));
  connect(idealgear2.flange_b,rr1.flange_rotational2) annotation(Line(points = {{34.7059,54.2523},{69.6113,54.2523},{69.6113,35.689},{69.6113,35.689}}));
  connect(step2.y,position1.phi_ref) annotation(Line(points = {{-3.4462,29.5556},{9.54064,29.5556},{11.8828,31.0588},{11.8828,30.3521}}));
  connect(speedsensor1.flange,idealgear2.flange_b) annotation(Line(points = {{73.3922,57.2438},{34.9823,57.2438},{34.9823,53.3569},{34.9823,53.3569}}));
  connect(firstorder1.y,integrator2.u) annotation(Line(points = {{-26.902,-6.88235},{-15.0588,-6.88235},{-15.0588,-7.19351},{-14.7021,-7.19351}}));
  connect(firstorder1.u,step1.y) annotation(Line(points = {{-49.902,-6.88235},{-61.1765,-6.88235},{-61.1765,41.3195},{-61.6793,41.3195}}));
  connect(firstorder2.y,integrator1.u) annotation(Line(points = {{5.94492,-59.4288},{18.7096,-59.4288},{19.063,-60.0175},{20.3567,-59.6641}}));
  connect(signaldcmotor2.flange_b,idealgear2.flange_a) annotation(Line(points = {{-2.74992,54.2523},{14.2465,54.2523},{14.2465,54.8643},{14.2466,54.3937}}));
  connect(step1.y,signaldcmotor2.u) annotation(Line(points = {{-61.6793,41.3195},{-56.4248,41.3195},{-56.4248,55.2176},{-23.5627,55.2176},{-23.5627,54.747}}));
  annotation(Icon(coordinateSystem(extent = {{-100,-100},{100,100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2,2})), experiment(StartTime = 0, StopTime = 1, Tolerance = 0.000001), Documentation(info = "<html>
<head>
<style type=\"text/css\">
h4      { border-radius:8%;background-color: #D8D8D8 ;}
</style>
</head>

<h4>General</h4>
<p>
With this example the user can characterize the motor for a selected joint by its transfer function assuming a first order transfer function.
With the transfer function obtained a proportional gain is then calculated for a proportional control.
</p>

<h4>Implementation</h4>
The system is interconnected using the
<a href=\"modelica://Modelica\">SignalDCMotor</a>  
for one joint and a
<a href=\"modelica://Modelica\">Position source</a>  
for the other joint (to maintain it at its initial position).<br>
Once simulated, the values of tau (time constant T) and K (gain k) are obtain for the equivalent first order transfer function with the relations:
<pre>
K = gain of system for steady state/ reference value
tau = time to reach ~ 0.63K
</pre>
<p>
Then the proportional gain is calculated for a maximum overshot (O) requirement using the following equation:<br>
<img src=\"modelica://Servomechanisms/Resources/Images/Electrical/kpequation.png\" alt=\"kpequation.png\" ><br>
Note that O is the overshot value (for example 0.1) not a porcentual overshoot PO (for example 10%). 
</p>

<h4>Notes</h4>
<ul>
<li>
The PID block <em>controller type</em> must be <strong>.Modelica.Blocks.Types.SimpleController.P</strong> for proportional control.
</li>
<li>
At the moment the K and tau values are obtain after simulating and observing speed responce of motor.
</li>
<li>
At the moment the kp value should be calculated externally, although it could be implemented using a modelica function
</li>
</ul>

<h4>Example</h4>
<p>Results:</p>
<img src=\"modelica://Servomechanisms/Resources/Images/Examples/rrmotor2.png\" alt=\"rrmotor2.png\" ><br>
<img src=\"modelica://Servomechanisms/Resources/Images/Examples/rrmotor22.png\" alt=\"rrmotor22.png\" ><br>


</html>"), Diagram(coordinateSystem(extent = {{-100,-100},{100,100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2,2}), graphics = {Rectangle(origin = {50.7117,-27.9359}, fillColor = {255,255,127}, pattern = LinePattern.Dash, fillPattern = FillPattern.Solid, lineThickness = 1, extent = {{-36.121,11.5658},{48.9324,-12.6335}}),Text(origin = {40.7473,-23.1317}, fillColor = {0,170,255}, fillPattern = FillPattern.Solid, extent = {{-11.21,3.55872},{44.306,-11.3879}}, textString = "kp = 4.423 
for Percentage Overshoot = 10%", fontSize = 4)}));
end RRMotor2;

