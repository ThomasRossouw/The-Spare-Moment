<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="asp.netcrud.Contact" %>

<%@ Register assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.UI.DataVisualization.Charting" tagprefix="asp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
 <style type="text/css">
        #form1 {
            height: 695px;
        }
        .auto-style1 {
            height: 24px;
            color:white;
            padding-left:1em;
            font-family:Georgia,Garamond, serif;
            font-size: 16px;
            font-style: italic;
        }
        .auto-style2 {
            width: 395px;
            color:white;
            padding-left:1em;
            font-family:Georgia,Garamond, serif;
            font-size: 16px;
            font-style: italic;
        }
        .auto-style3 {
            height: 24px;
            width: 395px;
            color:white;
            padding-left:1em;
            font-family:Georgia,Garamond, serif;
            font-size: 16px;
            font-style: italic;
        }
        .auto-style4 {
            height: 26px;
            color:white;
            padding-left:1em;
            font-family:Georgia,Garamond, serif;
            font-size: 16px;
            font-style: italic;
        }
        .auto-style5 {
            width: 395px;
            height: 26px;
            color:white;
            padding-left:1em;
            font-family:Georgia,Garamond, serif;
            font-size: 16px;
            font-style: italic;
        }
        
        .auto-style6 {
            height: 31px;
        }
        .auto-style7 {
            width: 395px;
            height: 31px;
        }
        .auto-style8 {
            height: 25px;
        }
        .auto-style9 {
            width: 395px;
            height: 25px;
        }
        .auto-style10 {
            width: 2086px;
            height: 1101px;
        }
        .auto-style11 {
            height: 304px;
        }
        .auto-style12 {
            width: 395px;
            height: 304px;
        }
        .auto-style13 {
            width: 350px;
            height: 26px;
        }
        .auto-style14 {
            width: 350px;
        }
        .auto-style15 {
            width: 350px;
            height: 31px;
        }
        .auto-style16 {
            width: 350px;
            height: 25px;
        }
        .auto-style17 {
            height: 24px;
            width: 350px;
        }
        .auto-style18 {
            width: 350px;
            height: 304px;
        }
    </style>
</head>
<body style="background-image: url(https://wallpapercave.com/wp/wp2632423.jpg ); background-size:cover;">
    <form id="form1" runat="server" >
        <div style="color: Yellow; font-size:large;" class="center">
        <h1 style="text-align:center">The Spare Moment</h1>
    </div>
    <div>
        <asp:HiddenField ID="hfContactID" runat="server" />
        <table>
            <tr>
                <td class="auto-style4">
                    Username</td>
                <td class="auto-style13">
                    <asp:TextBox ID="txtUser" runat="server" Width="230px" placeholder="Enter your Username"></asp:TextBox>
                </td>
                <td class="auto-style5">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style4">
                    Password</td>
                <td class="auto-style14">
                    <asp:TextBox ID="txtPass" runat="server" type="Password" Width="230px" placeholder="******"></asp:TextBox>
                </td>
                <td class="auto-style2">
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td class="auto-style14">
                    <asp:Label ID="lblSuccessMessage" runat="server" Text="" ForeColor="Green"></asp:Label>
        <br />
                    <asp:Label ID="lblErrorMessage" runat="server" Text="" ForeColor="Red"></asp:Label>
                </td>
                <td class="auto-style2">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style6">
                    </td>
                <td class="auto-style15">
                    <asp:Button ID="btnLogin" runat="server" OnClick="btnLogin_Click" Text="Log In" />
                </td>
                <td class="auto-style7">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style6">
                    </td>
                <td class="auto-style15">
                    <asp:Button ID="Button1" runat="server"  Text="Register" PostBackUrl="~/Registration.aspx" style="height: 26px" />
                </td>
                <td class="auto-style7">
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td class="auto-style14">
                    &nbsp;</td>
                <td class="auto-style2">
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td class="auto-style14">
                    &nbsp;</td>
                <td class="auto-style2">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style4">
                    <asp:Label ID="Label1" runat="server" Text="Module Code:"></asp:Label>
                </td>
                <td class="auto-style14">
                    <asp:TextBox ID="txtCode" runat="server" Width="230px" placeholder="Enter Module Code"></asp:TextBox>
                </td>
                <td class="auto-style2">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style4">
                    <asp:Label ID="Label2" runat="server" Text="Module Name:"></asp:Label>
                </td>
                <td class="auto-style13">
                    <asp:TextBox ID="txtModuleName" runat="server" Width="230px" placeholder="Enter Module Name"></asp:TextBox>
                </td>
                <td class="auto-style5">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style4">
                    
                   Number of Credits:</td>
                <td class="auto-style16">
                    <asp:TextBox ID="txtCredits" runat="server" Width="230px" placeholder="Enter Number of Credits" OnTextChanged="TextBox1_TextChanged"></asp:TextBox>
                </td>
                <td class="auto-style9">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style1">
                    
                   Class Hours Per Week:</td>
                <td class="auto-style17">
                    <asp:TextBox ID="txtHoursWeek" runat="server" Width="230px" placeholder="Enter Class Hours per Week"></asp:TextBox>
                </td>
                <td class="auto-style3">
                    &nbsp;</td>
                </tr>
                <tr>
                <td class="auto-style1">
                    
                    Number of Weeks in the Semester:</td>
                <td class="auto-style17">
                    <asp:TextBox ID="txtWeeks" runat="server" Width="230px" placeholder="Enter Number of Weeks"></asp:TextBox>
                </td>
                <td class="auto-style3">
                    &nbsp;</td>
                    </tr>
                <tr>
                <td class="auto-style1">
                    
                    Week's Hours Spent on Module:</td>
                <td class="auto-style17">
                    <asp:TextBox ID="txtHoursSpent" runat="server" Width="230px" placeholder="Enter Week's hours spent"></asp:TextBox>
                </td>
                <td class="auto-style3">
                    &nbsp;</td>
                    </tr>
                <tr>
                <td class="auto-style1">
                    
                    &nbsp;</td>
                <td class="auto-style17">
                    &nbsp;</td>
                <td class="auto-style3">
                    &nbsp;</td>
                    </tr>
                <tr>
                <td class="auto-style1">
                    
                    Module Start Date:</td>
                <td class="auto-style17">
                    <asp:Calendar ID="txtDate" runat="server" Height="16px" Width="145px" style="background-color:white"></asp:Calendar>
                    <asp:SqlDataSource ID="DBHours" runat="server" ConnectionString="<%$ ConnectionStrings:TimeConnectionString %>" SelectCommand="SELECT * FROM [Module] WHERE ([UserName] = @USERNAME)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="txtUser" Name="UserName" PropertyName="Text" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
                <td class="auto-style3">
                    &nbsp;</td>
                    </tr>
                <tr>
                <td class="auto-style1">
                    
                    </td>
                <td class="auto-style17">
                    &nbsp;</td>
                <td class="auto-style3">
                    &nbsp;</td>
                    </tr>
                <tr>
                <td>
                    
                </td>
                <td class="auto-style14">
                    <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" style="background-color:cyan"/>
                    <asp:Button ID="btnDelete" runat="server" Text="Delete" OnClick="btnDelete_Click" style="background-color:red; color:white;"/>
                    <asp:Button ID="btnClear" runat="server" Text="Clear" OnClick="btnClear_Click" style="background-color:yellow" />
                </td>
            
                <td class="auto-style2">
                    &nbsp;</td>
            
            </tr>
                <tr>
                <td>
                    
                    &nbsp;</td>
                <td class="auto-style14">
                    &nbsp;</td>
            
                <td class="auto-style2">
                    &nbsp;</td>
            
            </tr>
                <tr>
                <td>
                    
                    &nbsp;</td>
                <td class="auto-style14">
        <asp:GridView ID="gvContact" runat="server" AutoGenerateColumns="False" style="color:white">
            <Columns>
                <asp:BoundField DataField="ModuleCode" HeaderText="Module Code" />
                <asp:BoundField DataField="ModuleName" HeaderText="Module Name" />
                <asp:BoundField DataField="ModuleCredits" HeaderText="Credits" />
                <asp:BoundField DataField="ModuleHrsPerWeek" HeaderText="Weekly Hours" />
                <asp:BoundField DataField="ModuleWeeks" HeaderText="Weeks" />
                <asp:BoundField DataField="HrsSpent" HeaderText="Hours Spent " />
                <asp:BoundField DataField="ModuleStartDate" HeaderText="Start Date" />
                <asp:BoundField DataField="selfStudyHours" HeaderText="Self Study" />
                <asp:BoundField DataField="RemainingHours" HeaderText="Weekly Hours Remaining" />
                <asp:BoundField DataField="UserName" HeaderText="Username" />
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:LinkButton ID="lnkView" runat="server" CommandArgument='<%# Eval("ModuleID") %>' OnClick="lnk_OnClick">View</asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
                    <asp:SqlDataSource ID="DB" runat="server" ConnectionString="<%$ ConnectionStrings:TimeConnectionString %>" SelectCommand="SELECT * FROM [Module]"></asp:SqlDataSource>
                </td>
            
                <td class="auto-style2">
                    &nbsp;</td>
            
            </tr>
                <tr>
                <td>
                    
                    &nbsp;</td>
                <td class="auto-style14">
                    &nbsp;</td>
            
                <td class="auto-style2">
                    &nbsp;</td>
            
            </tr>
                <tr>
                <td>
                    
                    &nbsp;</td>
                <td class="auto-style2">
                    HOURS SPENT ON MODULE:</td>
            
                <td class="auto-style2">
                    HOURS REQUIRED FOR THE MODULE:</td>
            
            </tr>
                <tr>
                <td class="auto-style11">
                    
                    &nbsp;</td>
                <td class="auto-style18">
                    <asp:Chart ID="Chart1" runat="server" DataSourceID="SqlDataSource1">
                        <Series>
                            <asp:Series Name="Series1" XValueMember="ModuleCode" YValueMembers="HrsSpent">
                            </asp:Series>
                        </Series>
                        <ChartAreas>
                            <asp:ChartArea Name="ChartArea1">
                            </asp:ChartArea>
                        </ChartAreas>
                    </asp:Chart>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:TimeConnectionString %>" SelectCommand="SELECT * FROM [Module] WHERE ([UserName] = @UserName)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="txtUser" Name="UserName" PropertyName="Text" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    </td>
            
                <td class="auto-style12">
                    <asp:Chart ID="Chart2" runat="server" DataSourceID="SqlDataSource1">
                        <Series>
                            <asp:Series Name="Series1" XValueMember="ModuleCode" YValueMembers="ModuleHrsPerWeek">
                            </asp:Series>
                        </Series>
                        <ChartAreas>
                            <asp:ChartArea Name="ChartArea1">
                            </asp:ChartArea>
                        </ChartAreas>
                    </asp:Chart>
                    </td>
            
            </tr>
        </table>
    </div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</form>
</body>
</html>
