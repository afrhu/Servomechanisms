within Servomechanisms.Electrical;
block BooleanPulse "Generate pulse signal of type Boolean"
  //parameter Real width(final min = Modelica.Constants.small, final max = 100) = 50 "Width of pulse in % of period";
  parameter Modelica.Units.SI.Time period(final min = Modelica.Constants.small, start = 1) "Time for one period";
  parameter Modelica.Units.SI.Time startTime = 0 "Time instant of first pulse";
  extends Modelica.Blocks.Interfaces.partialBooleanSource;
  Modelica.Blocks.Interfaces.RealInput u annotation(Placement(visible = true, transformation(origin = {-108.665,5.62061}, extent = {{-10,-10},{10,10}}, rotation = 0), iconTransformation(origin = {-100,0}, extent = {{-10,-10},{10,10}}, rotation = 0)));
protected
  Modelica.Units.SI.Time Twidth = period * u / 100 "width of one pulse" annotation(HideResult = true);
  discrete Modelica.Units.SI.Time pulsStart "Start time of pulse" annotation(HideResult = true);
initial equation
  pulsStart = startTime;
equation
  when sample(startTime, period) then
      pulsStart = time;
  
  end when;
  y = time >= pulsStart and time < pulsStart + Twidth;
  annotation(Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}), graphics = {Text(extent = {{-150,-140},{150,-110}}, lineColor = {0,0,0}, textString = "%period"),Line(points = {{-80,-70},{-40,-70},{-40,44},{0,44},{0,-70},{40,-70},{40,44},{79,44}}, color = {0,0,0})}), Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}), graphics = {Text(extent = {{-60,-74},{-19,-82}}, lineColor = {0,0,0}, textString = "startTime"),Line(points = {{-78,-70},{-40,-70},{-40,20},{20,20},{20,-70},{50,-70},{50,20},{100,20}}, color = {0,0,255}, thickness = 0.5),Line(points = {{-40,61},{-40,21}}, color = {95,95,95}),Line(points = {{20,44},{20,20}}, color = {95,95,95}),Line(points = {{50,58},{50,20}}, color = {95,95,95}),Line(points = {{-40,53},{50,53}}, color = {95,95,95}),Line(points = {{-40,35},{20,35}}, color = {95,95,95}),Text(extent = {{-30,65},{16,55}}, lineColor = {0,0,0}, textString = "period"),Text(extent = {{-33,47},{14,37}}, lineColor = {0,0,0}, textString = "width"),Line(points = {{-70,20},{-41,20}}, color = {95,95,95}),Polygon(points = {{-40,35},{-31,37},{-31,33},{-40,35}}, lineColor = {95,95,95}, fillColor = {95,95,95}, fillPattern = FillPattern.Solid),Polygon(points = {{20,35},{12,37},{12,33},{20,35}}, lineColor = {95,95,95}, fillColor = {95,95,95}, fillPattern = FillPattern.Solid),Polygon(points = {{-40,53},{-31,55},{-31,51},{-40,53}}, lineColor = {95,95,95}, fillColor = {95,95,95}, fillPattern = FillPattern.Solid),Polygon(points = {{50,53},{42,55},{42,51},{50,53}}, lineColor = {95,95,95}, fillColor = {95,95,95}, fillPattern = FillPattern.Solid),Text(extent = {{-95,26},{-66,17}}, lineColor = {0,0,0}, textString = "true"),Text(extent = {{-96,-60},{-75,-69}}, lineColor = {0,0,0}, textString = "false")}), Documentation(info = "<html>
<head>
<style type=\"text/css\">
h4      { border-radius:8%;background-color: #D8D8D8 ;}
</style>
</head>

<h4>General</h4>
<p>
This block is a modified version from Modelica library block to
accept a real input as the pulse width value.
</p>

<p>
The Boolean output y is a pulse signal:
</p>

<p>
<img src=\"modelica://Modelica/Resources/Images/Blocks/Sources/Pulse.png\"
     alt=\"Pulse.png\">
</p>
</html>"));
end BooleanPulse;

