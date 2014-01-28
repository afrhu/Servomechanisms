within Servomechanisms.Examples.RRServomechanism;
model RRMotor1
  extends Modelica.Icons.Example;
  extends Servomechanisms.Examples.RRServomechanism.Data;
  Modelica.Blocks.Sources.Step step1(height = Voltage) annotation(Placement(visible = true, transformation(origin = {-77.3852,21.5548}, extent = {{-10,-10},{10,10}}, rotation = 0)));
  Servomechanisms.Electrical.SignalDCMotor signaldcmotor2(R = R, L = L, kt = k, J = J) annotation(Placement(visible = true, transformation(origin = {-18.397,10.9582}, extent = {{-10,-10},{10,10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.IdealGear idealgear2(ratio = ratio1) annotation(Placement(visible = true, transformation(origin = {19.0588,10.9582}, extent = {{-10,-10},{10,10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sources.Position position1 annotation(Placement(visible = true, transformation(origin = {9.88237,48.4706}, extent = {{-10,-10},{10,10}}, rotation = 0)));
  Modelica.Blocks.Sources.Step step2(height = 0) annotation(Placement(visible = true, transformation(origin = {-21.6205,48.143}, extent = {{-10,-10},{10,10}}, rotation = 0)));
  Modelica.Blocks.Continuous.FirstOrder firstorder1(k = 104.34 / 12, T = 0.0115) annotation(Placement(visible = true, transformation(origin = {-16.2361,-17.0467}, extent = {{-10,-10},{10,10}}, rotation = 0)));
  Servomechanisms.Mechanism.RR rr1(boxLength1 = l1, boxWidth1 = w1, boxHeight1 = h1, density1 = d1, boxLength2 = l2, boxWidth2 = w2, boxHeight2 = h2, density2 = d2) annotation(Placement(visible = true, transformation(origin = {72.9152,13.5512}, extent = {{-23.9046,-23.9046},{23.9046,23.9046}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sensors.SpeedSensor speedsensor1 annotation(Placement(visible = true, transformation(origin = {48.0846,-7.42933}, extent = {{-10,-10},{10,10}}, rotation = 0)));
  Modelica.Blocks.Continuous.FirstOrder firstorder2(k = 104.34 / 12, T = 0.0115) annotation(Placement(visible = true, transformation(origin = {-20.323,-67.0459}, extent = {{-10,-10},{10,10}}, rotation = 0)));
  Modelica.Blocks.Continuous.Integrator integrator1 annotation(Placement(visible = true, transformation(origin = {17.0887,-67.2812}, extent = {{-10,-10},{10,10}}, rotation = 0)));
  Modelica.Blocks.Sources.Step step3(height = 1) annotation(Placement(visible = true, transformation(origin = {-83.5906,-65.2558}, extent = {{-10,-10},{10,10}}, rotation = 0)));
  Modelica.Blocks.Continuous.LimPID PID(yMax = Voltage, controllerType = .Modelica.Blocks.Types.SimpleController.P, k = 7.1543) annotation(Placement(visible = true, transformation(origin = {-49.2643,-65.8695}, extent = {{-10,-10},{10,10}}, rotation = 0)));
equation
  connect(step3.y,PID.u_s) annotation(Line(points = {{-72.5906,-65.2558},{-63.8795,-65.7533},{-63.8795,-68.2493},{-63.3819,-67.7518}}));
  connect(PID.y,firstorder2.u) annotation(Line(points = {{-38.2643,-65.8695},{-33.2912,-66.367},{-33.2912,-67.3081},{-32.7936,-66.8106}}));
  connect(integrator1.y,PID.u_m) annotation(Line(points = {{28.0887,-67.2812},{49.0617,-67.7787},{49.0617,-94.6023},{-49.7618,-94.6023},{-49.7618,-80.014},{-49.2643,-79.5165}}));
  connect(firstorder2.y,integrator1.u) annotation(Line(points = {{-9.32305,-67.0459},{2.9441,-67.5434},{2.9441,-68.7199},{3.44165,-68.2224}}));
  connect(speedsensor1.flange,idealgear2.flange_b) annotation(Line(points = {{38.0846,-7.42933},{29.682,-7.42933},{29.682,10.9541},{29.682,10.9541}}));
  connect(position1.flange,rr1.flange_rotational2) annotation(Line(points = {{19.8824,48.4706},{66.7845,48.4706},{66.7845,27.9152},{66.7845,27.9152}}));
  connect(idealgear2.flange_b,rr1.flange_rotational1) annotation(Line(points = {{29.0588,10.9582},{49.1166,10.9582},{49.1166,10.6007},{49.1166,10.6007}}));
  connect(firstorder1.u,step1.y) annotation(Line(points = {{-28.2361,-17.0467},{-65.8824,-17.0467},{-65.8824,21.5548},{-66.3852,21.5548}}));
  connect(step2.y,position1.phi_ref) annotation(Line(points = {{-10.6205,48.143},{-2.82353,49.0842},{-3.29412,48},{-3.29415,48}}));
  connect(signaldcmotor2.u,step1.y) annotation(Line(points = {{-28.397,10.9582},{-53.6471,10.9582},{-53.6471,20.7059},{-66.3529,20.7059},{-66.3529,20.7059}}));
  connect(signaldcmotor2.flange_b,idealgear2.flange_a) annotation(Line(points = {{-8.39698,10.9582},{8.59946,11.4288},{8.59946,11.0996},{8.59949,11.0996}}));
  annotation(Icon(coordinateSystem(extent = {{-100,-100},{100,100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2,2})), experiment(StartTime = 0, StopTime = 2, Tolerance = 0.000001), Documentation(info = "<html>
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
<img src=\"modelica://Servomechanisms/Resources/Images/Examples/rrmotor1.png\" alt=\"rrmotor1.png\" ><br>
<img src=\"modelica://Servomechanisms/Resources/Images/Examples/rrmotor12.png\" alt=\"rrmotor12.png\" ><br>

</html>"), Diagram(coordinateSystem(extent = {{-100,-100},{100,100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2,2}), graphics = {Rectangle(origin = {44.0299,-32.5871}, fillColor = {255,255,127}, pattern = LinePattern.Dash, fillPattern = FillPattern.Solid, lineThickness = 1, extent = {{-40.5473,10.6965},{49.005,-15.1741}}),Text(origin = {49.5025,-33.3333}, extent = {{-8.70647,2.48756},{8.70647,-2.48756}}, textString = "kp = 7.1543 
for Percentage Overshoot = 10%", fontSize = 4)}));
end RRMotor1;

