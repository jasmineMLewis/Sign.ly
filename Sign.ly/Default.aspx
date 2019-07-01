<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="Default.aspx.vb" Inherits="Sign.ly._Default" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>

<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <header>
      <nav class="navbar navbar-expand-lg navbar-dark fixed-top scrolling-navbar" id="navbar">
        <div class="container"><a class="navbar-brand" href="#">Sign.ly</a>
          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarContent" 
                aria-controls="navbarContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>
          <div class="collapse navbar-collapse" id="navbarContent">
            <ul class="navbar-nav ml-auto">
            </ul>
            <img class="img-responsive" src="./Images/hanoLogoSmaller.png" alt="" />
          </div>
        </div>
      </nav>
      <section class="view hm-gradient" id="intro">
        <div class="full-bg-img d-flex align-items-center">
          <div class="container">
            <div class="row no-gutters">
              <div class="col-md-10 col-lg-6 text-center text-md-left margins">
                <div class="white-text">
                  <div class="wow fadeInLeft" data-wow-delay="0.3s">
                    <h1 class="h1-responsive font-bold mt-sm-5">Sign.ly</h1>
                   <div class="h6">
                      Sign.ly automates employees' signatures by emailing their signed 
                      electronic copy to the perspective parties. 
                   </div>
                  </div>
                  <br />
                  <div class="wow fadeInLeft" data-wow-delay="0.3s">
                     <a class="btn btn-outline-white" data-toggle="modal" data-target="#myModal" role="button" href="#">Sign.ly</a>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </section>
    </header>

  <div class="modal fade" id="myModal" role="dialog">
   <form id="Form1" runat="server" class="form-inline">
       <div class="modal-dialog modal-lg">
          <div class="modal-content">
        
            <div class="modal-header">
              <h4 class="modal-title">Sign.ly</h4>
              <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
        
            <div class="modal-body">
              <div class="text-center"><img class="img-responsive" src="./Images/hanoLogo.png" alt="" /></div>

              <br />
              <h2 class="text-center">Sign.ly</h2>
              <br />

              <p>I acknowledge that I have received a Housing Authority of New Orleans (HANO) identification card (ID). 
                  I understand that I am required to wear the identification Card at all times while working. The ID card
                 must be visible at all times while at work. I understand that if the ID Card is lost or stolen, I must 
                 report the incident to the Information Technology Department immediately. If the ID card is lost or damaged
                  by employee, I will be required to pay a $15.00 fee for a replacement card. Further, I understand that if 
                  the ID card malfunctions, the malfunctioning ID card must be turned into the IT Department. The IT Department
                  will then provide a replacement ID card at no cost.
              </p>

              <br />
              <p>I understand that failure to comply with the conditions stated above may result in disciplinary action.</p>
       
              <div class="col-lg-12">
                    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                <div class="row">
                    <div class="form-group">
                        <div class="col-sm-4">
                            <asp:TextBox ID="RecipientFullName" runat="server" class="input-medium form-control"
                                placeholder="Recipient Full Name" MaxLength="50">
                            </asp:TextBox>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-4">
                            <asp:TextBox ID="RecipientEmail" runat="server" class="input-medium form-control"
                                placeholder="Recipient Email" MaxLength="50">
                            </asp:TextBox>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-4">
                            <asp:TextBox ID="RecipientSignageDate" runat="server" class="input-medium form-control" placeholder="Date"></asp:TextBox>
                        <%--    <ajaxToolkit:CalendarExtender ID="RecipientCalendar" runat="server" TargetControlID="RecipientSignageDate"
                                Format="MM/dd/yyyy" />--%>
                        </div>
                    </div>
                </div>

                <br />
                <p></p>

                <div class="row">
                    <div class="form-group">
                        <div class="col-sm-8">
                            <asp:DropDownList ID="ITRepresentative" runat="server" class="form-control">
                                <asp:ListItem Text="IT Representative"></asp:ListItem>
                                <asp:ListItem Text="Allan Rivera" Value="Allan Rivera"></asp:ListItem>
                                <asp:ListItem Text="Edith Battiste" Value="Edith Battiste"></asp:ListItem>
                                <asp:ListItem Text="Issachar Nichols" Value="Issachar Nichols"></asp:ListItem>
                                <asp:ListItem Text="Jasmine Lewis" Value="Jasmine Lewis"></asp:ListItem>
                                <asp:ListItem Text="Tracey Woods" Value="Tracey Woods"></asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-4">
                            <asp:TextBox ID="ITRepSignageDate" runat="server" class="input-medium form-control" placeholder="Date"></asp:TextBox>
                            <%--<ajaxToolkit:CalendarExtender ID="ITRepCalendar" runat="server" TargetControlID="ITRepSignageDate"
                                Format="MM/dd/yyyy" />--%>
                        </div>
                    </div>
                </div>
              </div>
            </div>

            <div class="modal-footer">
              <button type="button" class="btn btn-default" runat="server" onserverclick="BtnCreateCardReceipt">
                 <i class="fa fa-envelope-o" aria-hidden="true"></i> Submit
              </button>
              <button type="button" class="btn btn-default" data-dismiss="modal">
                <i class="fa fa-times" aria-hidden="true"></i> Close
              </button>
            </div>
          </div>
       </div>
   </form>
  </div>
</asp:Content>
