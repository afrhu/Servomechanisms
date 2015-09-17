within Servomechanisms.Control;
model PIDControllerDirection
  //Inheritance
  extends Servomechanisms.Utilities.box;
  //Parameters
  parameter .Modelica.Blocks.Types.SimpleController controllerType = .Modelica.Blocks.Types.SimpleController.PID "Type of controller";
  parameter Real k(min = 0, unit = "1") = 1 "Gain of controller";
  parameter SI.Time Ti(min = Modelica.Constants.small) = 0.5 "Time constant of Integrator block" annotation(Dialog(enable = controllerType == .Modelica.Blocks.Types.SimpleController.PI or controllerType == .Modelica.Blocks.Types.SimpleController.PID));
  parameter SI.Time Td(min = 0) = 0.1 "Time constant of Derivative block" annotation(Dialog(enable = controllerType == .Modelica.Blocks.Types.SimpleController.PD or controllerType == .Modelica.Blocks.Types.SimpleController.PID));
  parameter Real yMax(start = 1) "Upper limit of output";
  parameter Real yMin = -yMax "Lower limit of output";
  parameter Real wp(min = 0) = 1 "Set-point weight for Proportional block (0..1)";
  parameter Real wd(min = 0) = 0 "Set-point weight for Derivative block (0..1)" annotation(Dialog(enable = controllerType == .Modelica.Blocks.Types.SimpleController.PD or controllerType == .Modelica.Blocks.Types.SimpleController.PID));
  parameter Real Ni(min = 100 * Modelica.Constants.eps) = 0.9 "Ni*Ti is time constant of anti-windup compensation" annotation(Dialog(enable = controllerType == .Modelica.Blocks.Types.SimpleController.PI or controllerType == .Modelica.Blocks.Types.SimpleController.PID));
  parameter Real Nd(min = 100 * Modelica.Constants.eps) = 10 "The higher Nd, the more ideal the derivative block" annotation(Dialog(enable = controllerType == .Modelica.Blocks.Types.SimpleController.PD or controllerType == .Modelica.Blocks.Types.SimpleController.PID));
  parameter .Modelica.Blocks.Types.InitPID initType = .Modelica.Blocks.Types.InitPID.DoNotUse_InitialIntegratorState "Type of initialization (1: no init, 2: steady state, 3: initial state, 4: initial output)" annotation(Evaluate = true, Dialog(group = "Initialization"));
  parameter Boolean limitsAtInit = true "= false, if limits are ignored during initialization" annotation(Evaluate = true, Dialog(group = "Initialization"));
  parameter Real xi_start = 0 "Initial or guess value value for integrator output (= integrator state)" annotation(Dialog(group = "Initialization", enable = controllerType == .Modelica.Blocks.Types.SimpleController.PI or controllerType == .Modelica.Blocks.Types.SimpleController.PID));
  parameter Real xd_start = 0 "Initial or guess value for state of derivative block" annotation(Dialog(group = "Initialization", enable = controllerType == .Modelica.Blocks.Types.SimpleController.PD or controllerType == .Modelica.Blocks.Types.SimpleController.PID));
  parameter Real y_start = 0 "Initial value of output" annotation(Dialog(enable = initType == .Modelica.Blocks.Types.InitPID.InitialOutput, group = "Initialization"));
  parameter Boolean strict = false "= true, if strict limits with noEvent(..)" annotation(Evaluate = true, choices(checkBox = true), Dialog(tab = "Advanced"));
  //parameter SI.Time T(start = 1, min = Modelica.Constants.small) "Time Constant (T>0 required)";
  //Components
  Modelica.Blocks.Logical.GreaterEqualThreshold greaterequalthreshold1 annotation(Placement(transformation(origin = {50,-50}, extent = {{-10,-10},{10,10}})));
  Modelica.Blocks.Math.Feedback feedback1 annotation(Placement(transformation(origin = {-50,-50}, extent = {{-10,-10},{10,10}})));
  Modelica.Blocks.Continuous.LimPID limpid(k = k, Ti = Ti, Td = Td, yMax = yMax, wp = wp, wd = wd, Ni = Ni, Nd = Nd, limitsAtInit = limitsAtInit, xi_start = xi_start, xd_start = xd_start, y_start = y_start, strict = strict, controllerType = controllerType, initType = initType) annotation(Placement(transformation(extent = {{-10,-10},{10,10}})));
  //Interfaces
  Modelica.Blocks.Interfaces.RealInput reference annotation(Placement(transformation(origin = {-100,0}, extent = {{-10,-10},{10,10}}), iconTransformation(origin = {-100,0}, extent = {{-10,-10},{10,10}})));
  Modelica.Blocks.Interfaces.RealOutput controlsignal annotation(Placement(transformation(origin = {100,0}, extent = {{-10,-10},{10,10}}), iconTransformation(origin = {100,0}, extent = {{-10,-10},{10,10}})));
  Modelica.Blocks.Interfaces.RealInput feedback annotation(Placement(transformation(origin = {0,-100}, extent = {{-10,-10},{10,10}}, rotation = 90), iconTransformation(origin = {0,-100}, extent = {{-10,-10},{10,10}}, rotation = 90)));
  Modelica.Blocks.Interfaces.BooleanOutput direction annotation(Placement(transformation(origin = {100,-50}, extent = {{-10,-10},{10,10}}), iconTransformation(origin = {100,-50}, extent = {{-10,-10},{10,10}})));
equation
  connect(greaterequalthreshold1.y,direction) annotation(Line(points = {{61,-50},{94.6136,-50},{94.6136,-50},{100,-50}}, pattern = LinePattern.Dash));
  connect(feedback1.u2,feedback) annotation(Line(points = {{-50,-58},{-49.8221,-58},{-49.8221,-97.5089},{0,-97.5089},{0,-100}}, pattern = LinePattern.Dash));
  connect(feedback1.y,greaterequalthreshold1.u) annotation(Line(points = {{-41,-50},{38.4342,-50},{38.4342,-50},{38,-50}}, pattern = LinePattern.Dash));
  connect(feedback1.u1,reference) annotation(Line(points = {{-58,-50},{-95.7295,-50},{-95.7295,0},{-100,0}}, pattern = LinePattern.Dash));
  connect(feedback,limpid.u_m) annotation(Line(points = {{0,-100},{0,-13.1673},{0.711744,-13.1673},{0.711744,-13.1673}}));
  connect(limpid.y,controlsignal) annotation(Line(points = {{11,0},{95.7295,0},{95.7295,-0.711744},{95.7295,-0.711744}}));
  connect(reference,limpid.u_s) annotation(Line(points = {{-100,0},{-13.1673,0},{-13.1673,0.355872},{-13.1673,0.355872}}));
  annotation(Documentation(info = "
<html>
<head>
<style type=\"text/css\">
h4      { border-radius:8%;background-color: #D8D8D8 ;}
</style>
</head>

<h4>General</h4>
<p>
This block describes the controller of a feedback system with a direction output.
</p>

<h4>Implementation</h4>
The control signal is obtain with
<a href=\"modelica://Modelica.Blocks.Continuous.LimPID\">Modelica.Blocks.Continuous.LimPID</a>
block, the direction boolean is obtain comparing the signal of the error signal.

<h4>Notes</h4>
<ul>
<li>
The user must use a reference signal value and a feedback signal (real values).
</li>
</ul>

</html>"), Icon(coordinateSystem(extent = {{-100,-100},{100,100}}, preserveAspectRatio = true, grid = {2,2}), graphics = {Text(origin = {-6.89046,5.65371}, extent = {{-56.3604,56.1837},{56.3604,-56.1837}}, textString = "PID+DIR")}));
end PIDControllerDirection;

