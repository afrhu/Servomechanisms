within Servomechanisms.Examples.PRServomechanism;
model PRTorqueAnalysis
  extends Modelica.Icons.Example;
  extends Servomechanisms.Utilities.Visual3d;
  extends Servomechanisms.Examples.PRServomechanism.Data;
  Servomechanisms.Control.FlowerTrayectory flowertrayectory1(a = a, xc = xc, yc = yc, period = period, startTime = 0) annotation(Placement(transformation(origin = {-85.7143,-9.24443}, extent = {{-10,-10},{10,10}})));
  Modelica.Mechanics.Rotational.Sources.Position position1(exact = true) annotation(Placement(transformation(origin = {9.58203,-57.0965}, extent = {{-10,-10},{10,10}})));
  Modelica.Blocks.Math.Gain gain1(k = ratio1) annotation(Placement(transformation(origin = {-21.093,-57.3183}, extent = {{-10,-10},{10,10}})));
  Modelica.Mechanics.Translational.Components.IdealGearR2T idealgearr2t1(ratio = ratio1) annotation(Placement(transformation(origin = {62.1825,-57.2438}, extent = {{-10,-10},{10,10}})));
  Servomechanisms.Mechanism.TorqueAnalysis torqueanalysisMotor1(period = period) annotation(Placement(transformation(origin = {34.9823,-57.2438}, extent = {{-10,-10},{10,10}})));
  Modelica.Mechanics.Rotational.Sources.Position position2(exact = true) annotation(Placement(transformation(origin = {9.79403,40.9954}, extent = {{-10,-10},{10,10}})));
  Modelica.Mechanics.Rotational.Components.IdealGear idealgear2(ratio = ratio2) annotation(Placement(transformation(origin = {61.9674,41.145}, extent = {{-10,-10},{10,10}})));
  Modelica.Blocks.Math.Gain gain2(k = ratio2) annotation(Placement(transformation(origin = {-21.1192,41.4803}, extent = {{-10,-10},{10,10}})));
  Servomechanisms.Mechanism.TorqueAnalysis torqueanalysisMotor2(period = period) annotation(Placement(transformation(origin = {35.1943,40.8481}, extent = {{-10,-10},{10,10}})));
  Servomechanisms.Mechanism.ForceAnalysis forceanalysisPrismatic1(period = period) annotation(Placement(transformation(origin = {90.106,-57.2438}, extent = {{-10,-10},{10,10}})));
  Servomechanisms.Mechanism.TorqueAnalysis torqueanalysisRotational2(period = period) annotation(Placement(transformation(origin = {89.1166,41.4134}, extent = {{-10,-10},{10,10}})));
  Servomechanisms.Mechanism.PR pr1(boxLength1 = l1, boxWidth1 = w1, boxHeight1 = h1, density1 = d1, boxLength2 = l2, boxWidth2 = w2, boxHeight2 = h2, density2 = d2) annotation(Placement(transformation(origin = {122.4,-2.1897}, extent = {{-23.267,-23.267},{23.267,23.267}})));
  Servomechanisms.Control.PRInverseKinematics prinversekinematics1(l1 = l1, l2 = l2) annotation(Placement(transformation(origin = {-57.4217,-9.30973}, extent = {{-10,-10},{10,10}})));
equation
  connect(flowertrayectory1.y[2],prinversekinematics1.u[2]) annotation(Line(points = {{-74.7143,-9.24443},{-68.9046,-9.24443},{-68.9046,-9.30973},{-69.4217,-9.30973}}));
  connect(flowertrayectory1.y[1],prinversekinematics1.u[1]) annotation(Line(points = {{-74.7143,-9.24443},{-68.5512,-9.24443},{-68.5512,-9.30973},{-69.4217,-9.30973}}));
  connect(gain2.u,prinversekinematics1.y[2]) annotation(Line(points = {{-33.1192,41.4803},{-44.523,41.4803},{-44.523,-9.30973},{-46.4217,-9.30973}}));
  connect(gain1.u,prinversekinematics1.y[1]) annotation(Line(points = {{-33.093,-57.3183},{-44.0281,-57.3183},{-44.0281,-9.30973},{-46.4217,-9.30973}}));
  connect(gain2.y,position2.phi_ref) annotation(Line(points = {{-10.1192,41.4803},{-1.40515,41.4803},{-1.40515,39.3443},{-1.40515,39.3443}}));
  connect(position2.flange,torqueanalysisMotor2.flange_a) annotation(Line(points = {{19.794,40.9954},{24.8244,40.9954},{24.8244,39.8126},{24.8244,39.8126}}));
  connect(torqueanalysisMotor2.flange_b,idealgear2.flange_a) annotation(Line(points = {{45.1943,40.8481},{51.5222,40.8481},{51.5222,41.6862},{51.5222,41.6862}}));
  connect(idealgear2.flange_b,torqueanalysisRotational2.flange_a) annotation(Line(points = {{71.9674,41.145},{78.6885,41.145},{78.6885,40.281},{78.6885,40.281}}));
  connect(torqueanalysisRotational2.flange_b,pr1.flange_r2) annotation(Line(points = {{99.1166,41.4134},{127.869,41.4134},{127.869,-3.74707},{127.869,-3.74707}}));
  connect(forceanalysisPrismatic1.flange_b,pr1.flange_p1) annotation(Line(points = {{100.106,-57.2438},{108.665,-57.2438},{108.665,-3.27869},{108.665,-3.27869}}));
  connect(idealgearr2t1.flangeT,forceanalysisPrismatic1.flange_a) annotation(Line(points = {{72.1825,-57.2438},{81.0304,-57.2438},{81.0304,-57.1429},{81.0304,-57.1429}}));
  connect(torqueanalysisMotor1.flange_b,idealgearr2t1.flangeR) annotation(Line(points = {{44.9823,-57.2438},{52.459,-57.2438},{52.459,-57.6112},{52.459,-57.6112}}));
  connect(position1.flange,torqueanalysisMotor1.flange_a) annotation(Line(points = {{19.582,-57.0965},{25.2927,-57.0965},{25.2927,-58.0796},{25.2927,-58.0796}}));
  connect(gain1.y,position1.phi_ref) annotation(Line(points = {{-10.093,-57.3183},{-2.8103,-57.3183},{-2.8103,-58.548},{-2.8103,-58.548}}));
  annotation( experiment(StartTime = 0, StopTime = 120, Tolerance = 0.000001));
  annotation(Documentation(info = "<html>
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
The block of the trayectory is used as input.
The outputs of this block are connected to the inputs of the block of inverse kinematics.
In this way the coordinates of the trayectory are transform into joint variables.
</p>
<p>
Utilizing the position source the mechanisms will follow the trayectory and with the acausal modelling it is possible to obtain the torque needed in each joint.
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
<img src=\"modelica://Servomechanisms/Resources/Images/Examples/p2.png\">
</li>
<li>
Velocity<br>
<img src=\"modelica://Servomechanisms/Resources/Images/Examples/v2.png\">

</li>
<li>
Acceleration<br>
<img src=\"modelica://Servomechanisms/Resources/Images/Examples/a2.png\">

</li>
<li>
Torque and RMS torque since the second cycle<br>
<img src=\"modelica://Servomechanisms/Resources/Images/Examples/t2.png\">

</li>
</html>"));
end PRTorqueAnalysis;

