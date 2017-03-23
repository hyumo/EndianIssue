within EndianIssue.Components;
block PrintMessageBE
  extends Modelica_DeviceDrivers.Utilities.Icons.SerialPackagerWriteIcon;
  extends
    Modelica_DeviceDrivers.Blocks.Communication.Internal.PartialSampleTrigger;
  parameter Integer msg_dlc(
    min=0,
    max=8) = 8 "Data length code (payload of data in bytes, max=8)";
  Modelica_DeviceDrivers.Blocks.Interfaces.PackageIn pkgIn annotation (
      Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=-90,
        origin={-108,0})));
equation
  pkgIn.backwardTrigger = actTrigger;
  when initial() then
    pkgIn.userPkgBitSize = msg_dlc*8;
    pkgIn.autoPkgBitSize = 0;
  end when;

  when pkgIn.trigger then
    Modelica_DeviceDrivers.Packaging.SerialPackager_.print(pkgIn.pkg);
  end when;
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end PrintMessageBE;
