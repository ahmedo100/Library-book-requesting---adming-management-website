﻿<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="Engine.Livre" %>
<%@ page import="java.sql.*" %>
<%@ page import="org.apache.commons.codec.binary.Base64" %>
<%@ page import="java.util.ArrayList" %><%

	ArrayList<Livre> livres = new ArrayList<>();

	String query ="SELECT titre_livre ,issn_livre,image from livre,image_livre WHERE  issn_livre = id_livre ";
	try {
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/tp-bib","root","");
		Statement stmt =  con.createStatement();

		ResultSet rs = stmt.executeQuery(query);


		while(rs.next()){
			Livre tmp = new Livre();

			tmp.setTitre(rs.getString("titre_livre"));
			tmp.setIssn(rs.getInt("issn_livre"));
			Blob tmpImage = rs.getBlob("image");
			String imgString = Base64.encodeBase64String(tmpImage.getBytes(1,(int)tmpImage.length()));
			tmp.setImage(imgString);
			livres.add(tmp);
		}

	} catch (SQLException e) {
		e.printStackTrace();
	}

	pageContext.setAttribute("livres",livres);


%>

<!doctype html>
<html class="no-js" lang="zxx">

<!-- Mirrored from demo.hasthemes.com/boighor-preview/boighor-v3/cart.jsp by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 29 Jun 2019 22:55:01 GMT -->
<head>
	<meta charset="utf-8">
	<meta http-equiv="x-ua-compatible" content="ie=edge">
	<title>Panier</title>
	<meta name="description" content="">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<!-- Favicons -->
	<link rel="shortcut icon" href="images/favicon.ico">
	<link rel="apple-touch-icon" href="images/icon.png">

	<!-- Google font (font-family: 'Roboto', sans-serif; Poppins ; Satisfy) -->
	<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800" rel="stylesheet"> 
	<link href="https://fonts.googleapis.com/css?family=Poppins:300,300i,400,400i,500,600,600i,700,700i,800" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Roboto:100,300,400,500,700,900" rel="stylesheet">

	<!-- Stylesheets -->
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<link rel="stylesheet" href="css/plugins.css">
	<link rel="stylesheet" href="style.css">

	<!-- Cusom css -->
   <link rel="stylesheet" href="css/custom.css">

	<!-- Modernizer js -->
	<script src="js/vendor/modernizr-3.5.0.min.js"></script>
</head>
<body>

	<!-- Main wrapper -->
	<div class="wrapper" id="wrapper">
		
		<!-- Header -->
		<header id="wn__header" class="oth-page header__area header__absolute sticky__header">
			<div class="container-fluid">
				<div class="row">
					<div class="col-md-4 col-sm-4 col-7 col-lg-2">
						<div class="logo">
							<a href="index.jsp">
								<img src="images/logo/logo.png" alt="logo images">
							</a>
						</div>
					</div>
					<div class="col-lg-8 d-none d-lg-block">
						<nav class="mainmenu__nav">
							<ul class="meninmenu d-flex justify-content-start">
								<li class="drop with--one--item"><a href="index.jsp">Accueil</a>
									
								</li>
								<li class="drop"><a href="#">Nos Livres</a>
								
								</li>
								
								<li><a href="contact.html">Contact</a></li>
							</ul>
						</nav>
					</div>
					<div class="col-md-8 col-sm-8 col-5 col-lg-2">
						<ul class="header__sidebar__right d-flex justify-content-end align-items-center">
							<li class="shop_search"><a class="search__active" href="#"></a></li>
							<li class="wishlist"><a href="#"></a></li>
							<li class="shopcart"><a class="cartbox_active" href="#"><span class="product_qun">3</span></a>
								<!-- Start Shopping Cart -->
								<div class="block-minicart minicart__active">
									<div class="minicart-content-wrapper">
										<div class="micart__close">
											<span>close</span>
										</div>
										<div class="items-total d-flex justify-content-between">
											<span>3 items</span>
											<span>Cart Subtotal</span>
										</div>
										<div class="total_amount text-right">
											<span>$66.00</span>
										</div>
										<div class="mini_action checkout">
											<a class="checkout__btn" href="cart.jsp">Go to Checkout</a>
										</div>
										<div class="single__items">
											<div class="miniproduct">
												<div class="item01 d-flex">
													<div class="thumb">
														<a href="product-details.html"><img src="images/product/sm-img/1.jpg" alt="product images"></a>
													</div>
													<div class="content">
														<h6><a href="product-details.html">Voyage Yoga Bag</a></h6>
														<span class="prize">$30.00</span>
														<div class="product_prize d-flex justify-content-between">
															<span class="qun">Qty: 01</span>
															<ul class="d-flex justify-content-end">
																<li><a href="#"><i class="zmdi zmdi-settings"></i></a></li>
																<li><a href="#"><i class="zmdi zmdi-delete"></i></a></li>
															</ul>
														</div>
													</div>
												</div>
												<div class="item01 d-flex mt--20">
													<div class="thumb">
														<a href="product-details.html"><img src="images/product/sm-img/3.jpg" alt="product images"></a>
													</div>
													<div class="content">
														<h6><a href="product-details.html">Impulse Duffle</a></h6>
														<span class="prize">$40.00</span>
														<div class="product_prize d-flex justify-content-between">
															<span class="qun">Qty: 03</span>
															<ul class="d-flex justify-content-end">
																<li><a href="#"><i class="zmdi zmdi-settings"></i></a></li>
																<li><a href="#"><i class="zmdi zmdi-delete"></i></a></li>
															</ul>
														</div>
													</div>
												</div>
												<div class="item01 d-flex mt--20">
													<div class="thumb">
														<a href="product-details.html"><img src="images/product/sm-img/2.jpg" alt="product images"></a>
													</div>
													<div class="content">
														<h6><a href="product-details.html">Compete Track Tote</a></h6>
														<span class="prize">$40.00</span>
														<div class="product_prize d-flex justify-content-between">
															<span class="qun">Qty: 03</span>
															<ul class="d-flex justify-content-end">
																<li><a href="#"><i class="zmdi zmdi-settings"></i></a></li>
																<li><a href="#"><i class="zmdi zmdi-delete"></i></a></li>
															</ul>
														</div>
													</div>
												</div>
											</div>
										</div>
										<div class="mini_action cart">
											<a class="cart__btn" href="cart.jsp">View and edit cart</a>
										</div>
									</div>
								</div>
								<!-- End Shopping Cart -->
							</li>
							<li class="setting__bar__icon"><a class="setting__active" href="#"></a>
								<div class="searchbar__content setting__block">
									<div class="content-inner">
								
											<div class="switcher-currency">
											<strong class="label switcher-label">
												<span>Compte</span>
											</strong>
											<div class="switcher-options">
												<div class="switcher-currency-trigger">
													<div class="setting__menu">
														
														<span><a href="#">Mon Compte</a></span>
														<span><a href="#">Favoris</a></span>
														<span><a href="#">Se Connecter</a></span>
														<span><a href="#">Créer Un Compte</a></span>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</li>
						</ul>
					</div>
				</div>
				<!-- Start Mobile Menu -->
				<div class="row d-none">
					<div class="col-lg-12 d-none">
						<nav class="mobilemenu__nav">
							<ul class="meninmenu">
								<li><a href="index.jsp">Home</a>
									<ul>
										<li><a href="index.jsp">Home Style Default</a></li>
										<li><a href="index-2.html">Home Style Two</a></li>
										<li><a href="index-box.html">Home Box Style</a></li>
									</ul>
								</li>
								<li><a href="#">Pages</a>
									<ul>
										<li><a href="about.html">About Page</a></li>
										<li><a href="portfolio.html">Portfolio</a>
											<ul>
												<li><a href="portfolio.html">Portfolio</a></li>
												<li><a href="portfolio-three-column.html">Portfolio 3 Column</a></li>
												<li><a href="produit.jsp">Portfolio Details</a></li>
											</ul>
										</li>
										<li><a href="account.jsp">My Account</a></li>
										<li><a href="cart.jsp">Cart Page</a></li>
										<li><a href="checkout.html">Checkout Page</a></li>
										<li><a href="wishlist.html">Wishlist Page</a></li>
										<li><a href="error404.html">404 Page</a></li>
										<li><a href="faq.html">Faq Page</a></li>
										<li><a href="team.html">Team Page</a></li>
									</ul>
								</li>
								<li><a href="noslivres.jsp">Shop</a>
									<ul>
										<li><a href="noslivres.jsp">Shop Grid</a></li>
										<li><a href="shop-list.html">Shop List</a></li>
										<li><a href="shop-left-sidebar.html">Shop Left Sidebar</a></li>
										<li><a href="shop-right-sidebar.html">Shop Right Sidebar</a></li>
										<li><a href="shop-no-sidebar.html">Shop No sidebar</a></li>
										<li><a href="produit.jsp">Single Product</a></li>
									</ul>
								</li>
								<li><a href="blog.html">Blog</a>
									<ul>
										<li><a href="blog.html">Blog Page</a></li>
										<li><a href="blog-left-sidebar.html">Blog Left Sidebar</a></li>
										<li><a href="blog-no-sidebar.html">Blog No Sidebar</a></li>
										<li><a href="blog-details.html">Blog Details</a></li>
									</ul>
								</li>
								<li><a href="contact.html">Contact</a></li>
							</ul>
						</nav>
					</div>
				</div>
				<!-- End Mobile Menu -->
	            <div class="mobile-menu d-block d-lg-none">
	            </div>
	            <!-- Mobile Menu -->	
			</div>
		</header>
		<!-- //Header -->
		<!-- Start Search Popup -->
		<div class="box-search-content search_active block-bg close__top">
			<form id="search_mini_form" class="minisearch" action="#">
				<div class="field__search">
					<input type="text" placeholder="Search entire store here...">
					<div class="action">
						<a href="#"><i class="zmdi zmdi-search"></i></a>
					</div>
				</div>
			</form>
			<div class="close__wrap">
				<span>close</span>
			</div>
		</div>
		<!-- End Search Popup -->
        <!-- Start Bradcaump area -->
        <div class="ht__bradcaump__area bg-image--3">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="bradcaump__inner text-center">
                        	<h2 class="bradcaump-title">Panier</h2>
                            <nav class="bradcaump-content">
                              <a class="breadcrumb_item" href="index.jsp">Accueil</a>
                              <span class="brd-separetor">/</span>
                              <span class="breadcrumb_item active">Panier</span>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- End Bradcaump area -->
        <!-- cart-main-area start -->
        <div class="cart-main-area section-padding--lg bg--white">
            <div class="container">
                <div class="row">
                    <div class="col-md-12 col-sm-12 ol-lg-12">
                        <form action="#">               
                            <div class="table-content wnro__table table-responsive">
                                <table>
                                    <thead>
                                        <tr class="title-top">
                                            <th class="product-thumbnail">Image</th>
                                            <th class="product-name">Titre</th>
                                   
                                            <th class="product-remove">Supprimer</th>
                                        </tr>
                                    </thead>
                                    <tbody>

											<c:forEach items="${livres}" var="livre">
											<tr>
												<td class="product-thumbnail"><a href="#"><img src="data:image/png;base64,${livre.image}" alt="product img"></a></td>
												<td class="product-name"><a href="produit.jsp?issn=${livre.issn}">${livre.titre}</a></td>

												<td class="product-remove"><a href="${pageContext.request.contextPath}/RemoveCartItem?id_livre=${livre.issn}">X</a></td>
											</tr>
												</c:forEach>


                                    </tbody>
                                </table>
                            </div>
                        </form> 
                        <div class="cartbox__btn">
                            <ul class="cart__btn__list d-flex flex-wrap flex-md-nowrap flex-lg-nowrap justify-content-between">
								<li><a></a></li>
                                <li><a href="${pageContext.request.contextPath}/ValiderReservation">Valider reservation</a></li>
								<li><a></a></li>
                            </ul>
                        </div>
                    </div>
                </div>
               
            </div>  
        </div>
        <!-- cart-main-area end -->
		<!-- Footer Area -->
		<footer id="wn__footer" class="footer__area bg__cat--8 brown--color">
			<div class="footer-static-top">
				<div class="container">
					<div class="row">
						<div class="col-lg-12">
							<div class="footer__widget footer__menu">
								<div class="ft__logo">
									<a href="index.jsp">
										<img src="images/logo/3.png" alt="logo">
									</a>
									<p>There are many variations of passages of Lorem Ipsum available, but the majority have suffered duskam alteration variations of passages</p>
								</div>
								<div class="footer__content">
									<ul class="social__net social__net--2 d-flex justify-content-center">
										<li><a href="#"><i class="bi bi-facebook"></i></a></li>
										<li><a href="#"><i class="bi bi-google"></i></a></li>
										<li><a href="#"><i class="bi bi-twitter"></i></a></li>
										<li><a href="#"><i class="bi bi-linkedin"></i></a></li>
										<li><a href="#"><i class="bi bi-youtube"></i></a></li>
									</ul>
									<ul class="mainmenu d-flex justify-content-center">
										<li><a href="index.jsp">Trending</a></li>
										<li><a href="index.jsp">Best Seller</a></li>
										<li><a href="index.jsp">All Product</a></li>
										<li><a href="index.jsp">Wishlist</a></li>
										<li><a href="index.jsp">Blog</a></li>
										<li><a href="index.jsp">Contact</a></li>
									</ul>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="copyright__wrapper">
				<div class="container">
					<div class="row">
						<div class="col-lg-6 col-md-6 col-sm-12">
							<div class="copyright">
								<div class="copy__right__inner text-left">
									<p>Copyright <i class="fa fa-copyright"></i> <a href="#">Boighor.</a> All Rights Reserved</p>
								</div>
							</div>
						</div>
						<div class="col-lg-6 col-md-6 col-sm-12">
							<div class="payment text-right">
								<img src="images/icons/payment.png" alt="" />
							</div>
						</div>
					</div>
				</div>
			</div>
		</footer>
		<!-- //Footer Area -->

	</div>
	<!-- //Main wrapper -->

	<!-- JS Files -->
	<script src="js/vendor/jquery-3.2.1.min.js"></script>
	<script src="js/popper.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/plugins.js"></script>
	<script src="js/active.js"></script>
	
</body>

<!-- Mirrored from demo.hasthemes.com/boighor-preview/boighor-v3/cart.jsp by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 29 Jun 2019 22:55:02 GMT -->
</html>