<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="asp.netcrud.Registration" %>

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
    </style>
</head>
<body style="background-image: url(https://wallpapercave.com/wp/wp2632423.jpg ); background-size:cover;">
    <form id="form1" runat="server" >
        <div style="color: Yellow; font-size:large;" class="center">
        <h1 style="text-align:center">The Spare Moment</h1>
    </div>
        <asp:HiddenField ID="hfContactID" runat="server" />
        <table>
            <tr>
                <td class="auto-style1">
                    Username : </td>
                <td class="auto-style2">
                    <asp:TextBox ID="txtUsername" runat="server" Width="230px" placeholder="Enter your chosen Username"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">
                    Password : </td>
                <td class="auto-style2">
                    <asp:TextBox ID="txtPassword" runat="server" Type="Password" Width="230px" placeholder="*****"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">
                    First Name : </td>
                <td class="auto-style2">
                    <asp:TextBox ID="txtFirstname" runat="server" Width="230px" placeholder="Enter Your First Name"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">
                    Last Name : </td>
                <td class="auto-style2">
                    <asp:TextBox ID="txtLastname" runat="server" Width="230px" placeholder="Enter Your Last Name"></asp:TextBox>
                </td>
            </tr>
                <tr>
                <td class="auto-style1">
                    
                    &nbsp;</td>
                <td class="auto-style3">
                    &nbsp;</td>
                    </tr>
                <tr>
                <td class="auto-style4">
                    
                </td>
                <td class="auto-style5; center">
                    <asp:Button ID="btnSave" runat="server" Text="Proceed" OnClick="btnSave_Click" />
                </td>
            
            </tr>
                <tr>
                <td class="auto-style4">
                    
                    &nbsp;</td>
                <td class="auto-style5; center;">
                    <asp:Button ID="btnHome" runat="server" PostBackUrl="~/Contact.aspx" Text="Return" />
                </td>
            
            </tr>
                <tr>
                <td class="auto-style4">
                    
                    &nbsp;</td>
                <td class="auto-style5">
                    &nbsp;</td>
            
            </tr>
        </table>
                    <asp:Label ID="lblSuccessMessage" runat="server" Text="" ForeColor="Green"></asp:Label>
        <br />
                    <asp:Label ID="lblErrorMessage" runat="server" Text="" ForeColor="Red"></asp:Label>
    </div>
    </form>
    <p>
&nbsp;</p>
</body>
</html>
