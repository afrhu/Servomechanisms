within Servomechanisms.Electrical;
block IdealPWM
  //Icon
  extends Servomechanisms.Utilities.IconName;
  extends Servomechanisms.Utilities.box;
  //Parameters
  parameter SI.Frequency frequency = 1000 "Frequency of PWM";
  parameter SI.Time startTime = 0 "Time instant of first pulse";
  parameter Real k = 100 "Constant reference of 100%, ex: 12 for 12 V";
  //Components
  Modelica.Blocks.Math.Abs abs annotation(Placement(visible = true, transformation(origin = {-50,0}, extent = {{-10,-10},{10,10}}, rotation = 0)));
  //Interfaces
  Modelica.Blocks.Interfaces.BooleanOutput y annotation(Placement(visible = true, transformation(origin = {100,0}, extent = {{-10,-10},{10,10}}, rotation = 0), iconTransformation(origin = {100,0}, extent = {{-10,-10},{10,10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput u annotation(Placement(visible = true, transformation(origin = {-100,0}, extent = {{-10,-10},{10,10}}, rotation = 0), iconTransformation(origin = {-100,0}, extent = {{-10,-10},{10,10}}, rotation = 0)));
  Modelica.Blocks.Math.Division division1 annotation(Placement(visible = true, transformation(origin = {-24.356,0}, extent = {{-10,-10},{10,10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const(k = k / 100) annotation(Placement(visible = true, transformation(origin = {-52.459,-30.445}, extent = {{-10,-10},{10,10}}, rotation = 0)));
  Servomechanisms.Electrical.BooleanPulse booleanpulse(period = 1 / frequency, startTime = startTime) annotation(Placement(visible = true, transformation(origin = {33.7237,0}, extent = {{-10,-10},{10,10}}, rotation = 0)));
equation
  connect(division1.y,booleanpulse.u) annotation(Line(points = {{-13.356,0},{23.4192,0},{23.4192,0},{23.4192,0}}));
  connect(booleanpulse.y,y) annotation(Line(points = {{44.7237,0},{91.3349,0},{91.3349,-0.468384},{91.3349,-0.468384}}));
  connect(const.y,division1.u2) annotation(Line(points = {{-41.459,-30.445},{-36.534,-30.445},{-36.534,-7.49415},{-36.534,-7.49415}}));
  connect(abs.y,division1.u1) annotation(Line(points = {{-39,0},{-37.0023,0},{-37.0023,4.21546},{-37.0023,4.21546}}));
  connect(u,abs.u) annotation(Line(points = {{-100,0},{-62.2951,0},{-62.2951,-0.468384},{-62.2951,-0.468384}}));
  annotation(Documentation(info = "<html>
<head>
<style type=\"text/css\">
h4      { border-radius:8%;background-color: #D8D8D8 ;}
</style>
</head>

<h4>General</h4>
<p>
This block generates a boolean PWM output from a real input.
</p>

<h4>Implementation</h4>
Using the 
<a href=\"modelica://Modelica\">MSL</a> 
, the absolute value of the continous real input is calculated
and then divided according to the 100 percentage reference value
to obtain a number between 0 and 100.<br>
The pulse is generated with the modified block  
<a href=\"modelica://Servomechanisms.Electrical.BooleanPulse\">BooleanPulse</a> 
.

<h4>Notes</h4>
<ul>
<li>
The pulse uses the absolute value of the real signal input.
</li>
<li>
The width of the pulse only goes from 0 to 100 percent. If the input value is greater than 100 the PWM takes 100 as width.
</li>
<li>
The user can change the frecuency of PWM and the start time.
</li>
<li>
The block needs a reference value for 100  percent.
</li>
</ul>

<h4>Example</h4>
<a href=\"modelica://Servomechanisms.Control.Controller\">Controller<a>


</html>"), Icon(coordinateSystem(extent = {{-100,-100},{100,100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2,2}), graphics = {Text(origin = {0,25}, extent = {{-70,50},{70,-12}}, textString = "PWM"),Line(origin = {0,-50}, points = {{-60,-25},{-60,25},{-50,25},{-50,-25},{-20,-25},{-20,25},{0,25},{0,-25},{20,-25},{20,25},{60,25},{60,-25}})}));
end IdealPWM;

