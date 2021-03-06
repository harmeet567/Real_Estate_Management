﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="subpage.aspx.cs" Inherits="RealEstateDemo.homepage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Real Estate - Free CSS Template</title>
<meta name="keywords" content="free css templates, real estate website, website templates, W3C, CSS, XHTML" />
<meta name="description" content="Real Estate Template - Free CSS Template, W3C compliant XHTML CSS layout" />
<link href="templatemo_style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="gallery_style.css" />
</head>
<body>
    <form id="form1" runat="server">
<div id="templatemo_container">
<div id="templatemo_top_panel">
	<div id="templatemo_header_section">
		<asp:Image ID="Image1" runat="server" Height="113px" ImageUrl="~/home_page/images/templatemo_header_section_bg.jpg" Width="280px" />
    </div> <!-- end of header section -->
    
    <div id="templatemo_menu_login_section">
    	<div id="templatemo_menu_section">
        	<div id="templatemo_menu_panel">
                <ul>
                    <li><a href="../Login.aspx">Login</a></li>
                    <li><a href="subpage.html">Buy</a></li>
                    <li><a href="#">Rent</a></li>
                    <li><a href="#">Mortgage</a></li>
                    <li><a href="#">About</a></li>
                    <li><a href="ContactUs.aspx">Contact</a></li>                   
                </ul> 
            </div> <!-- end of menu -->
        </div>
        <div id="templatemo_login_section">
        </div>
    </div>
    <!-- end of menu login section -->
</div> <!-- end of top panel -->

<div id="templatemo_gallery_panel">
<div id="gallery">
  <div id="imagearea">
    <div id="image">
      <a href="javascript:slideShow.nav(-1)" class="imgnav " id="previmg"></a>
      <a href="javascript:slideShow.nav(1)" class="imgnav " id="nextimg"></a>
    </div>
  </div>
  <div id="thumbwrapper">
    <div id="thumbarea">
      <ul id="thumbs">
        <li value="1"><img src="images/thumbs/1.jpg" width="179" height="100" alt="" /></li>
        <li value="2"><img src="images/thumbs/2.jpg" width="179" height="100" alt="" /></li>
        <li value="3"><img src="images/thumbs/3.jpg" width="179" height="100" alt="" /></li>
        <li value="4"><img src="images/thumbs/4.jpg" width="179" height="100" alt="" /></li>
        <li value="5"><img src="images/thumbs/5.jpg" width="179" height="100" alt="" /></li>
        <li value="3"><img src="images/thumbs/3.jpg" width="179" height="100" alt="" /></li>
        <li value="4"><img src="images/thumbs/4.jpg" width="179" height="100" alt="" /></li>
        <li value="5"><img src="images/thumbs/5.jpg" width="179" height="100" alt="" /></li>
      </ul>
    </div>
  </div>
</div>

<script type="text/javascript">
    var imgid = 'image';
    var imgdir = 'images/fullsize';
    var imgext = '.jpg';
    var thumbid = 'thumbs';
    var auto = true;
    var autodelay = 5;
</script>
<script type="text/javascript" src="slide.js"></script>

</div>

<div id="templatemo_content_panel_2">
	<div class="templatemo_section_2">
        <img src="images/templatemo_image_01.jpg" alt="image" />
        <h4>Stately Manor</h4>
        <p>Westmount</p>
        <p>
            

This stately stone manor has been exquisitely renovated with taste and quality making it one of the finest homes the cit...
BED: 6 BATH: 6/1</p>
        <div class="price">PRICE:<span> $1,234,000</span></div>    
        <div class="readmore"><a href="subpage.html">Read more</a></div>                       
    </div>
    <div class="templatemo_section_2">
        <img src="images/templatemo_image_02.jpg" alt="image" />
        <h4>Westmount, Québec</h4>
        <p>
Westmount</p>
<p>Breathtaking residence completely renovated with the highest level of luxury and technology. This exceptional three-stor...
BED: 4 BATH: 4/2</p>
        <div class="price">PRICE:<span> $876,000</span></div>                           
        <div class="readmore"><a href="subpage.html">Read more</a></div>
    </div>
    <div class="templatemo_section_2">

        <img src="images/templatemo_image_03.jpg" alt="image" />
        <h4>Sprawling Waterfront Estate</h4>
        <p>
L'île-Bizard/Sainte-Geneviève (Montréal)</p>
<p>This sprawling waterfront estate provides the finest in contemporary luxury living. Bordering Lac des Deux Montagne, thi...
BED: 6 BATH: 5</p>
        <div class="price">PRICE:<span> $2,468,000</span></div>                           
      <div class="readmore"><a href="subpage.html">Read more</a></div>
    </div>
    
    <div class="cleaner_with_height">&nbsp;</div>
</div> <!-- end of content panel 2 -->

<div id="templatemo_content_panel_3">

	<div class="templatemo_quick_contact">
    	<h1>Quick Contact</h1>
        <p>
            Tel: 010-100-1000<br />
            Fax: 020-200-2Tel: 514-576-0098<br />
            Fax: 438-200-2000<br />
            Email: info@realestate.com
        </p>
        &nbsp; 
    </div><!-- end of news section 3-->
    
   <div class="templatemo_section_3">
    	<h1>Helpful Linksion_3">
    	<h1>Helpful Links        <li><a href="#">Testimonials</a></li>
                <li><a href="#">FAQs</a></li>
                <li><a href="#">Terms of us</a></li>
                <li><a href="#">About Us</a></li>
                <li><a href="#">Contact Us</a></li>
            </ul>
    </div>
    
<div class="cleaner_with_height">&nbsp;</div>
</div><!-- end of content panel 3 -->

<div id="templatemo_footer_panel">
    Copyright © 2015 Montreal Real Estate Pvt. Ltd.</div>
</div> <!-- end of container -->
<div align=center></div>
    </form>
</body>
</html>
