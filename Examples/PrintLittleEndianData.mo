within EndianIssue.Examples;
model PrintLittleEndianData
  Components.PrintMessageBE PrintMessageBE1 annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={0,-50})));
  Modelica_DeviceDrivers.Blocks.Packaging.SerialPackager.Packager packager1
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={0,50})));
  Modelica_DeviceDrivers.Blocks.Packaging.SerialPackager.AddReal addReal(nu=1,
      byteOrder=Modelica_DeviceDrivers.Utilities.Types.ByteOrder.LE)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Sources.RealExpression realExpression1(y=1.0)
    annotation (Placement(transformation(extent={{-48,-10},{-28,10}})));
  Modelica_DeviceDrivers.Blocks.OperatingSystem.SynchronizeRealtime
    synchronizeRealtime
    annotation (Placement(transformation(extent={{60,60},{80,80}})));
equation
  connect(addReal.pkgIn, packager1.pkgOut)
    annotation (Line(points={{0,10.8},{0,10.8},{0,39.2}}, color={0,0,0}));
  connect(addReal.pkgOut[1], PrintMessageBE1.pkgIn)
    annotation (Line(points={{0,-10.8},{0,-39.2}}, color={0,0,0}));
  connect(realExpression1.y, addReal.u[1])
    annotation (Line(points={{-27,0},{-12,0}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false), graphics={Text(
          extent={{-78,74},{-36,36}},
          lineColor={28,108,200},
          textString="LE")}));
end PrintLittleEndianData;
