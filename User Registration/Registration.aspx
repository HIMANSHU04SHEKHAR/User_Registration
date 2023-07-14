<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="User_Registration.Registration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        
        .auto-style1 {
            width: 400px;
            margin:auto;
            border:ridge 5px black;
            height: 580px;
            background:linear-gradient(to left,#8EC5FC,#E0C3FC);
            padding-right: 25px;
        }
        .auto-style2 {
            width: 234px;
            text-align:center;
            font-family:Courier New, Courier, monospace;
            font-weight: bold;
            
            
            
        }
        .auto-style3
        {
            font-size:30px;
            text-align:center;
            font-family:Courier New, Courier, monospace;
            font-weight: bold;
            
        }
        .auto-style4 {
            font-family:Courier New, Courier, monospace;
            
            
        }
        .btn{
            
            background-color:dodgerblue;
            border-radius: 12px;
             font-weight: bold;
             font-family:Courier New, Courier, monospace;
        }
        
        .auto-style5 {
            height: 59px;
            font-family:Courier New, Courier, monospace;
            
            
            
        }
        .ex1 {
  padding-right: 500px;
}
        .ex2 {
  padding-right: 500px;
}       
       
                
    </style>
</head>
<body style="height: 561px">
    <div style="background-image:url(./BG.jpg)">


        <form id="form1" runat="server" class="ex1">
            <div >

                <table cellpadding="3" cellspacing="3" class="auto-style1">
                    <tr>
                        <td class="auto-style3" colspan="2">USER REGISTRATION</td>
                    </tr>
                    <tr>
                        <td class="auto-style2">USER NAME</td>
                        <td class="auto-style4">
                            <asp:TextBox ID="UserNameTextBox" runat="server"></asp:TextBox>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="UserNameTextBox" ErrorMessage="Enter Valid Name" ForeColor="Red" SetFocusOnError="True" ValidationExpression="\s+$">*</asp:RegularExpressionValidator>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="UserNameTextBox" Display="Dynamic" ErrorMessage="Please Enter User Name" ForeColor="Red"  SetFocusOnError ="True">*</asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style2">EMAIL ADDRESS</td>
                        <td class="auto-style4">
                            <asp:TextBox ID="EmailAddressTextBox" runat="server"></asp:TextBox>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="EmailAddressTextBox" Display="Dynamic" ErrorMessage="Please Enter Valid Email" ForeColor="Red" SetFocusOnError="True" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">*</asp:RegularExpressionValidator>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="EmailAddressTextBox" Display="Dynamic" ErrorMessage="Please Enter your Email" ForeColor="Red" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style2">DATE OF BIRTH</td>
                        <td class="auto-style4">
                            <asp:TextBox ID="DOBTextBox" runat="server" type="date" Max="2023-07-13"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="DOBTextBox" Display="Dynamic" ErrorMessage=" Please Select Date Of Birth" ForeColor="Red" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                            <script>
                                var today = new Date().toISOstring().split('T')[0];
                                document.getElementById("date-input").setAttribute("max", today);
                            </script>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style2" id=" backk">MOBILE NUMBER</td>
                        <td class="auto-style4">
                            <asp:TextBox ID="MobileNumberTextBox" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="MobileNumberTextBox" Display="Dynamic" ErrorMessage="Please Enter Mobile Number" ForeColor="Red" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="MobileNumberTextBox" ErrorMessage="Enter Correct Mobile Number" ForeColor="Red" SetFocusOnError="True" ValidationExpression="^([5-9]{1})([0-9]{9})$">*</asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style2">STATE</td>
                        <td class="auto-style4">
                            <asp:DropDownList ID="stateDropDownList1" runat="server" Height="20px" Width="170px" OnSelectedIndexChanged="stateDropDownList1_SelectedIndexChanged " AutoPostBack="true">
                            </asp:DropDownList>

                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="stateDropDownList1" Display="Dynamic" ErrorMessage="Select Any State" ForeColor="Red" SetFocusOnError="True">*</asp:RequiredFieldValidator>

                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style2">CITY</td>
                        <td class="auto-style4">
                            <asp:DropDownList ID="cityDropDownList2" runat="server" Height="20px" Width="170px">
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="cityDropDownList2" Display="Dynamic" ErrorMessage="RequiredFieldValidator" ForeColor="Red" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style2">
                            <asp:Button ID="Button1" runat="server" Text="VIEW DATA" Height="55px" Width="102px" OnClick="Button2_Click" CssClass="btn"  CausesValidation="false"/>
                        </td>
                        <td class="auto-style4">
                            <asp:Button ID="REGISTER" runat="server" Text="REGISTER" Height="55px" Width="102px" OnClick="Button1_Click" CssClass="btn" />

                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style5" colspan="2">
                            <asp:ValidationSummary ID="ValidationSummary1" runat="server" font-family="Courier New, Courier, monospace"  Font-Size="Large" ForeColor="#660066" />
                        </td>
                    </tr>
                </table>
            </div>
        </form>
    </div>
</body>
</html>
