within Servomechanisms.Electrical;
block SignMagnitudDrive "Sign-Magnitud Drive"
  //Icon
  extends Modelica.Blocks.Icons.BooleanBlock;
  //Parameters
  //Components
  Modelica.Blocks.Logical.Not not1 annotation(Placement(transformation(origin = {-50,25}, extent = {{-10,-10},{10,10}})));
  Modelica.Blocks.Logical.Not not2 annotation(Placement(transformation(origin = {-50,-25}, extent = {{-10,-10},{10,10}})));
  //Interfaces
  Modelica.Blocks.Interfaces.BooleanInput PWM annotation(Placement(transformation(origin = {-100,50}, extent = {{-10,-10},{10,10}}), iconTransformation(origin = {-100,50}, extent = {{-10,-10},{10,10}})));
  Modelica.Blocks.Interfaces.BooleanInput ENABLE annotation(Placement(transformation(origin = {-100,-50}, extent = {{-10,-10},{10,10}}), iconTransformation(origin = {-100,-50}, extent = {{-10,-10},{10,10}})));
  Modelica.Blocks.Interfaces.BooleanOutput o1 annotation(Placement(transformation(origin = {100,75}, extent = {{-10,-10},{10,10}}), iconTransformation(origin = {100,75}, extent = {{-10,-10},{10,10}})));
  Modelica.Blocks.Interfaces.BooleanOutput o2 annotation(Placement(transformation(origin = {100,25}, extent = {{-10,-10},{10,10}}), iconTransformation(origin = {100,25}, extent = {{-10,-10},{10,10}})));
  Modelica.Blocks.Interfaces.BooleanOutput o3 annotation(Placement(transformation(origin = {100,-25}, extent = {{-10,-10},{10,10}}), iconTransformation(origin = {100,-25}, extent = {{-10,-10},{10,10}})));
  Modelica.Blocks.Interfaces.BooleanOutput o4 annotation(Placement(transformation(origin = {100,-75}, extent = {{-10,-10},{10,10}}), iconTransformation(origin = {100,-75}, extent = {{-10,-10},{10,10}})));
  Modelica.Blocks.Logical.And and1 annotation(Placement(transformation(origin = {60.1093,72.8597}, extent = {{-10,-10},{10,10}})));
  Modelica.Blocks.Logical.Or or1 annotation(Placement(transformation(origin = {60.4736,26.9581}, extent = {{-10,-10},{10,10}})));
  Modelica.Blocks.Logical.Or or2 annotation(Placement(transformation(origin = {61.9308,-74.6812}, extent = {{-10,-10},{10,10}})));
  Modelica.Blocks.Logical.And and2 annotation(Placement(transformation(origin = {61.8944,-26.2659}, extent = {{-10,-10},{10,10}})));
  Modelica.Blocks.Logical.And and3 annotation(Placement(transformation(origin = {6.15665,26.5574}, extent = {{-10,-10},{10,10}})));
  Modelica.Blocks.Logical.And and4 annotation(Placement(transformation(origin = {6.84882,-75.847}, extent = {{-10,-10},{10,10}})));
equation
  connect(or2.y,o4) annotation(Line(points = {{72.9308,-74.6812},{90.7104,-74.6812},{90.7104,-74.6812},{90.7104,-74.6812}}));
  connect(and2.y,o3) annotation(Line(points = {{72.8944,-26.2659},{95.4463,-26.2659},{95.4463,-24.0437},{95.4463,-24.0437}}));
  connect(or1.y,o2) annotation(Line(points = {{71.4736,26.9581},{91.8033,26.9581},{91.8033,26.9581},{91.8033,26.9581}}));
  connect(and1.y,o1) annotation(Line(points = {{71.1093,72.8597},{92.5319,72.8597},{92.5319,73.9526},{92.5319,73.9526}}));
  connect(and4.y,or2.u2) annotation(Line(points = {{17.8488,-75.847},{21.8579,-75.847},{21.8579,-82.3315},{49.5446,-82.3315},{49.5446,-82.3315}}));
  connect(not1.y,or2.u1) annotation(Line(points = {{-39,25},{-29.1439,25},{-29.1439,-19.3078},{31.694,-19.3078},{31.694,-75.4098},{48.816,-75.4098},{48.816,-75.4098}}));
  connect(ENABLE,and4.u2) annotation(Line(points = {{-100,-50},{-52.0947,-50},{-52.0947,-83.7887},{-6.55738,-83.7887},{-6.55738,-83.7887}}));
  connect(PWM,and4.u1) annotation(Line(points = {{-100,50},{-16.3934,50},{-16.3934,-75.7741},{-5.46448,-75.7741},{-5.46448,-75.7741}}));
  connect(PWM,and2.u1) annotation(Line(points = {{-100,50},{38.98,50},{38.98,-25.8652},{49.1803,-25.8652},{49.1803,-25.8652}}));
  connect(not2.y,and2.u2) annotation(Line(points = {{-39,-25},{29.1439,-25},{29.1439,-34.6084},{49.5446,-34.6084},{49.5446,-34.6084}}));
  connect(and3.y,or1.u1) annotation(Line(points = {{17.1566,26.5574},{46.9945,26.5574},{46.9945,26.5938},{46.9945,26.5938}}));
  connect(not1.y,or1.u2) annotation(Line(points = {{-39,25},{-26.2295,25},{-26.2295,11.2933},{48.0874,11.2933},{48.0874,18.9435},{48.0874,18.9435}}));
  connect(PWM,and3.u1) annotation(Line(points = {{-100,50},{-6.19308,50},{-6.19308,27.3224},{-6.19308,27.3224}}));
  connect(not2.y,and3.u2) annotation(Line(points = {{-39,-25},{-6.92168,-25},{-6.92168,18.2149},{-6.92168,18.2149}}));
  connect(ENABLE,and1.u2) annotation(Line(points = {{-100,-50},{20.765,-50},{20.765,64.4809},{47.7231,64.4809},{47.7231,64.4809}}));
  connect(and1.u1,PWM) annotation(Line(points = {{48.1093,72.8597},{-96.1749,72.8597},{-96.1749,50.2732},{-96.1749,50.2732}}));
  connect(not2.u,ENABLE) annotation(Line(points = {{-62,-25},{-95.8106,-25},{-95.8106,-49.5446},{-95.8106,-49.5446}}));
  connect(not1.u,PWM) annotation(Line(points = {{-62,25},{-96.1749,25},{-96.1749,50.2732},{-96.1749,50.2732}}));
  annotation( Icon(coordinateSystem(extent = {{-100,-100},{100,100}}, preserveAspectRatio = true, grid = {2,2}), graphics = {Text(origin = {69.4346,77.9152}, extent = {{-13.6042,12.8975},{13.6042,-12.8975}}, textString = "o1", fontSize = 20),Text(origin = {69.6466,27.5972}, extent = {{-13.6042,12.8975},{13.6042,-12.8975}}, textString = "o2", fontSize = 20),Text(origin = {72.6855,-23.0742}, extent = {{-13.6042,12.8975},{13.6042,-12.8975}}, textString = "o3", fontSize = 20),Text(origin = {71.8375,-74.4523}, extent = {{-13.6042,12.8975},{13.6042,-12.8975}}, textString = "o4", fontSize = 20),Text(origin = {-53.0389,52.6148}, extent = {{-13.6042,12.8975},{13.6042,-12.8975}}, textString = "PWM", fontSize = 20),Text(origin = {-36.9258,-49.2933}, extent = {{-13.6042,12.8975},{13.6042,-12.8975}}, textString = "ENABLE", fontSize = 20)}));
  annotation(Documentation(info = "<html>
<head>
<style type=\"text/css\">
h4      { border-radius:8%;background-color: #D8D8D8 ;}
</style>
</head>

<h4>General</h4>
<p>
The <b>SignMagnitudDrive</b> boolean block is used as a method to
control the h-bridge with the inputs of PWM and ENABLE (or direction)
comming from the controller. Is the model of the method sign-magnitud.
</p>

<h4>Implementation</h4>
<p>
This block uses low-side off-time current, the generation of the outputs are
based on the expressions:
</p>
<pre>
O1: PWM*ENABLE <br>
O2: PWM'+PWM*ENABLE' <br>
O3: PWM*ENABLE'<br>
O4: PWM'+PWM*ENABLE
</pre>

<h4>Notes</h4>
<ul>
<li>
The outputs should be connected to the h-bridge as: O1-Q1, O2-Q2, O3-Q3, O4-Q4.
</li>
</ul>

<h4>Limitations</h4>
<ul>
<li>
The characteristics of Sign-Magnitud method could generate regenerative braking.
</li>
</ul>

<h4>Example</h4>
<a href=\"modelica://Servomechanisms.Electrical.HBridge\">Servomechanisms.Electrical.HBridge</a>
<a href=\"modelica://Servomechanisms.Electrical.IdealHBridge\">Servomechanisms.Electrical.IdealHBridge</a>



</html>"));
end SignMagnitudDrive;

