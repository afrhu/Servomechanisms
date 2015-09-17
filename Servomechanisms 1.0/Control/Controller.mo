within Servomechanisms.Control;
block Controller "Controller"
  //Inheritance
  extends Modelica.Icons.Package;
  extends Servomechanisms.Utilities.box;
  //Parameters
  parameter SI.Frequency frequency = 1000 "Frequency of PWM" annotation(Dialog(group = "PWM Parameters"));
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
  //Interfaces
  Modelica.Blocks.Interfaces.RealInput reference annotation(Placement(transformation(origin = {-100,0}, extent = {{-10,-10},{10,10}}), iconTransformation(origin = {-100,0}, extent = {{-10,-10},{10,10}})));
  Modelica.Blocks.Interfaces.RealInput feedback annotation(Placement(transformation(origin = {0,-100}, extent = {{-10,-10},{10,10}}, rotation = 90), iconTransformation(origin = {0,-100}, extent = {{-10,10},{10,-10}}, rotation = 90)));
  Modelica.Blocks.Interfaces.BooleanOutput pwm annotation(Placement(transformation(origin = {100,50}, extent = {{-10,-10},{10,10}}), iconTransformation(origin = {100,50}, extent = {{-10,-10},{10,10}})));
  Modelica.Blocks.Interfaces.BooleanOutput direction annotation(Placement(transformation(origin = {100,-50}, extent = {{-10,-10},{10,10}}), iconTransformation(origin = {100,-50}, extent = {{-10,-10},{10,10}})));
  //Components
  Servomechanisms.Electrical.IdealPWM idealpwm1(k = yMax, frequency = frequency) annotation(Placement(transformation(origin = {50,0}, extent = {{-10,-10},{10,10}})));
  Servomechanisms.Control.PIDControllerDirection pidcontrollerdirection1(controllerType = controllerType, k = k, Ti = Ti, Td = Td, yMax = yMax, wp = wp, wd = wd, Ni = Ni, Nd = Nd, initType = initType, limitsAtInit = limitsAtInit, xi_start = xi_start, xd_start = xd_start, y_start = y_start, strict = strict) annotation(Placement(transformation(extent = {{-10,-10},{10,10}})));
equation
  connect(feedback,pidcontrollerdirection1.feedback) annotation(Line(points = {{0,-100},{0,-9.36768},{0,-9.36768},{0,-9.36768}}));
  connect(reference,pidcontrollerdirection1.reference) annotation(Line(points = {{-100,0},{-11.2412,0},{-11.2412,0.468384},{-11.2412,0.468384}}));
  connect(pidcontrollerdirection1.controlsignal,idealpwm1.u) annotation(Line(points = {{10,0},{40.7494,0},{40.7494,-0.936768},{40.7494,-0.936768}}));
  connect(direction,pidcontrollerdirection1.direction) annotation(Line(points = {{100,-50},{9.36768,-50},{9.36768,-5.62061},{9.36768,-5.62061}}));
  connect(idealpwm1.y,pwm) annotation(Line(points = {{60,0},{93.6396,0},{93.6396,48.7633},{93.6396,48.7633}}));
  annotation(Documentation(info = "
<html>
<head>
<style type=\"text/css\">
h4      { border-radius:8%;background-color: #D8D8D8 ;}
</style>
</head>

<h4>General</h4>
<p>
This block describes the controller of a feedback (selectable PID) system for velocity and position control using PWM and direction.
</p>

<h4>Implementation</h4>
With the error signal the direction is established and the control signal with the
<a href=\"modelica://Servomechanisms.Control.PIDControllerDirection\">Servomechanisms.Control.PIDControllerDirection</a>
block, this are boolean PWM and direction outputs.

<h4>Notes</h4>
<ul>
<li>
The user must use a reference signal value and a feedback signal (real values).
</li>
</ul>

</html>"), Icon(coordinateSystem(extent = {{-100,-100},{100,100}}, preserveAspectRatio = false, grid = {2,2}), graphics = {Text(extent = {{-80,50},{80,-50}}, textString = "Controller")}));
end Controller;

