within Servomechanisms.Utilities;

partial class MotorIcon
  "This icon will be removed in future Modelica versions."
  // extends Modelica.Icons.ObsoleteModel;

  annotation (             Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,100}}), graphics={
        Rectangle(
          lineColor={82,0,2},
          fillColor={252,37,57},
          fillPattern=FillPattern.HorizontalCylinder,
          extent={{-100.0,-50.0},{30.0,50.0}},
          radius=10.0),
        Polygon(
          fillColor={64,64,64},
          fillPattern=FillPattern.Solid,
          points={{-100.0,-90.0},{-90.0,-90.0},{-60.0,-20.0},{-10.0,-20.0},{20.0,-90.0},{30.0,-90.0},{30.0,-100.0},{-100.0,-100.0},{-100.0,-90.0}}),
        Rectangle(
          lineColor={64,64,64},
          fillColor={255,255,255},
          fillPattern=FillPattern.HorizontalCylinder,
          extent={{30.0,-10.0},{90.0,10.0}})}),
    Documentation(info="<html>
<p>
This icon of an <b>electrical motor</b> model will be removed in future versions of the library. Please use a locally defined icon in your user defined libraries and applications.
</p>
</html>"));
end MotorIcon;
