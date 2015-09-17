within Servomechanisms.Examples.RRServomechanism;
model RRTorqueAnalysis
  extends Modelica.Icons.Example;
  extends Servomechanisms.Examples.RRServomechanism.Data;
  Servomechanisms.Control.CircleTrajectory circletrajectory1(r = r, xc = xc, yc = yc, period = period) annotation(Placement(transformation(origin = {-86.3472,13.0964}, extent = {{-10,-10},{10,10}})));
  Servomechanisms.Control.RRInverseKinematics rrinversekinematics1(l1 = l1, l2 = l2, elbow = -1) annotation(Placement(transformation(origin = {-55.653,13.0692}, extent = {{-10,-10},{10,10}})));
  Modelica.Blocks.Math.Gain gain2(k = ratio2) annotation(Placement(transformation(origin = {-31.516,46.2842}, extent = {{-10,-10},{10,10}})));
  Modelica.Blocks.Math.Gain gain1(k = ratio1) annotation(Placement(transformation(origin = {-31.948,-24.1313}, extent = {{-10,-10},{10,10}})));
  Modelica.Mechanics.Rotational.Sources.Position position2 annotation(Placement(transformation(origin = {0.565341,46.5018}, extent = {{-10,-10},{10,10}})));
  Modelica.Mechanics.Rotational.Sources.Position position1 annotation(Placement(transformation(origin = {0.000010878,-24.0283}, extent = {{-10,-10},{10,10}})));
  Servomechanisms.Mechanism.TorqueAnalysis torqueMotor1(period = period) annotation(Placement(transformation(origin = {28.5871,-23.9943}, extent = {{-10,-10},{10,10}})));
  Servomechanisms.Mechanism.TorqueAnalysis torqueMotor2(period = period) annotation(Placement(transformation(origin = {27.7316,46.4927}, extent = {{-10,-10},{10,10}})));
  Modelica.Mechanics.Rotational.Components.IdealGear idealgear2(ratio = ratio1) annotation(Placement(transformation(origin = {56.4668,-23.8572}, extent = {{-10,-10},{10,10}})));
  Modelica.Mechanics.Rotational.Components.IdealGear idealgear1(ratio = ratio2) annotation(Placement(transformation(origin = {55.0056,46.2012}, extent = {{-10,-10},{10,10}})));
  Servomechanisms.Mechanism.TorqueAnalysis torqueNeeded1(period = period) annotation(Placement(transformation(origin = {83.5699,-23.4289}, extent = {{-10,-10},{10,10}})));
  Servomechanisms.Mechanism.TorqueAnalysis torqueNeeded2(period = period) annotation(Placement(transformation(origin = {81.928,46.3752}, extent = {{-10,-10},{10,10}})));
  Servomechanisms.Mechanism.RR rr1(boxLength1 = l1, boxWidth1 = w1, boxHeight1 = h1, density1 = d1, boxLength2 = l2, boxWidth2 = w2, boxHeight2 = h2, density2 = d2) annotation(Placement(transformation(origin = {128.569,14.788}, extent = {{-18.7809,-18.7809},{18.7809,18.7809}})));
equation
  connect(torqueNeeded2.flange_b,rr1.flange_rotational2) annotation(Line(points = {{91.928,46.3752},{122.968,46.3752},{122.968,26.5018},{122.968,26.5018}}));
  connect(torqueNeeded1.flange_b,rr1.flange_rotational1) annotation(Line(points = {{93.5699,-23.4289},{110.601,-23.4289},{110.601,13.0742},{110.601,13.0742}}));
  connect(idealgear1.flange_b,torqueNeeded2.flange_a) annotation(Line(points = {{65.0056,46.2012},{71.7314,46.2012},{71.7314,45.583},{71.7314,45.583}}));
  connect(idealgear2.flange_b,torqueNeeded1.flange_a) annotation(Line(points = {{66.4668,-23.8572},{73.1449,-23.8572},{73.1449,-24.3816},{73.1449,-24.3816}}));
  connect(torqueMotor1.flange_b,idealgear2.flange_a) annotation(Line(points = {{38.5871,-23.9943},{46.6431,-23.9943},{46.6431,-24.735},{46.6431,-24.735}}));
  connect(torqueMotor2.flange_b,idealgear1.flange_a) annotation(Line(points = {{37.7316,46.4927},{44.523,46.4927},{44.523,45.9364},{44.523,45.9364}}));
  connect(position2.flange,torqueMotor2.flange_a) annotation(Line(points = {{10.5653,46.5018},{17.3145,46.5018},{17.3145,46.2898},{17.3145,46.2898}}));
  connect(position1.flange,torqueMotor1.flange_a) annotation(Line(points = {{10,-24.0283},{18.7279,-24.0283},{18.7279,-24.0283},{18.7279,-24.0283}}));
  connect(gain2.y,position2.phi_ref) annotation(Line(points = {{-20.516,46.2842},{-11.3074,46.2842},{-11.3074,45.9364},{-11.3074,45.9364}}));
  connect(gain1.y,position1.phi_ref) annotation(Line(points = {{-20.948,-24.1313},{-12.3675,-24.1313},{-12.3675,-24.0283},{-12.3675,-24.0283}}));
  connect(rrinversekinematics1.y[2],gain2.u) annotation(Line(points = {{-44.653,13.0692},{-43.1095,13.0692},{-43.1095,45.583},{-43.1095,45.583}}));
  connect(rrinversekinematics1.y[1],gain1.u) annotation(Line(points = {{-44.653,13.0692},{-44.1696,13.0692},{-44.1696,-24.735},{-44.1696,-24.735}}));
  connect(circletrajectory1.y[2],rrinversekinematics1.u[2]) annotation(Line(points = {{-75.3472,13.0964},{-67.8445,13.0964},{-67.8445,13.0742},{-67.8445,13.0742}}));
  connect(circletrajectory1.y[1],rrinversekinematics1.u[1]) annotation(Line(points = {{-75.3472,13.0964},{-67.1378,13.0964},{-67.1378,12.7208},{-67.1378,12.7208}}));
  annotation( Documentation(info = "<html>
<head>
<style type=\"text/css\">
h4      { border-radius:8%;background-color: #D8D8D8 ;}
</style>
</head>

<h4>General</h4>
<p>
With this model the torque and RMS torque on each joint can be analysed.
With this configuration the dynamic of the system can be calculated.
</p>

<h4>Implementation</h4>
<p>
The block of the trajectory is used as input.
The outputs of this block are connected to the inputs of the block of inverse kinematics.
In this way the coordinates of the trajectory are transform into joint variables.
</p>
<p>
Utilizing the position source the mechanisms will follow the trajectory and with the acausal modelling it is possible to obtain the torque needed in each joint.
If a reduction is used, then the joint variables should be multiplied with the parameter ratio of the idealgear block in order to obtain the expected result.
</p>

<h4>Notes</h4>
<ul>
<li>
The velocities obtain are equivalent to calculate <strong>differential fordward kinematics</strong>
</li>
<li>
The results in this simulations are equivalent to obtain the dynamical behaviour of the systems with
methods as <strong>Euler Lagrange Equations</strong> or <strong>Newton-Euler Equations</strong>.
</li>
<li>
The analysis of torques and velocities allow the selection of the actuator (dc motor) following the next criteria (although it should be taken into account the effects of disturbances):<br>
<img src=\"modelica://Servomechanisms/Resources/Images/Examples/criteria.png\">

</li>
<li>
In order to evaluate the rms torque the simulation should run for two cycles
</li>
<li>
Note that there are two torque analysis (or force analysis) elements per joint, one to evaluate the needed values for the mechanisms and other for those that the motor would proportionate if a reduction is added.
</li>
</ul>

<h4>Example</h4>
<p>
For the first joint:
</p>
<li>
Position<br>
<img src=\"modelica://Servomechanisms/Resources/Images/Examples/p1.png\">
</li>
<li>
Velocity<br>
<img src=\"modelica://Servomechanisms/Resources/Images/Examples/v1.png\">

</li>
<li>
Acceleration<br>
<img src=\"modelica://Servomechanisms/Resources/Images/Examples/a1.png\">

</li>
<li>
Torque and RMS torque since the second cycle<br>
<img src=\"modelica://Servomechanisms/Resources/Images/Examples/t1.png\">

</li>


</html>"), experiment(StartTime = 0, StopTime = 16, Tolerance = 0.000001), Diagram(coordinateSystem(extent = {{-100,-100},{150,100}}, preserveAspectRatio = true, grid = {2,2}), graphics = {Rectangle(origin = {107.728,-74.9415}, fillColor = {170,170,255}, pattern = LinePattern.Dash, fillPattern = FillPattern.Solid, lineThickness = 1, extent = {{-38.4075,21.0773},{38.4075,-21.0773}}),Text(origin = {93.8657,-63.9814}, fillColor = {128,128,128}, lineThickness = 1, extent = {{-16.6276,5.62061},{44.7307,-27.6347}}, textString = "JOINT 1
wmax ~ 1.68 rad/s
tmax ~ 1.8 mN-m
tnom ~ 1.7 mN-m"),Rectangle(origin = {-56.0172,-76.1429}, fillColor = {170,170,255}, pattern = LinePattern.Dash, fillPattern = FillPattern.Solid, lineThickness = 1, extent = {{-38.4075,21.0773},{38.4075,-21.0773}}),Text(origin = {-69.5266,-64.8295}, fillColor = {128,128,128}, lineThickness = 1, extent = {{-16.6276,5.62061},{44.7307,-27.6347}}, textString = "JOINT 2
wmax ~ 1.9 rad/s
tmax ~ 0.35 mN-m
tnom ~ 0.25 mN-m")}));
end RRTorqueAnalysis;

