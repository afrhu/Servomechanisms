within Servomechanisms.Electrical;
class IdealHBridge "Ideal H-Bridge"
  //Icon
  extends Servomechanisms.Utilities.box;
  extends Servomechanisms.Utilities.IconNameB;
  //Parameter
  parameter SI.Resistance Ron(final min = 0) = 0 "Closed switch resistance";
  parameter SI.Conductance Goff(final min = 0) = 0 "Opened switch conductance";
  //Interfaces
  Modelica.Electrical.Analog.Interfaces.PositivePin Vpos annotation(Placement(transformation(origin = {37,90}, extent = {{-10,-10},{10,10}}), iconTransformation(origin = {-50,100}, extent = {{-10,-10},{10,10}})));
  Modelica.Electrical.Analog.Interfaces.NegativePin Vneg annotation(Placement(transformation(origin = {37,-90}, extent = {{-10,-10},{10,10}}), iconTransformation(origin = {50,100}, extent = {{-10,-10},{10,10}})));
  Modelica.Electrical.Analog.Interfaces.PositivePin MotorA annotation(Placement(transformation(origin = {25,0}, extent = {{-10,-10},{10,10}}), iconTransformation(origin = {100,50}, extent = {{-10,-10},{10,10}})));
  Modelica.Electrical.Analog.Interfaces.NegativePin MotorB annotation(Placement(transformation(origin = {50,0}, extent = {{-10,-10},{10,10}}), iconTransformation(origin = {100,-50}, extent = {{-10,-10},{10,10}})));
  Modelica.Blocks.Interfaces.BooleanInput PWM annotation(Placement(transformation(origin = {-100,50}, extent = {{-10.315,-10.315},{10.315,10.315}}), iconTransformation(origin = {-100,50}, extent = {{-10,-10},{10,10}})));
  Modelica.Blocks.Interfaces.BooleanInput ENABLE annotation(Placement(transformation(origin = {-100,-50}, extent = {{-10,-10},{10,10}}), iconTransformation(origin = {-100,-50}, extent = {{-10,-10},{10,10}})));
  //Components
  Modelica.Electrical.Analog.Ideal.IdealClosingSwitch Q2(Ron = Ron, Goff = Goff) annotation(Placement(transformation(origin = {0,-50}, extent = {{10,-10},{-10,10}}, rotation = 90)));
  Modelica.Electrical.Analog.Ideal.IdealClosingSwitch Q1(Ron = Ron, Goff = Goff) annotation(Placement(transformation(origin = {0,50}, extent = {{10,-10},{-10,10}}, rotation = 90)));
  Modelica.Electrical.Analog.Ideal.IdealClosingSwitch Q3(Ron = Ron, Goff = Goff) annotation(Placement(transformation(origin = {75,50}, extent = {{10,10},{-10,-10}}, rotation = 90)));
  Modelica.Electrical.Analog.Ideal.IdealClosingSwitch Q4(Ron = Ron, Goff = Goff) annotation(Placement(transformation(origin = {75,-50}, extent = {{10,10},{-10,-10}}, rotation = 90)));
  //Modelica.Blocks.Logical.And and2 annotation(Placement(transformation(origin = {-25,-50}, extent = {{-10,-10},{10,10}})));
  //Modelica.Blocks.Logical.And and1 annotation(Placement(transformation(origin = {-25,50}, extent = {{-10,-10},{10,10}})));
  Modelica.Electrical.Analog.Sensors.VoltageSensor VAB annotation(Placement(transformation(origin = {39.3443,22.9508}, extent = {{-10,-10},{10,10}})));
  Modelica.Electrical.Analog.Ideal.IdealDiode idealdiode2(Ron = Ron, Goff = Goff, Vknee = 0) annotation(Placement(transformation(origin = {56.0656,50.445}, extent = {{-10,-10},{10,10}}, rotation = 90)));
  Modelica.Electrical.Analog.Ideal.IdealDiode idealdiode3(Ron = Ron, Goff = Goff, Vknee = 0) annotation(Placement(transformation(origin = {22.8103,-49.7892}, extent = {{-10,-10},{10,10}}, rotation = 90)));
  Modelica.Electrical.Analog.Ideal.IdealDiode idealdiode4(Ron = Ron, Goff = Goff, Vknee = 0) annotation(Placement(transformation(origin = {58.7354,-49.9297}, extent = {{-10,-10},{10,10}}, rotation = 90)));
  Modelica.Electrical.Analog.Ideal.IdealDiode idealdiode1(Ron = Ron, Goff = Goff, Vknee = 0) annotation(Placement(transformation(origin = {20.1405,50.5855}, extent = {{-10,-10},{10,10}}, rotation = 90)));
  //extends Modelica.Electrical.Analog.Interfaces.OnePort;
  Servomechanisms.Electrical.SignMagnitudDrive signmagnituddrive1 annotation(Placement(transformation(origin = {-50,0}, extent = {{-20.9011,-20.9011},{20.9011,20.9011}})));
equation
  connect(signmagnituddrive1.o2,Q2.control) annotation(Line(points = {{-29.0989,5.22528},{-7.06714,5.22528},{-7.06714,-50},{-7,-50}}, color = {0,0,127}, pattern = LinePattern.Dash));
  connect(signmagnituddrive1.o3,Q3.control) annotation(Line(points = {{-29.0989,-5.22528},{-14.1343,-5.22528},{-14.1343,-96.1131},{90.106,-96.1131},{90.106,49.1166},{82,49.1166},{82,50}}, color = {0,0,255}, pattern = LinePattern.Dash));
  connect(signmagnituddrive1.o4,Q4.control) annotation(Line(points = {{-29.0989,-15.6758},{-22.6148,-15.6758},{-22.6148,-98.5866},{95.7597,-98.5866},{95.7597,-50.8834},{82,-50.8834},{82,-50}}, color = {255,0,0}, pattern = LinePattern.Dash));
  connect(signmagnituddrive1.o1,Q1.control) annotation(Line(points = {{-29.0989,15.6758},{-8.12721,15.6758},{-8.12721,50},{-7,50}}, color = {255,0,0}, pattern = LinePattern.Dash));
  connect(signmagnituddrive1.ENABLE,ENABLE) annotation(Line(points = {{-70.9011,-10.4506},{-95.4064,-10.4506},{-95.4064,-49.47},{-95.4064,-49.47}}));
  connect(signmagnituddrive1.PWM,PWM) annotation(Line(points = {{-70.9011,10.4506},{-94.3463,10.4506},{-94.3463,49.47},{-94.3463,49.47}}));
  connect(VAB.n,MotorB) annotation(Line(points = {{49.3443,22.9508},{51.5222,22.9508},{51.5222,0},{51.5222,0}}));
  connect(VAB.p,MotorA) annotation(Line(points = {{29.3443,22.9508},{25.2927,22.9508},{25.2927,-0.468384},{25.2927,-0.468384}}));
  connect(MotorB,Q4.p) annotation(Line(points = {{50,0},{74.9415,0},{74.9415,-39.8126},{74.9415,-39.8126}}));
  connect(MotorA,Q1.n) annotation(Line(points = {{25,0},{0,0},{0,39.8126},{0,39.8126}}));
  connect(Q4.p,Q3.n) annotation(Line(points = {{75,-40},{75,39.3443},{74.9415,39.3443},{74.9415,39.3443}}));
  connect(Q2.p,Q1.n) annotation(Line(points = {{0.000000000000000612303,-40},{0.000000000000000612303,39.8126},{0,39.8126},{0,39.8126}}));
  connect(idealdiode1.n,Q1.p) annotation(Line(points = {{20.1405,60.5855},{20.1405,59.9532},{0.936768,59.9532},{0.936768,59.9532}}));
  connect(idealdiode1.p,Q1.n) annotation(Line(points = {{20.1405,40.5855},{20.1405,39.8126},{0,39.8126},{0,39.8126}}));
  connect(idealdiode4.n,Q4.p) annotation(Line(points = {{58.7354,-39.9297},{58.7354,-39.8126},{74.9415,-39.8126},{74.9415,-39.8126}}));
  connect(idealdiode4.p,Q4.n) annotation(Line(points = {{58.7354,-59.9297},{58.7354,-59.9532},{75.4098,-59.9532},{75.4098,-59.9532}}));
  connect(idealdiode3.p,Q2.n) annotation(Line(points = {{22.8103,-59.7892},{22.8103,-60.4215},{-0.468384,-60.4215},{-0.468384,-60.4215}}));
  connect(idealdiode3.n,Q2.p) annotation(Line(points = {{22.8103,-39.7892},{22.8103,-40.7494},{-0.468384,-40.7494},{-0.468384,-40.7494}}));
  connect(idealdiode2.p,Q3.n) annotation(Line(points = {{56.0656,40.445},{56.0656,39.3443},{74.9415,39.3443},{74.9415,39.3443}}));
  connect(idealdiode2.n,Q3.p) annotation(Line(points = {{56.0656,60.445},{56.0656,59.4848},{74.9415,59.4848},{74.9415,59.4848}}));
  connect(Q4.n,Vneg) annotation(Line(points = {{75,-60},{75,-90.4594},{37.8092,-90.4594},{37.8092,-90.4594}}));
  connect(Q2.n,Vneg) annotation(Line(points = {{-0.000000000000000612303,-60},{-0.000000000000000612303,-90.106},{37.8092,-90.106},{37.8092,-90.106}}));
  connect(Q3.p,Vpos) annotation(Line(points = {{75,60},{75,89.7527},{37.1025,89.7527},{37.1025,89.7527}}));
  connect(Q1.p,Vpos) annotation(Line(points = {{0.000000000000000612303,60},{0.000000000000000612303,89.3993},{37.4558,89.3993},{37.4558,89.3993}}));
  annotation(Documentation(info = "<html>
<head>
<style type=\"text/css\">
h4      { border-radius:8%;background-color: #D8D8D8 ;}
</style>
</head>

<h4>General</h4>
<p>
This component simulates the behaviour of an h-bridge using ideal switches.
</p>

<h4>Implementation</h4>
<p>
This model has 4 ideal switches Q1, Q2, Q3 and Q4 wich their respective diode.
Q1 and Q4 form half bridge and Q2 and Q3 the other half bridge.<br>
The bridge is controlled using a <strong>Sign-Magnitude drive</strong> with
boolean inputs and outputs.
</p>

<h4>Notes</h4>
<ul>
<li>
The voltage should be applied on the electrical interfaces
(Vpos and Vneg) using an external dc source for example
<a href=\"modelica://Servomechanisms.Electrical.DCSource\">DCSource</a>
.
</li>
<li>
It uses the Sign-Magnitude method to control the signal
<a href=\"modelica://Servomechanisms.Electrical.SignMagnitudDrive\">SignMagnitudDrive</a>
.
</li>
<li>
The motor pins should be connected to the MotorA and MotorB pins.
</li>
<li>
The inputs are the logical inputs PWM and ENABLE (or direction), which can be generated by an external element, for example
<a href=\"modelica://Servomechanisms.Control.Controller\">Controller</a>
.
</li>
<li>
This model has a voltage sensor (real value) between MotorA and MotorB pins and
<li>Ron (switch resistance when ON) and Goff (swithch conductance when OFF) can be zero.
</li>
</ul>

<h4>See also</h4>
<dd>
<a href=\"modelica://Servomechanisms.Electrical.HBridge\">Servomechanisms.Electrical.HBridge</a>
</dd>

</html>"), Icon(coordinateSystem(extent = {{-100,-100},{100,100}}, preserveAspectRatio = true, grid = {2,2}), graphics = {Ellipse(origin = {1.79696,-32.6562}, lineThickness = 1, extent = {{-10,10},{10,-10}}, endAngle = 360),Line(origin = {12.797,-32.6562}, points = {{0,0},{19,0}}, thickness = 1),Line(origin = {-28.203,-32.6562}, points = {{0,0},{19,0}}, thickness = 1),Text(origin = {2.50368,-32.3029}, extent = {{-10,10},{10,-10}}, textString = "M"),Line(origin = {1.79696,7.34378}, points = {{0,0},{30,0},{30,-20},{40,-30}}, thickness = 1),Line(origin = {1.79696,7.34378}, points = {{30,-30},{30,-60},{40,-70}}, thickness = 1),Line(origin = {1.79696,7.34378}, points = {{-30,-70},{-30,-80},{0,-80}}, thickness = 1),Line(origin = {1.79696,7.34378}, points = {{0,0},{-30,0},{-30,-20},{-40,-30}}, thickness = 1),Line(origin = {1.79696,7.34378}, points = {{-30,-30},{-30,-60},{-40,-70}}, thickness = 1),Line(origin = {1.79696,7.34378}, points = {{30,-70},{30,-80},{0,-80}}, thickness = 1),Text(origin = {44.8809,17.0372}, extent = {{28.2206,16.2633},{46.5125,5.69395}}, textString = "A", fontSize = 20),Text(origin = {43.9045,-81.1274}, extent = {{28.2206,16.2633},{46.5125,5.69395}}, textString = "B", fontSize = 20),Text(origin = {-83.8308,62.5266}, extent = {{28.2206,16.2633},{46.5125,5.69395}}, textString = "v+", fontSize = 20),Text(origin = {14.456,62.2393}, extent = {{28.2206,16.2633},{46.5125,5.69395}}, textString = "v-", fontSize = 20),Text(origin = {-99.8447,19.2971}, extent = {{28.2206,16.2633},{46.5125,5.69395}}, textString = "PWM", fontSize = 20),Text(origin = {-121.272,-81.3409}, extent = {{28.2206,16.2633},{46.5125,5.69395}}, textString = "E", fontSize = 20)}));
end IdealHBridge;

