within Servomechanisms.Examples.RPServomechanism;
model RPTorqueAnalysis
  extends Modelica.Icons.Example;
  extends Servomechanisms.Examples.RPServomechanism.Data;
  Modelica.Mechanics.Rotational.Sources.Position positionR annotation(Placement(visible = true, transformation(origin = {-21.2014,-39.576}, extent = {{-10,-10},{10,10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain2(k = ratio1) annotation(Placement(visible = true, transformation(origin = {-53.3569,-40.2827}, extent = {{-10,-10},{10,10}}, rotation = 0)));
  Servomechanisms.Mechanism.TorqueAnalysis torqueanalysisMR(f = 1 / 50) annotation(Placement(visible = true, transformation(origin = {14.841,-41.6961}, extent = {{-10,-10},{10,10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain1(k = ratio2) annotation(Placement(visible = true, transformation(origin = {-55.8304,30.0353}, extent = {{-10,-10},{10,10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sources.Position positionP annotation(Placement(visible = true, transformation(origin = {-21.5548,31.0954}, extent = {{-10,-10},{10,10}}, rotation = 0)));
  Servomechanisms.Mechanism.TorqueAnalysis torqueanalysisR(f = 1 / 50) annotation(Placement(visible = true, transformation(origin = {73.0035,-41.1307}, extent = {{-10,-10},{10,10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.IdealGear idealgear1(ratio = ratio1) annotation(Placement(visible = true, transformation(origin = {44.8763,-40.9894}, extent = {{-10,-10},{10,10}}, rotation = 0)));
  Servomechanisms.Mechanism.TorqueAnalysis torqueanalysisMP(f = 1 / 50) annotation(Placement(visible = true, transformation(origin = {11.1661,32.0141}, extent = {{-10,-10},{10,10}}, rotation = 0)));
  Servomechanisms.Mechanism.ForceAnalysis forceanalysisP(f = 1 / 50) annotation(Placement(visible = true, transformation(origin = {64.311,31.4488}, extent = {{-10,-10},{10,10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.IdealGearR2T idealgearr2t1(ratio = ratio2) annotation(Placement(visible = true, transformation(origin = {36.7491,32.1555}, extent = {{-10,-10},{10,10}}, rotation = 0)));
  Servomechanisms.Mechanism.RP rp1(length1 = l1, width1 = w1, height1 = h1, density1 = d1, length2 = l2, width2 = w2, height2 = h2, density2 = d2) annotation(Placement(visible = true, transformation(origin = {72.7915,1.76678}, extent = {{-10,-10},{10,10}}, rotation = 0)));
  Servomechanisms.Control.RPInversekinematics rpinversekinematics1(l1 = l1, l2 = l2) annotation(Placement(visible = true, transformation(origin = {-88.6926,-1.41343}, extent = {{-10,-10},{10,10}}, rotation = 0)));
  Servomechanisms.Control.FlowerTrayectory flowertrayectory1(a = a, b = b, xc = xc, yc = yc) annotation(Placement(visible = true, transformation(origin = {-146.831,-1.76678}, extent = {{-10,-10},{10,10}}, rotation = 0)));
equation
  connect(flowertrayectory1.y[2],rpinversekinematics1.u[2]) annotation(Line(points = {{-135.831,-1.76678},{-102.108,-1.76678},{-102.108,-1.87354},{-102.108,-1.87354}}));
  connect(flowertrayectory1.y[1],rpinversekinematics1.u[1]) annotation(Line(points = {{-135.831,-1.76678},{-101.639,-1.76678},{-101.639,-0.468384},{-101.639,-0.468384}}));
  connect(gain2.u,rpinversekinematics1.y[1]) annotation(Line(points = {{-65.3569,-40.2827},{-77.7385,-40.2827},{-77.7385,-1.76678},{-77.7385,-1.76678}}));
  connect(rpinversekinematics1.y[2],gain1.u) annotation(Line(points = {{-77.6926,-1.41343},{-69.258,-1.41343},{-69.258,30.0353},{-67.8304,30.0353}}));
  connect(rpinversekinematics1.y[2],gain1.u) annotation(Line(points = {{-77.6926,-1.41343},{-69.258,-1.41343},{-69.258,30.3887},{-69.258,30.3887}}));
  connect(forceanalysisP.flange_b,rp1.flange_2) annotation(Line(points = {{74.311,31.4488},{93.2862,31.4488},{93.2862,4.947},{74.5583,4.947},{74.5583,4.947}}));
  connect(torqueanalysisR.flange_b,rp1.flange_1) annotation(Line(points = {{83.0035,-41.1307},{91.8728,-41.1307},{91.8728,-13.7809},{65.0177,-13.7809},{65.0177,-4.24028},{65.0177,-4.24028}}));
  connect(idealgearr2t1.flangeT,forceanalysisP.flange_a) annotation(Line(points = {{46.7491,32.1555},{54.7703,32.1555},{54.7703,31.4488},{54.7703,31.4488}}));
  connect(torqueanalysisMP.flange_b,idealgearr2t1.flangeR) annotation(Line(points = {{21.1661,32.0141},{26.5018,32.0141},{26.5018,32.5088},{26.5018,32.5088}}));
  connect(gain1.y,positionP.phi_ref) annotation(Line(points = {{-44.8304,30.0353},{-34.2756,30.0353},{-34.2756,30.3887},{-34.2756,30.3887}}));
  connect(positionP.flange,torqueanalysisMP.flange_a) annotation(Line(points = {{-11.5548,31.0954},{1.06007,31.0954},{1.06007,32.1555},{1.06007,32.1555}}));
  connect(idealgear1.flange_b,torqueanalysisR.flange_a) annotation(Line(points = {{54.8763,-40.9894},{62.5442,-40.9894},{62.5442,-42.0495},{62.5442,-42.0495}}));
  connect(torqueanalysisMR.flange_b,idealgear1.flange_a) annotation(Line(points = {{24.841,-41.6961},{35.3357,-41.6961},{35.3357,-41.6961},{35.3357,-41.6961}}));
  connect(positionR.flange,torqueanalysisMR.flange_a) annotation(Line(points = {{-11.2014,-39.576},{4.947,-39.576},{4.947,-41.6961},{4.947,-41.6961}}));
  connect(gain2.y,positionR.phi_ref) annotation(Line(points = {{-42.3569,-40.2827},{-34.2756,-40.2827},{-34.2756,-40.2827},{-34.2756,-40.2827}}));
  annotation(experiment(StartTime = 0, StopTime = 100, Tolerance = 0.000001));
end RPTorqueAnalysis;

