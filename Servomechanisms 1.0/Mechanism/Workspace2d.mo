within Servomechanisms.Mechanism;
block Workspace2d "2d Workspace"
  //Imports
  import Modelica.Constants.*;
  //Inheritance
  extends Modelica.Blocks.Interfaces.MO(nout = 2);
  //Icon
  extends Servomechanisms.Utilities.IconXY;
  //Parameters
  parameter Real min1 = 0 "min of variable 1";
  parameter Real max1(min = min1 + Modelica.Constants.small) = pi / 2 "max of variable 1";
  parameter Real min2 = -pi / 4 "min of variable 2";
  parameter Real max2(min = min2 + Modelica.Constants.small) = pi / 4 "max of variable 2";
  parameter Real paso1 = (max1 - min1) / 50 "increment of variable 1";
  parameter Real paso2 = (max2 - min2) / 50 "increment of variable 2";
  parameter Real tiempo = ((2 * (max2 - min2) / paso2 + 1) * (1 + (max1 - min1) / paso1)) ^ (-1) "for a duration of 1 sec leave the default value";
  //Real x;
  Boolean down(start = false);
initial equation
  y[1] = min1;
  y[2] = min2;
equation
  //x = 0;
algorithm
  when sample(tiempo, tiempo) then
      if y[2] >= max2 then 
      down:=true;
      y[1]:=pre(y[1]);
    else

    end if;
    if down then 
      y[2]:=pre(y[2]) - paso2;
    else
      y[2]:=pre(y[2]) + paso2;
    end if;
    if y[2] <= min2 - paso2 then 
      down:=false;
      y[1]:=pre(y[1]) + paso1;
      y[2]:=pre(y[2]);
    else

    end if;  
  end when;
  annotation(Diagram(coordinateSystem(extent = {{-100,-100},{100,100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2,2})));
  annotation(Documentation(info = "
<html>
<head>
<style type=\"text/css\">
h4      { border-radius:8%;background-color: #D8D8D8 ;}
</style>
</head>

<h4>General</h4>
<p>
With this component the workspace of planar 2 DOF mechanism can be obtain.
</p>

<h4>Implementation</h4>
<p>
This block generates a sweep between min1 and max1 values according to the step (paso1) for the output y[1].
For each step in y[1] a sweep fordwards and then backwards is generated for y[2] between min2 and max2 with paso2.
In this way all the combinations for two variables are included.
</p>
<h4>Notes</h4>
<ul>
<li>
The user must input the range of both joint variables and use angular or positional sources connected directly to the mechanism connectors.
(<a href=\"modelica://Modelica.Mechanics.Rotational.Sources.Position\">Modelica.Mechanics.Rotational.Sources.Position</a> or <a href=\"modelica://Modelica.Mechanics.Translational.Sources.Position\">Modelica.Mechanics.Translational.Sources.Position</a>).
</li>
<li>
The parameter <b>exact</b> in each position source should be <b>true</b> to reduce the time of simulation.
</li>
</ul>

<h4>Example</h4>
<p>
An example can be found in <a href=\"modelica://Servomechanisms.Examples.RRServomechanisms.RRWorkspace\">Servomechanisms.Examples.RRServomechanisms.RRWorkspace</a>.
</p>
<p>
The outputs using default parameters are:
</p>
<img src=\"modelica://Servomechanisms/Resources/Images/Mechanism/workspace2d.png\" alt=\"workspace2d.png\" >

</html>"));
end Workspace2d;

