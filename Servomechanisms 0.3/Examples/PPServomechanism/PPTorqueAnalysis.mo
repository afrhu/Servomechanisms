within Servomechanisms.Examples.PPServomechanism;
model PPTorqueAnalysis
  extends Modelica.Icons.Example;
  extends Servomechanisms.Examples.PPServomechanism.Data;
  Modelica.Blocks.Math.Gain gain1(k = ratio1) annotation(Placement(visible = true, transformation(origin = {-51.7073,-37.0732}, extent = {{-10,-10},{10,10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain2(k = ratio2) annotation(Placement(visible = true, transformation(origin = {-49.7561,25.3659}, extent = {{-10,-10},{10,10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sources.Position position1 annotation(Placement(visible = true, transformation(origin = {-13.6585,26.3415}, extent = {{-10,-10},{10,10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sources.Position position2 annotation(Placement(visible = true, transformation(origin = {-18.5366,-37.0732}, extent = {{-10,-10},{10,10}}, rotation = 0)));
  Servomechanisms.Mechanism.TorqueAnalysis torqueanalysis2(f = 1 / 30) annotation(Placement(visible = true, transformation(origin = {17.561,25.8537}, extent = {{-10,-10},{10,10}}, rotation = 0)));
  Servomechanisms.Mechanism.TorqueAnalysis torqueanalysis1(f = 1 / 30) annotation(Placement(visible = true, transformation(origin = {14.6341,-38.0488}, extent = {{-10,-10},{10,10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.IdealGearR2T idealgearr2t2(ratio = ratio1) annotation(Placement(visible = true, transformation(origin = {48.7805,-38.0488}, extent = {{-10,-10},{10,10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.IdealGearR2T idealgearr2t1(ratio = ratio2) annotation(Placement(visible = true, transformation(origin = {47.3171,26.3415}, extent = {{-10,-10},{10,10}}, rotation = 0)));
  Servomechanisms.Mechanism.PP pp1(length1 = l1, width1 = w1, height1 = h1, density1 = d1, length2 = l2, width2 = w2, height2 = h2, density2 = d2) annotation(Placement(visible = true, transformation(origin = {84.878,-4.87805}, extent = {{-10,-10},{10,10}}, rotation = 0)));
  Servomechanisms.Mechanism.ForceAnalysis forceanalysis1(f = 1 / 30) annotation(Placement(visible = true, transformation(origin = {73.8516,-40.2827}, extent = {{-10,-10},{10,10}}, rotation = 0)));
  Servomechanisms.Mechanism.ForceAnalysis forceanalysis2(f = 1 / 30) annotation(Placement(visible = true, transformation(origin = {74.417,26.7138}, extent = {{-10,-10},{10,10}}, rotation = 0)));
  Servomechanisms.Control.CircleTrayectory circletrayectory1(r = r, xc = xc, yc = yc, paso = 2 * 3.1415 / 30) annotation(Placement(visible = true, transformation(origin = {-126.073,-1.59786}, extent = {{-10,-10},{10,10}}, rotation = 0)));
  Servomechanisms.Control.PPInverseKinematics ppinversekinematics1(l1 = l1, l2 = l2) annotation(Placement(visible = true, transformation(origin = {-87.8049,-1.46341}, extent = {{-10,-10},{10,10}}, rotation = 0)));
equation
  connect(ppinversekinematics1.y[2],gain2.u) annotation(Line(points = {{-76.8049,-1.46341},{-62.9268,-1.46341},{-62.9268,24.878},{-62.9268,24.878}}));
  connect(ppinversekinematics1.y[1],gain1.u) annotation(Line(points = {{-76.8049,-1.46341},{-72.1951,-1.46341},{-72.1951,-38.0488},{-65.3659,-38.0488},{-65.3659,-38.0488}}));
  connect(circletrayectory1.y[2],ppinversekinematics1.u[2]) annotation(Line(points = {{-115.073,-1.59786},{-100.976,-1.59786},{-100.976,-3.41463},{-100.976,-3.41463}}));
  connect(circletrayectory1.y[1],ppinversekinematics1.u[1]) annotation(Line(points = {{-115.073,-1.59786},{-100.976,-1.59786},{-100.976,-1.95122},{-100.976,-1.95122}}));
  connect(forceanalysis1.flange_a,idealgearr2t2.flangeT) annotation(Line(points = {{63.8516,-40.2827},{59.364,-40.2827},{59.364,-37.8092},{59.364,-37.8092}}));
  connect(forceanalysis1.flange_b,pp1.flange_a1) annotation(Line(points = {{83.8516,-40.2827},{94.3463,-40.2827},{94.3463,-20.4947},{74.9117,-20.4947},{74.9117,-13.4276},{74.9117,-13.4276}}));
  connect(forceanalysis2.flange_b,pp1.flange_a) annotation(Line(points = {{84.417,26.7138},{87.9859,26.7138},{87.9859,4.59364},{87.9859,4.59364}}));
  connect(idealgearr2t1.flangeT,forceanalysis2.flange_a) annotation(Line(points = {{57.3171,26.3415},{64.311,26.3415},{64.311,26.1484},{64.311,26.1484}}));
  connect(torqueanalysis2.flange_b,idealgearr2t1.flangeR) annotation(Line(points = {{27.561,25.8537},{37.561,25.8537},{37.561,26.3415},{37.561,26.3415}}));
  connect(torqueanalysis1.flange_b,idealgearr2t2.flangeR) annotation(Line(points = {{24.6341,-38.0488},{39.5122,-38.0488},{39.5122,-38.0488},{39.5122,-38.0488}}));
  connect(position1.flange,torqueanalysis2.flange_a) annotation(Line(points = {{-3.65854,26.3415},{7.31707,26.3415},{7.31707,25.8537},{7.31707,25.8537}}));
  connect(position2.flange,torqueanalysis1.flange_a) annotation(Line(points = {{-8.53659,-37.0732},{4.39024,-37.0732},{4.39024,-39.0244},{4.39024,-39.0244}}));
  connect(gain2.y,position1.phi_ref) annotation(Line(points = {{-38.7561,25.3659},{-26.3415,25.3659},{-26.3415,26.8293},{-26.3415,26.8293}}));
  connect(gain1.y,position2.phi_ref) annotation(Line(points = {{-40.7073,-37.0732},{-32.1951,-37.0732},{-32.1951,-37.0732},{-32.1951,-37.0732}}));
  annotation(Icon(coordinateSystem(extent = {{-100,-100},{100,100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2,2})), Diagram(coordinateSystem(extent = {{-100,-100},{100,100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2,2})), experiment(StartTime = 0, StopTime = 60, Tolerance = 0.000001));
end PPTorqueAnalysis;

