within Servomechanisms.Examples;
model MotorControl
  extends Modelica.Icons.Example;
  parameter Real k = 10 "Gain";
  Servomechanisms.Control.Controller controller1(controllerType = .Modelica.Blocks.Types.SimpleController.PI, k = 1, yMax = 100, Ti = 0.05) annotation(Placement(visible = true, transformation(origin = {-38.1625,13.7809}, extent = {{-10,-10},{10,10}}, rotation = 0)));
  Modelica.Blocks.Sources.Step step1(height = 700) annotation(Placement(visible = true, transformation(origin = {-74.4648,14.0515}, extent = {{-10,-10},{10,10}}, rotation = 0)));
  Servomechanisms.Electrical.IdealHBridge idealhbridge1 annotation(Placement(visible = true, transformation(origin = {-0.188679,13.2297}, extent = {{-10,-10},{10,10}}, rotation = 0)));
  Servomechanisms.Electrical.DCSource dcsource1(V = 48, R = 1) annotation(Placement(visible = true, transformation(origin = {-1.29013,41.8111}, extent = {{-10,-10},{10,10}}, rotation = 0)));
  Servomechanisms.Electrical.IdealDCMotor idealdcmotor1 annotation(Placement(visible = true, transformation(origin = {29.5082,13.1148}, extent = {{-10,-10},{10,10}}, rotation = 0)));
equation
  connect(idealdcmotor1.speed,controller1.realinput1) annotation(Line(points = {{34.5082,3.11475},{35.1288,3.11475},{35.1288,-15.9251},{-38.4075,-15.9251},{-38.4075,4.21546},{-38.4075,4.21546}}));
  connect(idealhbridge1.MotorB,idealdcmotor1.pin_n) annotation(Line(points = {{9.81132,8.2297},{20.6089,8.2297},{20.6089,7.49415},{19.6721,7.49415},{19.6721,7.49415}}));
  connect(idealhbridge1.MotorA,idealdcmotor1.pin_p) annotation(Line(points = {{9.81132,18.2297},{20.1405,18.2297},{20.1405,18.267},{20.1405,18.267}}));
  connect(dcsource1.pin_p,idealhbridge1.Vpos) annotation(Line(points = {{-6.29013,31.8111},{-5.65376,31.8111},{-5.65376,23.3215},{-5.65376,23.3215}}));
  connect(dcsource1.pin_n,idealhbridge1.Vneg) annotation(Line(points = {{3.70987,31.8111},{5.65371,31.8111},{5.65371,23.675},{4.94699,22.9682}}));
  connect(controller1.booleanoutput1,idealhbridge1.ENABLE) annotation(Line(points = {{-27.8112,8.48816},{-10.9541,8.48816},{-10.9541,8.12721},{-10.9541,8.12721}}));
  connect(controller1.y,idealhbridge1.PWM) annotation(Line(points = {{-27.7175,18.7926},{-10.9541,18.7926},{-10.9541,18.0212},{-10.9541,18.0212}}));
  connect(step1.y,controller1.u) annotation(Line(points = {{-63.4648,14.0515},{-47.3498,14.0515},{-47.3498,13.4276},{-47.3498,13.4276}}));
end MotorControl;

