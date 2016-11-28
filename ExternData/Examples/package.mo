// CP: 65001
/* package.mo - Modelica library for data I/O of INI, JSON, MATLAB MAT, Excel XLS/XLSX or XML files
 *
 * Copyright (C) 2015-2016, tbeu
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 *
 * 1. Redistributions of source code must retain the above copyright notice,
 *    this list of conditions and the following disclaimer.
 * 2. Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in the
 *    documentation and/or other materials provided with the distribution.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
 * ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
 * WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
 * DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
 * FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
 * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
 * SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
 * CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
 * OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
 * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

within ExternData;
package Examples "Test examples"
  extends Modelica.Icons.ExamplesPackage;
  model INITest "INI file read test"
    extends Modelica.Icons.Example;
    INIFile inifile(fileName=Modelica.Utilities.Files.loadResource("modelica://ExternData/Resources/Examples/test.ini")) annotation(Placement(transformation(extent={{-80,60},{-60,80}})));
    Modelica.Blocks.Math.Gain gain1(k=inifile.getReal("gain.k", "set1")) annotation(Placement(transformation(extent={{-15,60},{5,80}})));
    Modelica.Blocks.Math.Gain gain2(k=Modelica.Utilities.Strings.scanReal(inifile.getString("gain.k", "set2"))) annotation(Placement(transformation(extent={{-15,30},{5,50}})));
    Modelica.Blocks.Sources.Clock clock annotation(Placement(transformation(extent={{-50,60},{-30,80}})));
    equation
      connect(clock.y,gain1.u) annotation(Line(points={{-29,70},{-17,70}}, color={0,0,127}));
      connect(clock.y,gain2.u) annotation(Line(points={{-29,70},{-22,70},{-22,40},{-17,40}}, color={0,0,127}));
    annotation(experiment(StopTime=1),
      Documentation(info="<html><p>This example model reads the gain parameters from different sections of the INI file <a href=\"modelica://ExternData/Resources/Examples/test.ini\">test.ini</a>. For gain1 the gain parameter is read as Real value using the function <a href=\"modelica://ExternData.INIFile.getReal\">ExternData.INIFile.getReal</a>. For gain2 the String value is retrieved by function <a href=\"modelica://ExternData.INIFile.getString\">ExternData.INIFile.getString</a> and converted to a Real value (using the utility function <a href=\"modelica://Modelica.Utilities.Strings.scanReal\">Modelica.Utilities.Strings.scanReal</a>). The read parameters are assigned by parameter bindings to the appropriate model parameters.</p></html>"));
  end INITest;

  model JSONTest "JSON file read test"
    extends Modelica.Icons.Example;
    JSONFile jsonfile(fileName=Modelica.Utilities.Files.loadResource("modelica://ExternData/Resources/Examples/test.json")) annotation(Placement(transformation(extent={{-80,60},{-60,80}})));
    Modelica.Blocks.Math.Gain gain1(k=jsonfile.getReal("set1.gain.k")) annotation(Placement(transformation(extent={{-15,60},{5,80}})));
    Modelica.Blocks.Math.Gain gain2(k=Modelica.Utilities.Strings.scanReal(jsonfile.getString("set2.gain.k"))) annotation(Placement(transformation(extent={{-15,30},{5,50}})));
    Modelica.Blocks.Sources.Clock clock annotation(Placement(transformation(extent={{-50,60},{-30,80}})));
    equation
      connect(clock.y,gain1.u) annotation(Line(points={{-29,70},{-17,70}}, color={0,0,127}));
      connect(clock.y,gain2.u) annotation(Line(points={{-29,70},{-22,70},{-22,40},{-17,40}}, color={0,0,127}));
    annotation(experiment(StopTime=1),
      Documentation(info="<html><p>This example model reads the gain parameters from different nodes of the JSON file <a href=\"modelica://ExternData/Resources/Examples/test.json\">test.json</a>. For gain1 the gain parameter is read as Real value using the function <a href=\"modelica://ExternData.JSONFile.getReal\">ExternData.JSONFile.getReal</a>. For gain2 the String value is retrieved by function <a href=\"modelica://ExternData.JSONFile.getString\">ExternData.JSONFile.getString</a> and converted to a Real value (using the utility function <a href=\"modelica://Modelica.Utilities.Strings.scanReal\">Modelica.Utilities.Strings.scanReal</a>). The read parameters are assigned by parameter bindings to the appropriate model parameters.</p></html>"));
  end JSONTest;

  model MATTest "MAT-file read test"
    extends Modelica.Icons.Example;
    MATFile matfile(fileName=Modelica.Utilities.Files.loadResource("modelica://ExternData/Resources/Examples/test_v7.3.mat")) annotation(Placement(transformation(extent={{-80,60},{-60,80}})));
    Modelica.Blocks.Sources.TimeTable timeTable1(table=matfile.getRealArray2D("table1", 3, 2)) annotation(Placement(transformation(extent={{-50,60},{-30,80}})));
    annotation(experiment(StopTime=1),
      Documentation(info="<html><p>This example model reads the table parameter from variable table1 of the HDF5-based MAT-file <a href=\"modelica://ExternData/Resources/Examples/test_v7.3.mat\">test_v7.3.mat</a>. The table parameter is read as Real array of dimension 3x2 by function <a href=\"modelica://ExternData.MATFile.getRealArray2D\">ExternData.MATFile.getRealArray2D</a>. The read parameter is assigned by a parameter binding to the appropriate model parameter.</p></html>"));
  end MATTest;

  model XLSTest "Excel XLS file read test"
    extends Modelica.Icons.Example;
    XLSFile xlsfile(fileName=Modelica.Utilities.Files.loadResource("modelica://ExternData/Resources/Examples/test.xls")) annotation(Placement(transformation(extent={{-80,60},{-60,80}})));
    Modelica.Blocks.Math.Gain gain1(k=xlsfile.getReal("B2", "set1")) annotation(Placement(transformation(extent={{-15,60},{5,80}})));
    Modelica.Blocks.Math.Gain gain2(k=Modelica.Utilities.Strings.scanReal(xlsfile.getString("B2", "set2"))) annotation(Placement(transformation(extent={{-15,30},{5,50}})));
    Modelica.Blocks.Sources.Clock clock annotation(Placement(transformation(extent={{-50,60},{-30,80}})));
    equation
      connect(clock.y,gain1.u) annotation(Line(points={{-29,70},{-17,70}}, color={0,0,127}));
      connect(clock.y,gain2.u) annotation(Line(points={{-29,70},{-22,70},{-22,40},{-17,40}}, color={0,0,127}));
    annotation(experiment(StopTime=1),
      Documentation(info="<html><p>This example model reads the gain parameters from different cells and sheets of the Excel XLS file <a href=\"modelica://ExternData/Resources/Examples/test.xls\">test.xls</a>. For gain1 the gain parameter is read as Real value using the function <a href=\"modelica://ExternData.XLSFile.getReal\">ExternData.XLSFile.getReal</a>. For gain2 the String value is retrieved by function <a href=\"modelica://ExternData.XLSFile.getString\">ExternData.XLSFile.getString</a> and converted to a Real value (using the utility function <a href=\"modelica://Modelica.Utilities.Strings.scanReal\">Modelica.Utilities.Strings.scanReal</a>). The read parameters are assigned by parameter bindings to the appropriate model parameters.</p></html>"));
  end XLSTest;

  model XLSXTest "Excel XLSX file read test"
    extends Modelica.Icons.Example;
    XLSXFile xlsxfile(fileName=Modelica.Utilities.Files.loadResource("modelica://ExternData/Resources/Examples/test.xlsx")) annotation(Placement(transformation(extent={{-80,60},{-60,80}})));
    Modelica.Blocks.Math.Gain gain1(k=xlsxfile.getReal("B2", "set1")) annotation(Placement(transformation(extent={{-15,60},{5,80}})));
    Modelica.Blocks.Math.Gain gain2(k=Modelica.Utilities.Strings.scanReal(xlsxfile.getString("B2", "set2"))) annotation(Placement(transformation(extent={{-15,30},{5,50}})));
    Modelica.Blocks.Sources.Clock clock annotation(Placement(transformation(extent={{-50,60},{-30,80}})));
    equation
      connect(clock.y,gain1.u) annotation(Line(points={{-29,70},{-17,70}}, color={0,0,127}));
      connect(clock.y,gain2.u) annotation(Line(points={{-29,70},{-22,70},{-22,40},{-17,40}}, color={0,0,127}));
    annotation(experiment(StopTime=1),
      Documentation(info="<html><p>This example model reads the gain parameters from different cells and sheets of the Excel XLSX file <a href=\"modelica://ExternData/Resources/Examples/test.xlsx\">test.xlsx</a>. For gain1 the gain parameter is read as Real value using the function <a href=\"modelica://ExternData.XLSXFile.getReal\">ExternData.XLSXFile.getReal</a>. For gain2 the String value is retrieved by function <a href=\"modelica://ExternData.XLSXFile.getString\">ExternData.XLSXFile.getString</a> and converted to a Real value (using the utility function <a href=\"modelica://Modelica.Utilities.Strings.scanReal\">Modelica.Utilities.Strings.scanReal</a>). The read parameters are assigned by parameter bindings to the appropriate model parameters.</p></html>"));
  end XLSXTest;

  model XMLTest "XML file read test"
    extends Modelica.Icons.Example;
    XMLFile xmlfile(fileName=Modelica.Utilities.Files.loadResource("modelica://ExternData/Resources/Examples/test.xml")) annotation(Placement(transformation(extent={{-80,60},{-60,80}})));
    Modelica.Blocks.Math.Gain gain1(k=xmlfile.getReal("set1.gain.k")) annotation(Placement(transformation(extent={{-15,60},{5,80}})));
    Modelica.Blocks.Math.Gain gain2(k=Modelica.Utilities.Strings.scanReal(xmlfile.getString("set2.gain.k"))) annotation(Placement(transformation(extent={{-15,30},{5,50}})));
    Modelica.Blocks.Sources.Clock clock annotation(Placement(transformation(extent={{-50,60},{-30,80}})));
    Modelica.Blocks.Sources.TimeTable timeTable1(table=xmlfile.getRealArray2D("table1", 3, 2)) annotation(Placement(transformation(extent={{-50,30},{-30,50}})));
    equation
      connect(clock.y,gain1.u) annotation(Line(points={{-29,70},{-17,70}}, color={0,0,127}));
      connect(clock.y,gain2.u) annotation(Line(points={{-29,70},{-22,70},{-22,40},{-17,40}}, color={0,0,127}));
    annotation(experiment(StopTime=1),
      Documentation(info="<html><p>This example model reads the gain and table parameters from different nodes of the XML file <a href=\"modelica://ExternData/Resources/Examples/test.xml\">test.xml</a>. For gain1 the gain parameter is read as Real value using the function <a href=\"modelica://ExternData.XMLFile.getReal\">ExternData.XMLFile.getReal</a>. For gain2 the String value is retrieved by function <a href=\"modelica://ExternData.XMLFile.getString\">ExternData.XMLFile.getString</a> and converted to a Real value (using the utility function <a href=\"modelica://Modelica.Utilities.Strings.scanReal\">Modelica.Utilities.Strings.scanReal</a>). For timeTable1 the table parameter is read as Real array of dimension 3x2 by function <a href=\"modelica://ExternData.XMLFile.getRealArray2D\">ExternData.XMLFile.getRealArray2D</a>. The read parameters are assigned by parameter bindings to the appropriate model parameters.</p></html>"));
  end XMLTest;
end Examples;