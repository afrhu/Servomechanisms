within Servomechanisms.Electrical;
model HBridge
  //Icon
  extends Servomechanisms.Utilities.box;
  extends Servomechanisms.Utilities.IconNameB;
  //Parameters
  parameter SI.Resistance Res = 10000000.0;
  parameter SI.Resistance Res1 = 1000;
  parameter SI.Transconductance Beta = 10 "Transconductance parameter";
  Modelica.Electrical.Analog.Semiconductors.NMOS Q4(RDS = Res, Beta = Beta) annotation(Placement(visible = true, transformation(origin = {49.0459,-26.2191}, extent = {{10,-10},{-10,10}}, rotation = 0)));
  //Interfaces
  //Components
  Modelica.Electrical.Analog.Ideal.IdealClosingSwitch S1(Ron = 0) annotation(Placement(visible = true, transformation(origin = {-48.0565,42.4028}, extent = {{-10,-10},{10,10}}, rotation = 0)));
  Modelica.Electrical.Analog.Ideal.IdealClosingSwitch S4(Ron = 0) annotation(Placement(visible = true, transformation(origin = {82.2615,-31.1661}, extent = {{10,-10},{-10,10}}, rotation = 0)));
  Modelica.Electrical.Analog.Semiconductors.Diode diode1 annotation(Placement(visible = true, transformation(origin = {6.67484,49.5762}, extent = {{3.02978,-3.02978},{-3.02978,3.02978}}, rotation = -90)));
  Modelica.Electrical.Analog.Semiconductors.Diode diode4 annotation(Placement(visible = true, transformation(origin = {32.8514,-25.8603}, extent = {{3.02978,-3.02978},{-3.02978,3.02978}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Resistor resistor4(R = Res1) annotation(Placement(visible = true, transformation(origin = {59.8962,-42.4652}, extent = {{-3.46539,-3.46539},{3.46539,3.46539}}, rotation = -90)));
  Modelica.Electrical.Analog.Interfaces.PositivePin pin_p annotation(Placement(visible = true, transformation(origin = {22.4824,75.4098}, extent = {{-10,-10},{10,10}}, rotation = 0), iconTransformation(origin = {-48.712,96.4871}, extent = {{-10,-10},{10,10}}, rotation = 0)));
  Modelica.Electrical.Analog.Interfaces.NegativePin pin_n annotation(Placement(visible = true, transformation(origin = {23.4192,-64.1686}, extent = {{-10,-10},{10,10}}, rotation = 0), iconTransformation(origin = {33.7237,96.0188}, extent = {{-10,-10},{10,10}}, rotation = 0)));
  Modelica.Electrical.Analog.Interfaces.PositivePin MotorA annotation(Placement(visible = true, transformation(origin = {14.0515,7.02576}, extent = {{-10,-10},{10,10}}, rotation = 0), iconTransformation(origin = {98.829,45.4333}, extent = {{-10,-10},{10,10}}, rotation = 0)));
  Modelica.Electrical.Analog.Interfaces.NegativePin MotorB annotation(Placement(visible = true, transformation(origin = {31.8501,7.02576}, extent = {{-10,-10},{10,10}}, rotation = 0), iconTransformation(origin = {98.829,-43.5597}, extent = {{-10,-10},{10,10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.BooleanInput PWM annotation(Placement(visible = true, transformation(origin = {-147.541,36.0656}, extent = {{-10,-10},{10,10}}, rotation = 0), iconTransformation(origin = {-98.8291,52.459}, extent = {{-10,-10},{10,10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.BooleanInput DIR annotation(Placement(visible = true, transformation(origin = {-142.389,-71.6628}, extent = {{-10,-10},{10,10}}, rotation = 0), iconTransformation(origin = {-96.019,-40.7495}, extent = {{-10,-10},{10,10}}, rotation = 0)));
  Modelica.Electrical.Analog.Sensors.VoltageSensor VAB annotation(Placement(visible = true, transformation(origin = {22.4824,26.2295}, extent = {{-10,-10},{10,10}}, rotation = 0)));
  Servomechanisms.Electrical.DCSource dcsource2(V = -5, R = 0) annotation(Placement(visible = true, transformation(origin = {-81.171,35.4567}, extent = {{10,-10},{-10,10}}, rotation = 90)));
  Modelica.Electrical.Analog.Semiconductors.PMOS Q1(RDS = Res, Beta = Beta) annotation(Placement(visible = true, transformation(origin = {-12.6882,50.4974}, extent = {{-9.61404,-9.61404},{9.61404,9.61404}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Resistor resistor3(R = Res1) annotation(Placement(visible = true, transformation(origin = {-28.8417,62.7992}, extent = {{-5.45107,-5.45107},{5.45107,5.45107}}, rotation = -90)));
  Modelica.Electrical.Analog.Semiconductors.NMOS Q2(RDS = Res, Beta = Beta) annotation(Placement(visible = true, transformation(origin = {-14.4922,-26.8791}, extent = {{-10,-10},{10,10}}, rotation = 0)));
  Modelica.Electrical.Analog.Semiconductors.Diode diode2 annotation(Placement(visible = true, transformation(origin = {6.14194,-26.5203}, extent = {{3.02978,-3.02978},{-3.02978,3.02978}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Resistor resistor1(R = Res1) annotation(Placement(visible = true, transformation(origin = {-24.9755,-49.413}, extent = {{-3.46539,-3.46539},{3.46539,3.46539}}, rotation = -90)));
  Modelica.Electrical.Analog.Semiconductors.PMOS Q3(RDS = Res, Beta = Beta) annotation(Placement(visible = true, transformation(origin = {54.2458,49.1638}, extent = {{9.61404,-9.61404},{-9.61404,9.61404}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Resistor resistor2(R = Res1) annotation(Placement(visible = true, transformation(origin = {72.4507,60.7919}, extent = {{-5.45107,-5.45107},{5.45107,5.45107}}, rotation = -90)));
  Modelica.Electrical.Analog.Ideal.IdealClosingSwitch S3(Ron = Res1) annotation(Placement(visible = true, transformation(origin = {90.9628,44.6622}, extent = {{10,-10},{-10,10}}, rotation = 0)));
  Modelica.Electrical.Analog.Ideal.IdealClosingSwitch S2(Ron = Res1) annotation(Placement(visible = true, transformation(origin = {-47.3553,-31.2269}, extent = {{-10,-10},{10,10}}, rotation = 0)));
  Modelica.Electrical.Analog.Semiconductors.Diode diode3 annotation(Placement(visible = true, transformation(origin = {34.2468,50.0154}, extent = {{3.02978,-3.02978},{-3.02978,3.02978}}, rotation = -90)));
  Servomechanisms.Electrical.DCSource dcsource1(V = 5, R = 0) annotation(Placement(visible = true, transformation(origin = {114.124,-45.0204}, extent = {{10,10},{-10,-10}}, rotation = 90)));
  Modelica.Electrical.Analog.Basic.Capacitor capacitor1(C = 0.000000001) annotation(Placement(visible = true, transformation(origin = {168.618,3.74707}, extent = {{-10,-10},{10,10}}, rotation = 0)));
  Servomechanisms.Electrical.SignMagnitudDrive signmagnituddrive1 annotation(Placement(visible = true, transformation(origin = {-104.657,-7.57193}, extent = {{-10,-10},{10,10}}, rotation = 0)));
equation
  connect(signmagnituddrive1.o4,S4.control) annotation(Line(points = {{-94.657,-15.0719},{-90.8632,-15.0719},{-90.8632,-73.1954},{133.14,-73.1954},{133.14,-23.0313},{82.3448,-23.0313},{82.3448,-23.0313}}));
  connect(signmagnituddrive1.o3,S3.control) annotation(Line(points = {{-94.657,-10.0719},{-82.6603,-10.0719},{-82.6603,-88.3392},{140.081,-88.3392},{140.081,59.629},{90.8632,59.629},{90.8632,53.0035},{90.8632,53.0035}}));
  connect(signmagnituddrive1.o2,S2.control) annotation(Line(points = {{-94.657,-5.07193},{-47.0091,-5.07193},{-47.0091,-23.3468},{-47.0091,-23.3468}}));
  connect(signmagnituddrive1.o1,S1.control) annotation(Line(points = {{-94.657,-0.0719271},{-84.5533,-0.0719271},{-84.5533,21.1383},{-115.472,21.1383},{-115.472,60.26},{-48.5866,60.26},{-48.5866,50.1641},{-48.5866,50.1641}}));
  connect(DIR,signmagnituddrive1.ENABLE) annotation(Line(points = {{-142.389,-71.6628},{-122.728,-71.6628},{-122.728,-12.6199},{-112.633,-12.5719},{-114.657,-12.5719}}));
  connect(PWM,signmagnituddrive1.PWM) annotation(Line(points = {{-147.541,36.0656},{-125.568,36.0656},{-125.568,-2.20848},{-112.002,-2.57193},{-114.657,-2.57193}}));
  connect(capacitor1.n,pin_n) annotation(Line(points = {{178.618,3.74707},{183.138,3.74707},{183.138,-64.637},{23.4192,-64.637},{23.4192,-64.637}}));
  connect(capacitor1.p,pin_p) annotation(Line(points = {{158.618,3.74707},{154.098,3.74707},{154.098,75.4098},{22.4824,75.4098},{22.4824,75.4098}}));
  connect(Q3.S,MotorB) annotation(Line(points = {{44.6318,44.3568},{47.3068,44.3568},{47.3068,7.96253},{35.1288,7.96253},{35.1288,7.96253}}));
  connect(dcsource1.pin_p,S4.p) annotation(Line(points = {{104.124,-40.0204},{104.124,-30.936},{91.802,-30.936},{91.802,-30.936}}));
  connect(dcsource1.pin_p,S2.p) annotation(Line(points = {{104.124,-40.0204},{104.124,-11.2282},{-70.0642,-11.2282},{-70.0642,-31.2145},{-56.5903,-31.2145},{-56.5903,-31.2145}}));
  connect(diode3.n,Q3.D) annotation(Line(points = {{34.2468,53.0452},{34.2468,54.2655},{44.1696,54.2655},{44.1696,54.2655}}));
  connect(Q3.S,diode3.p) annotation(Line(points = {{44.6318,44.3567},{34.3892,44.3567},{34.3892,46.6936},{34.3892,46.6936}}));
  connect(S1.p,S3.p) annotation(Line(points = {{-58.0565,42.4028},{-52.9973,42.4028},{-52.9973,90.9487},{101.279,90.9487},{101.279,44.4638},{101.279,44.4638}}));
  connect(S2.n,Q2.G) annotation(Line(points = {{-37.3553,-31.2269},{-25.1512,-31.2269},{-25.1512,-31.8882},{-25.1512,-31.8882}}));
  connect(S3.n,Q3.G) annotation(Line(points = {{80.9628,44.6622},{64.2255,44.6622},{64.2255,44.9129},{64.2255,44.9129}}));
  connect(resistor2.n,Q3.G) annotation(Line(points = {{72.4507,55.3408},{72.4507,44.6884},{64.2255,44.6884},{64.2255,44.6884}}));
  connect(resistor2.p,pin_p) annotation(Line(points = {{72.4507,66.2429},{72.4507,76.5766},{21.7828,76.5766},{21.7828,76.5766}}));
  connect(Q3.B,Q3.D) annotation(Line(points = {{44.6318,49.1638},{44.9129,49.1638},{44.9129,53.8955},{44.9129,53.8955}}));
  connect(pin_p,Q3.D) annotation(Line(points = {{22.4824,75.4098},{44.9129,75.4098},{44.9129,54.7938},{44.9129,54.7938}}));
  connect(resistor1.p,Q2.G) annotation(Line(points = {{-24.9755,-45.9476},{-24.9755,-32.7864},{-24.7021,-32.7864},{-24.7021,-32.7864}}));
  connect(resistor1.n,pin_n) annotation(Line(points = {{-24.9755,-52.8784},{-24.9755,-64.8992},{23.4192,-64.8992},{23.4192,-64.1686}}));
  connect(Q2.D,diode2.n) annotation(Line(points = {{-4.49217,-21.8791},{6.28781,-21.8791},{6.28781,-23.5793},{6.28781,-23.5793}}));
  connect(Q2.S,diode2.p) annotation(Line(points = {{-4.49217,-31.8791},{6.28781,-31.8791},{6.28781,-29.6425},{6.28781,-29.6425}}));
  connect(Q2.S,Q2.B) annotation(Line(points = {{-4.49217,-31.8791},{-4.49129,-31.8791},{-4.49129,-27.1723},{-4.49129,-27.1723}}));
  connect(pin_n,Q2.S) annotation(Line(points = {{23.4192,-64.1686},{-4.26673,-64.1686},{-4.26673,-32.1128},{-4.26673,-32.1128}}));
  connect(MotorA,Q2.D) annotation(Line(points = {{14.0515,7.02576},{-4.49129,7.02576},{-4.49129,-22.4565},{-4.49129,-22.4565}}));
  connect(resistor3.p,pin_p) annotation(Line(points = {{-28.8417,68.2503},{-28.8417,77.7173},{22.4824,77.7173},{22.4824,75.4098}}));
  connect(Q1.G,resistor3.n) annotation(Line(points = {{-22.3023,45.6904},{-27.1633,45.6904},{-28.8417,70.4268},{-28.8417,57.3481}}));
  connect(Q1.S,diode1.p) annotation(Line(points = {{-3.0742,45.6904},{6.81714,45.6904},{6.81714,46.517},{6.81714,46.517}}));
  connect(Q1.D,diode1.n) annotation(Line(points = {{-3.0742,55.3045},{6.81714,55.3045},{6.81714,52.5321},{6.81714,52.5321}}));
  connect(Q1.G,S1.n) annotation(Line(points = {{-22.3023,45.6904},{-38.2963,45.6904},{-38.2963,42.5069},{-38.2963,42.5069}}));
  connect(Q1.B,Q1.D) annotation(Line(points = {{-3.0742,50.4974},{-2.77032,50.4974},{-2.77032,55.8021},{-2.77032,55.8021}}));
  connect(MotorA,Q1.S) annotation(Line(points = {{14.0515,7.02576},{-2.8103,7.02576},{-3.0742,46.37},{-3.0742,45.6904}}));
  connect(Q1.D,pin_p) annotation(Line(points = {{-3.0742,55.3045},{-2.8103,55.3045},{-2.8103,74.0047},{21.0773,74.0047},{21.0773,74.0047}}));
  connect(S1.p,dcsource2.pin_p) annotation(Line(points = {{-58.0565,42.4028},{-69.7892,42.4028},{-71.171,40.281},{-71.171,40.4567}}));
  connect(VAB.n,MotorB) annotation(Line(points = {{32.4824,26.2295},{33.2553,26.2295},{33.2553,8.43091},{33.2553,8.43091}}));
  connect(VAB.p,MotorA) annotation(Line(points = {{12.4824,26.2295},{13.1148,26.2295},{13.1148,8.8993},{13.1148,8.8993}}));
  connect(resistor4.n,pin_n) annotation(Line(points = {{59.8962,-45.9306},{59.8962,-65.1054},{23.8876,-65.1054},{23.8876,-65.1054}}));
  connect(pin_n,Q4.S) annotation(Line(points = {{23.4192,-64.1686},{38.8759,-64.1686},{38.8759,-31.8501},{38.8759,-31.8501}}));
  connect(MotorB,Q4.D) annotation(Line(points = {{31.8501,7.02576},{39.8126,7.02576},{39.8126,-20.6089},{39.8126,-20.6089}}));
  connect(Q4.G,S4.n) annotation(Line(points = {{59.0459,-31.2191},{72.4356,-31.2191},{72.4356,-31.4391},{72.4356,-31.4391}}));
  connect(resistor4.p,Q4.G) annotation(Line(points = {{59.8962,-38.9998},{59.8962,-31.9421},{58.8539,-31.9421},{58.8539,-31.9421}}));
  connect(diode4.n,Q4.D) annotation(Line(points = {{32.8514,-22.8305},{32.8514,-20.8755},{38.4814,-20.8755},{38.4814,-20.8755}}));
  connect(Q4.S,diode4.p) annotation(Line(points = {{39.0459,-31.2191},{32.6966,-31.2191},{32.6966,-28.9239},{32.6966,-28.9239}}));
  connect(Q4.B,Q4.S) annotation(Line(points = {{39.0459,-26.2191},{38.9844,-26.2191},{38.9844,-31.4391},{38.9844,-31.4391}}));
  annotation(Documentation(info = "<html>
<head>
<style type=\"text/css\">
h4      { border-radius:8%;background-color: #D8D8D8 ;}
</style>
</head>

<h4>General</h4>
<p>
This component simulates the behaviour of an h-bridge using MOSFET transistors.
</p>

<h4>Implementation</h4>
<p>
This model has 4 transistors Q1, Q2, Q3 and Q4 wich their respective diode.
Q1 and Q4 form half bridge and Q2 and Q3 the other half bridge.<br>
Q1 and Q3 are PMOS transistors while Q2 and Q4 are NMOS given the configuration.<br>
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
</li>
<li>The transconductance of transistors can be change.</li>
</ul>

<h4>Example</h4>


<h4>See also</h4>
<dd>
<a href=\"modelica://Servomechanisms.Electrical.IdealHBridge\">Servomechanisms.Electrical.IdealHBridge</a>
</dd>

</html>"), Icon(coordinateSystem(extent = {{-100,-100},{100,100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2,2}), graphics = {Ellipse(origin = {1.79696,-32.6562}, lineThickness = 1, extent = {{-10,10},{10,-10}}, endAngle = 360),Line(origin = {12.797,-32.6562}, points = {{0,0},{19,0}}, thickness = 1),Line(origin = {-28.203,-32.6562}, points = {{0,0},{19,0}}, thickness = 1),Text(origin = {2.50368,-32.3029}, extent = {{-10,10},{10,-10}}, textString = "M"),Line(origin = {1.79696,7.34378}, points = {{0,0},{30,0},{30,-20},{40,-30}}, thickness = 1),Line(origin = {1.79696,7.34378}, points = {{30,-30},{30,-60},{40,-70}}, thickness = 1),Line(origin = {1.79696,7.34378}, points = {{-30,-70},{-30,-80},{0,-80}}, thickness = 1),Line(origin = {1.79696,7.34378}, points = {{0,0},{-30,0},{-30,-20},{-40,-30}}, thickness = 1),Line(origin = {1.79696,7.34378}, points = {{-30,-30},{-30,-60},{-40,-70}}, thickness = 1),Line(origin = {1.79696,7.34378}, points = {{30,-70},{30,-80},{0,-80}}, thickness = 1),Text(origin = {44.8809,17.0372}, extent = {{28.2206,16.2633},{46.5125,5.69395}}, textString = "A", fontSize = 20),Text(origin = {43.9045,-81.1274}, extent = {{28.2206,16.2633},{46.5125,5.69395}}, textString = "B", fontSize = 20),Text(origin = {-83.8308,62.5266}, extent = {{28.2206,16.2633},{46.5125,5.69395}}, textString = "v+", fontSize = 20),Text(origin = {14.456,62.2393}, extent = {{28.2206,16.2633},{46.5125,5.69395}}, textString = "v-", fontSize = 20),Text(origin = {-99.8447,19.2971}, extent = {{28.2206,16.2633},{46.5125,5.69395}}, textString = "PWM", fontSize = 20),Text(origin = {-121.272,-81.3409}, extent = {{28.2206,16.2633},{46.5125,5.69395}}, textString = "E", fontSize = 20)}));
end HBridge;

