within Servomechanisms.Electrical;
class DCSource
  //Icon
  extends Servomechanisms.Utilities.IconName;
  extends Servomechanisms.Utilities.box;
  //Parameters
  parameter SI.Voltage V = 1 "DC Voltage";
  parameter SI.Resistance R = 0.1 "Source Resistance";
  //Components
  Modelica.Electrical.Analog.Sources.ConstantVoltage constantvoltage1(V = V) annotation(Placement(visible = true, transformation(origin = {-50,0}, extent = {{-10,-10},{10,10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Resistor resistor1(R = R) annotation(Placement(visible = true, transformation(origin = {0,50}, extent = {{-10,-10},{10,10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Ground ground1 annotation(Placement(visible = true, transformation(origin = {100.234,-73.4192}, extent = {{-10,-10},{10,10}}, rotation = 0)));
  //Interfaces
  Modelica.Electrical.Analog.Interfaces.PositivePin pin_p annotation(Placement(visible = true, transformation(origin = {100,50}, extent = {{-10,-10},{10,10}}, rotation = 0), iconTransformation(origin = {-50,-100}, extent = {{-10,-10},{10,10}}, rotation = 0)));
  Modelica.Electrical.Analog.Interfaces.NegativePin pin_n annotation(Placement(visible = true, transformation(origin = {100,-50}, extent = {{-10,-10},{10,10}}, rotation = 0), iconTransformation(origin = {50,-100}, extent = {{-10,-10},{10,10}}, rotation = 0)));
equation
  connect(ground1.p,pin_n) annotation(Line(points = {{100.234,-63.4192},{100,-63.4192},{100,-49.8233},{100,-49.8233}}));
  connect(constantvoltage1.n,pin_n) annotation(Line(points = {{-50,-10},{-50,-50.1171},{101.639,-50.1171},{101.639,-50.1171}}));
  connect(resistor1.n,pin_p) annotation(Line(points = {{10,50},{99.6466,50},{99.6466,50.53},{99.6466,50.53}}));
  connect(constantvoltage1.p,resistor1.p) annotation(Line(points = {{-50,10},{-50,50.1767},{-10.2473,50.1767},{-10.2473,50.1767}}));
  annotation(Icon(coordinateSystem(extent = {{-100,-100},{100,100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2,2}), graphics = {Line(origin = {4.25532,21.2766}, points = {{0,0},{0,-40}}),Line(origin = {-9.31442,31.8203}, points = {{0,0},{0,-60}}),Line(origin = {13.0258,-43.9482}, points = {{-65.9809,-50.6145},{-65.9809,46.3122},{-22.4821,46.3122}}),Line(origin = {27.0556,-39.5178}, points = {{22,-57.4089},{22,40.9362},{-22.8003,40.9362}}),Text(origin = {-51.0638,25.5319}, extent = {{-17.0213,19.3853},{17.0213,-19.3853}}, textString = "+"),Text(origin = {49.7872,24.2553}, extent = {{-17.0213,19.3853},{17.0213,-19.3853}}, textString = "-"),Text(origin = {-0.706714,67.4912}, extent = {{-60.0707,22.6148},{60.0707,-22.6148}}, textString = "V = %V", fontSize = 30)}));
  annotation(Documentation(info = "<html>
<head>
<style type=\"text/css\">
h4      { border-radius:8%;background-color: #D8D8D8 ;}
</style>
</head>

<h4>General</h4>
<p>
This is the model of a real DC voltage source.
</p>

<h4>Implementation</h4>
This model has a DC voltage source and a resistor (usually with a very small resistance value).<br>
For a resistive load, it holds that:<br><br>
<img src=\"modelica://Servomechanisms/Resources/Images/Electrical/dcsourceequation.png\" alt=\"dcsourceequation.png\" >

<h4>Notes</h4>
<ul>
<li>
The parameters of this model are the DC Voltage and Resistance value in SI units.
</li>
</ul>

</html>"));
end DCSource;

