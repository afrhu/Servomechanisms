within Servomechanisms.Blocks;
block MotorBlockReducedOrder
  extends Modelica.Blocks.Interfaces.SISO;
  //Parameters
  parameter Real R = 0.385 "Armature Resistance";
  parameter Real km = 7.83 "Torque Constant";
  parameter Real J = 0.0000000153 "Rotor Inertia";
  parameter Real B = 0 "Damping constant";
  parameter Real kb = 7.83 "Back emf constant";
  Modelica.Blocks.Continuous.TransferFunction transferfunction2(a = {J,B}) annotation(Placement(visible = true, transformation(origin = {54.6604,0.327869}, extent = {{-10,-10},{10,10}}, rotation = 0)));
  Modelica.Blocks.Math.Add add1(k1 = -1) annotation(Placement(visible = true, transformation(origin = {22.0141,1.40515}, extent = {{-10,-10},{10,10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput realinput1 annotation(Placement(visible = true, transformation(origin = {1.87354,98.3607}, extent = {{-10,-10},{10,10}}, rotation = 0), iconTransformation(origin = {-0.936768,93.6768}, extent = {{-10,-10},{10,10}}, rotation = -90)));
  Modelica.Blocks.Math.Feedback feedback1 annotation(Placement(visible = true, transformation(origin = {-80.562,0.468379}, extent = {{-10,-10},{10,10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain2(k = kb) annotation(Placement(visible = true, transformation(origin = {-7.16627,-48.3841}, extent = {{10,-10},{-10,10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain1(k = km / R) annotation(Placement(visible = true, transformation(origin = {-33.2553,0.936764}, extent = {{-10,-10},{10,10}}, rotation = 0)));
equation
  connect(gain1.u,feedback1.y) annotation(Line(points = {{-45.2553,0.936764},{-71.6628,0.936764},{-71.6628,0},{-71.6628,0}}));
  connect(gain1.y,add1.u2) annotation(Line(points = {{-22.2553,0.936764},{-1.40515,0.936764},{-1.40515,-4.21546},{8.8993,-4.21546},{8.8993,-4.21546}}));
  connect(gain2.y,feedback1.u2) annotation(Line(points = {{-18.1663,-48.3841},{-80.0937,-48.3841},{-80.0937,-9.36768},{-80.0937,-9.36768}}));
  connect(gain2.u,transferfunction2.y) annotation(Line(points = {{4.83373,-48.3841},{66.0422,-48.3841},{66.0422,0.327869},{65.6604,0.327869}}));
  connect(transferfunction2.y,y) annotation(Line(points = {{65.6604,0.327869},{102.576,0.327869},{102.576,0},{102.576,0}}));
  connect(add1.y,transferfunction2.u) annotation(Line(points = {{33.0141,1.40515},{42.623,1.40515},{42.623,-1.40515},{42.623,-1.40515}}));
  connect(realinput1,add1.u1) annotation(Line(points = {{1.87354,98.3607},{4.68384,98.3607},{4.68384,7.02576},{9.36768,7.02576},{9.36768,7.02576}}));
  connect(u,feedback1.u1) annotation(Line(points = {{-120,0},{-88.5246,0},{-88.5246,-0.468384},{-88.5246,-0.468384}}));
  annotation(Icon(coordinateSystem(extent = {{-100,-100},{100,100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2,2})), Diagram(coordinateSystem(extent = {{-100,-100},{100,100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2,2})));
  annotation(Documentation(info = "<html>
<head>
<style type=\"text/css\">
h4      { border-radius:8%;background-color: #D8D8D8 ;}
</style>
</head>

<h4>General</h4>
<p>
This blocks models the reduced transfer function of a permanent magnet dc motor.
</p>

<h4>Implementation</h4>
<p>
Given the mathematical equation for the transfer function:
Assuming a negigible inductance parameter :
</p>
<img src=\"modelica://Servomechanisms/Resources/Images/Blocks/reducedtransferfunction.png\" alt=\"reducedtransferfunction.png\" >
<p>
However, for this block mechanical disturbance effects are added as an input.
</p>

<h4>Notes</h4>
<ul>
<li>
This block has causality predetermined
</li>
<li>
The output is speed and the input voltage.
</li>
</ul>
</html>"));
end MotorBlockReducedOrder;

