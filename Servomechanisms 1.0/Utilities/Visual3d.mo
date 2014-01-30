within Servomechanisms.Utilities;
partial record Visual3d
  //import ModelicaServices.Modelica3D;
  //inner ModelicaServices.Modelica3D.Controller m3d_control;
  annotation(Documentation(info = "<html> 
<head>
<style type=\"text/css\">
h4      { border-radius:8%;background-color: #D8D8D8 ;}
</style>
</head>

<h4>General</h4>
<p>
This element is implemented to allow 3d visualization using library Modelica3D.
</p>

<h4>Implementation</h4>
<p>
It uses declaration according to the Modelica3D library.
<p>

<h4>Notes</h4>
<ul>

<li>
To use this library you must:
<ol>
<li> Use and old version of OpenModelica that includes Modelica3D and Python file dbus-server.py. For example
<a href=\"https://build.openmodelica.org/omc/builds/windows/releases/1.9.0/RC1/\">OpenModelica-1.9.0-RC1-revision-17414</a>  
</li>
<li>
Remove or change the name of any library in Modelica directory that stars with <em>ModelicaServices</em> except for <em>ModelicaServices 3.2.1 modelica3d</em>.
</li>
<li> Follow the instructions of OpenModelica User's Guide section 11.1:<br>
<em>In order to run Modelica3D on windows you need following softwares; 
•  Python – Install python from http://www.python.org/download/. Python2.7.3 is recommended. 
•  PyGTK  –  Install  GTK+  for  python  from 
http://ftp.gnome.org/pub/GNOME/binaries/win32/pygtk/2.24/.  Download  the  all-in-one  package. 
Recommmended is pygtk-all-in-one-2.24.2.win32-py2.7.msi. 
Run  the  Modelica3D  server  by  executing  the  dbus-server.py  script  located  at 
OPENMODELICAHOME/lib/omlibrary-modelica3d/osg-gtk. 
python dbus-server.py 
This will start the Modelica3D server and on success you should see the output, 
Running dbus-server... 
</em>
</li>
<li>
Uncomment the code in this class and save:<br>
<pre>
import ModelicaServices.Modelica3D;
inner ModelicaServices.Modelica3D.Controller m3d_control;
</pre>
</li>
<li>
Add the next code in your class and (with dbus_server.py opened) simulate.
</li>
<pre>
extends Servomechanisms.Utilities.Visual3d;
</pre>
</li>
</ol>
</li>
<li>
It is expected that in the future the 3d capability will be integrated in OpenModelica and this class would not be necessary.
</li>
</ul>

<h4>Example</h4>
<p>
An example of usage with step input, inertial load and default parameters: 
</p>
<p>RR elbow down</p>
<img src=\"modelica://Servomechanisms/Resources/Images/Examples/3drr.png\" alt=\"3drr.png\" style=\"height:70%;\">
<p>RR elbow up</p>
<img src=\"modelica://Servomechanisms/Resources/Images/Examples/3drrup.png\" alt=\"3drr.png\" style=\"height:70%;\">
<p>PR</p>
<img src=\"modelica://Servomechanisms/Resources/Images/Examples/3dpr.png\" alt=\"3drr.png\" style=\"height:70%;\">

</html>"));
end Visual3d;

