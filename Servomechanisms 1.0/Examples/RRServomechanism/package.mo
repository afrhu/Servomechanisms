within Servomechanisms.Examples;
package RRServomechanism
  extends Modelica.Icons.ExamplesPackage;
  annotation(Icon(coordinateSystem(extent = {{-100,-100},{100,100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2,2})), Diagram(coordinateSystem(extent = {{-100,-100},{100,100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2,2})));
  annotation(DocumentationClass = true, Documentation(info = "<html>
<head>
<style type=\"text/css\">
h4      { border-radius:8%;background-color: #D8D8D8 ;}
</style>
</head>

<h4>General</h4>
<p>
In this example a planar <strong>Rotational-Rotational (2R)</strong> servomechanism is modeled and simulated for <strong>trayectory tracking</strong>.
The aproach is <strong>Independent Joint Control</strong> to track a circle trayectory.<br>
The components of the
<a href=\"modelica://Servomechanisms\">Servomechanisms</a>
package and the
<a href=\"modelica://Modelica\">MSL</a>
are used
.
</p>

<h4>Implementation</h4>
The sequence of design is explain with the following examples:
<dd><a href=\"modelica://Servomechanisms.Examples.RRServomechanism.Data\">Data</a></dd>
<dd><a href=\"modelica://Servomechanisms.Examples.RRServomechanism.RRWorkspace\">RRWorkspace</a></dd>
<dd><a href=\"modelica://Servomechanisms.Examples.RRServomechanism.RRPositionControl\">RRPositionControl</a></dd>
</html>"));
end RRServomechanism;

