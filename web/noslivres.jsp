<%@ page import="Engine.DataBaseHandler" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="Engine.Livre" %>
<%@ page import="Engine.BlobToString" %>
<%@ page import="org.apache.commons.codec.binary.Base64" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>

<!doctype html>
<html class="no-js" lang="zxx">

<!-- Mirrored from demo.hasthemes.com/boighor-preview/boighor-v3/noslivres.jsp by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 29 Jun 2019 22:54:44 GMT -->
<head>
	<meta charset="utf-8">
	<meta http-equiv="x-ua-compatible" content="ie=edge">
	<title>Shop-Grid | Bookshop Responsive Bootstrap4 Template</title>
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

<%
	try {
		Class.forName("com.mysql.jdbc.Driver").newInstance();
	} catch (InstantiationException | IllegalAccessException | ClassNotFoundException e) {
		e.printStackTrace();
	}




	int numberOfBooksPerPage =12;
	int pageNumber = 0;
	if(request.getParameter("pageNumber")!=null)
		pageNumber =Integer.parseInt(request.getParameter("pagenumber"));
	ArrayList<Livre> livres = new ArrayList<>();

	String query ="SELECT titre_livre ,issn_livre,nom_auteur,prenom_auteur,image from livre,auteur,image_livre WHERE livre.id_auteur = auteur.id_auteur AND issn_livre = id_livre ";
	try {
		Connection  con = DriverManager.getConnection("jdbc:mysql://localhost:3306/tp-bib","root","");
		Statement stmt =  con.createStatement();

		ResultSet rs = stmt.executeQuery(query);


		while(rs.next()){
			Livre tmp = new Livre();

			tmp.setTitre(rs.getString("titre_livre"));
			tmp.setIssn(rs.getInt("issn_livre"));
			tmp.setNomAuteur(rs.getString("nom_auteur"));
			tmp.setPrenomAuteur(rs.getString("prenom_auteur"));

			BlobToString blobToString = new BlobToString();
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
<c:set var="categorie">Historique,Romantique,Novel,Documentaire,Bande dessine,Droit,Litterature</c:set>

<sql:setDataSource var="db" driver="com.mysql.jdbc.Driver"
				   url="jdbc:mysql://localhost/tp-bib"
				   user="root"  password=""/>

<sql:query var="categoriesResult" dataSource="${db}" >
	SELECT count(*) as ct ,nom_categorie from categorie group by nom_categorie;
</sql:query>


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
        <div class="ht__bradcaump__area bg-image--6">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="bradcaump__inner text-center">
                        	<h2 class="bradcaump-title">Nos Livres</h2>
                            <nav class="bradcaump-content">
                              <a class="breadcrumb_item" href="index.jsp">Acceuil</a>
                              <span class="brd-separetor">/</span>
                              <span class="breadcrumb_item active">Nos livres</span>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- End Bradcaump area -->
        <!-- Start Shop Page -->
        <div class="page-shop-sidebar left--sidebar bg--white section-padding--lg">
        	<div class="container">
        		<div class="row">
        			<div class="col-lg-3 col-12 order-2 order-lg-1 md-mt-40 sm-mt-40">
        				<div class="shop__sidebar">
        					<aside class="wedget__categories poroduct--cat">
        						<h3 class="wedget__title">Product Categories</h3>
        						<ul>
									<c:forEach items="${categoriesResult.rows}" var='cat'>
										<li><a href="#">${cat.nom_categorie} <span>(${cat.ct})</span></a></li>

									</c:forEach>

        						</ul>
        					</aside>
        				</div>
        			</div>
        			<div class="col-lg-9 col-12 order-1 order-lg-2">
        				<div class="row">
        					<div class="col-lg-12">
								<div class="shop__list__wrapper d-flex flex-wrap flex-md-nowrap justify-content-between">
									<div class="shop__list nav justify-content-center" role="tablist">
			                            <a class="nav-item nav-link active" data-toggle="tab" href="#nav-grid" role="tab"><i class="fa fa-th"></i></a>
			                            <a class="nav-item nav-link" data-toggle="tab" href="#nav-list" role="tab"><i class="fa fa-list"></i></a>
			                        </div>
			                        <p>Showing 1–12 of 40 results</p>
		                        </div>
        					</div>
        				</div>
        				<div class="tab__container">
	        				<div class="shop-grid tab-pane fade show active" id="nav-grid" role="tabpanel">
	        					<div class="row">
							<c:forEach items="${livres}" var='livre'>
	        						<!-- Start Single Product -->
		        					<div class="product product__style--3 col-lg-4 col-md-4 col-sm-6 col-12">
			        					<div class="product__thumb">
											<a class="first__img" href="produit.jsp?issn=${livre.issn}"><img src='data:image/png;base64,${livre.image}' alt="product image"></a>
											<div class="hot__box">
												<span class="hot-label">Nouveau</span>
											</div>
										</div>
										<div class="product__content content--center content--center">
											<h4><a href="produit.jsp?issn=${livre.issn}">${livre.titre}</a></h4>
											<ul class="prize d-flex">
												<li>Auteur :${livre.nomAuteur} ${livre.prenomAuteur}</li>
											</ul>
											<div class="action">
												<div class="actions_inner">
													<ul class="add_to_links">
														<li><a class="cart" href="cart.jsp"><i class="bi bi-shopping-bag4"></i></a></li>
 													</ul>
												</div>
											</div>
											<div class="product__hover--content">
												<ul class="rating d-flex">
													<li class="on"><i class="fa fa-star-o"></i></li>
													<li class="on"><i class="fa fa-star-o"></i></li>
													<li class="on"><i class="fa fa-star-o"></i></li>
													<li><i class="fa fa-star-o"></i></li>
													<li><i class="fa fa-star-o"></i></li>
												</ul>
											</div>
										</div>
		        					</div>
		        					<!-- End Single Product -->
							</c:forEach>
	        					</div>
	        					<ul class="wn__pagination">
	        						<li class="active"><a href="#">1</a></li>
	        						<li><a href="#">2</a></li>
	        						<li><a href="#">3</a></li>
	        						<li><a href="#">4</a></li>
	        						<li><a href="#"><i class="zmdi zmdi-chevron-right"></i></a></li>
	        					</ul>
	        				</div>
	        				<div class="shop-grid tab-pane fade" id="nav-list" role="tabpanel">
	        					<div class="list__view__wrapper">
	        						<!-- Start Single Product -->
	        						<div class="list__view">
	        							<div class="thumb">
	        								<a class="first__img" href="produit.jsp"><img src="images/product/1.jpg" alt="product images"></a>
	        								<a class="second__img animation1" href="produit.jsp"><img src="images/product/2.jpg" alt="product images"></a>
	        							</div>
	        							<div class="content">
	        								<h2><a href="produit.jsp">Ali Smith</a></h2>
	        								<ul class="rating d-flex">
	        									<li class="on"><i class="fa fa-star-o"></i></li>
	        									<li class="on"><i class="fa fa-star-o"></i></li>
	        									<li class="on"><i class="fa fa-star-o"></i></li>
	        									<li class="on"><i class="fa fa-star-o"></i></li>
	        									<li><i class="fa fa-star-o"></i></li>
	        									<li><i class="fa fa-star-o"></i></li>
	        								</ul>
	        								<ul class="prize__box">
	        									<li>$111.00</li>
	        									<li class="old__prize">$220.00</li>
	        								</ul>
	        								<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam fringilla augue nec est tristique auctor. Donec non est at libero vulputate rutrum. Morbi ornare lectus quis justo gravida semper. Nulla tellus mi, vulputate adipiscing cursus eu, suscipit id nulla.</p>
	        								<ul class="cart__action d-flex">
	        									<li class="cart"><a href="cart.jsp">Add to cart</a></li>
	        									<li class="wishlist"><a href="cart.jsp"></a></li>
	        									<li class="compare"><a href="cart.jsp"></a></li>
	        								</ul>

	        							</div>
	        						</div>
	        						<!-- End Single Product -->
	        						<!-- Start Single Product -->
	        						<div class="list__view mt--40">
	        							<div class="thumb">
	        								<a class="first__img" href="produit.jsp"><img src="images/product/2.jpg" alt="product images"></a>
	        								<a class="second__img animation1" href="produit.jsp"><img src="images/product/4.jpg" alt="product images"></a>
	        							</div>
	        							<div class="content">
	        								<h2><a href="produit.jsp">Blood In Water</a></h2>
	        								<ul class="rating d-flex">
	        									<li class="on"><i class="fa fa-star-o"></i></li>
	        									<li class="on"><i class="fa fa-star-o"></i></li>
	        									<li class="on"><i class="fa fa-star-o"></i></li>
	        									<li class="on"><i class="fa fa-star-o"></i></li>
	        									<li><i class="fa fa-star-o"></i></li>
	        									<li><i class="fa fa-star-o"></i></li>
	        								</ul>
	        								<ul class="prize__box">
	        									<li>$111.00</li>
	        									<li class="old__prize">$220.00</li>
	        								</ul>
	        								<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam fringilla augue nec est tristique auctor. Donec non est at libero vulputate rutrum. Morbi ornare lectus quis justo gravida semper. Nulla tellus mi, vulputate adipiscing cursus eu, suscipit id nulla.</p>
	        								<ul class="cart__action d-flex">
	        									<li class="cart"><a href="cart.jsp">Add to cart</a></li>
	        									<li class="wishlist"><a href="cart.jsp"></a></li>
	        									<li class="compare"><a href="cart.jsp"></a></li>
	        								</ul>

	        							</div>
	        						</div>
	        						<!-- End Single Product -->
	        						<!-- Start Single Product -->
	        						<div class="list__view mt--40">
	        							<div class="thumb">
	        								<a class="first__img" href="produit.jsp"><img src="images/product/3.jpg" alt="product images"></a>
	        								<a class="second__img animation1" href="produit.jsp"><img src="images/product/6.jpg" alt="product images"></a>
	        							</div>
	        							<div class="content">
	        								<h2><a href="produit.jsp">Madeness Overated</a></h2>
	        								<ul class="rating d-flex">
	        									<li class="on"><i class="fa fa-star-o"></i></li>
	        									<li class="on"><i class="fa fa-star-o"></i></li>
	        									<li class="on"><i class="fa fa-star-o"></i></li>
	        									<li class="on"><i class="fa fa-star-o"></i></li>
	        									<li><i class="fa fa-star-o"></i></li>
	        									<li><i class="fa fa-star-o"></i></li>
	        								</ul>
	        								<ul class="prize__box">
	        									<li>$111.00</li>
	        									<li class="old__prize">$220.00</li>
	        								</ul>
	        								<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam fringilla augue nec est tristique auctor. Donec non est at libero vulputate rutrum. Morbi ornare lectus quis justo gravida semper. Nulla tellus mi, vulputate adipiscing cursus eu, suscipit id nulla.</p>
	        								<ul class="cart__action d-flex">
	        									<li class="cart"><a href="cart.jsp">Add to cart</a></li>
	        									<li class="wishlist"><a href="cart.jsp"></a></li>
	        									<li class="compare"><a href="cart.jsp"></a></li>
	        								</ul>

	        							</div>
	        						</div>
	        						<!-- End Single Product -->
	        						<!-- Start Single Product -->
	        						<div class="list__view mt--40">
	        							<div class="thumb">
	        								<a class="first__img" href="produit.jsp"><img src="images/product/4.jpg" alt="product images"></a>
	        								<a class="second__img animation1" href="produit.jsp"><img src="images/product/6.jpg" alt="product images"></a>
	        							</div>
	        							<div class="content">
	        								<h2><a href="produit.jsp">Watching You</a></h2>
	        								<ul class="rating d-flex">
	        									<li class="on"><i class="fa fa-star-o"></i></li>
	        									<li class="on"><i class="fa fa-star-o"></i></li>
	        									<li class="on"><i class="fa fa-star-o"></i></li>
	        									<li class="on"><i class="fa fa-star-o"></i></li>
	        									<li><i class="fa fa-star-o"></i></li>
	        									<li><i class="fa fa-star-o"></i></li>
	        								</ul>
	        								<ul class="prize__box">
	        									<li>$111.00</li>
	        									<li class="old__prize">$220.00</li>
	        								</ul>
	        								<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam fringilla augue nec est tristique auctor. Donec non est at libero vulputate rutrum. Morbi ornare lectus quis justo gravida semper. Nulla tellus mi, vulputate adipiscing cursus eu, suscipit id nulla.</p>
	        								<ul class="cart__action d-flex">
	        									<li class="cart"><a href="cart.jsp">Add to cart</a></li>
	        									<li class="wishlist"><a href="cart.jsp"></a></li>
	        									<li class="compare"><a href="cart.jsp"></a></li>
	        								</ul>

	        							</div>
	        						</div>
	        						<!-- End Single Product -->
	        						<!-- Start Single Product -->
	        						<div class="list__view mt--40">
	        							<div class="thumb">
	        								<a class="first__img" href="produit.jsp"><img src="images/product/5.jpg" alt="product images"></a>
	        								<a class="second__img animation1" href="produit.jsp"><img src="images/product/9.jpg" alt="product images"></a>
	        							</div>
	        							<div class="content">
	        								<h2><a href="produit.jsp">Court Wings Run</a></h2>
	        								<ul class="rating d-flex">
	        									<li class="on"><i class="fa fa-star-o"></i></li>
	        									<li class="on"><i class="fa fa-star-o"></i></li>
	        									<li class="on"><i class="fa fa-star-o"></i></li>
	        									<li class="on"><i class="fa fa-star-o"></i></li>
	        									<li><i class="fa fa-star-o"></i></li>
	        									<li><i class="fa fa-star-o"></i></li>
	        								</ul>
	        								<ul class="prize__box">
	        									<li>$111.00</li>
	        									<li class="old__prize">$220.00</li>
	        								</ul>
	        								<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam fringilla augue nec est tristique auctor. Donec non est at libero vulputate rutrum. Morbi ornare lectus quis justo gravida semper. Nulla tellus mi, vulputate adipiscing cursus eu, suscipit id nulla.</p>
	        								<ul class="cart__action d-flex">
	        									<li class="cart"><a href="cart.jsp">Add to cart</a></li>
	        									<li class="wishlist"><a href="cart.jsp"></a></li>
	        									<li class="compare"><a href="cart.jsp"></a></li>
	        								</ul>
	        							</div>
	        						</div>
	        						<!-- End Single Product -->
	        					</div>
	        				</div>
        				</div>
        			</div>
        		</div>
        	</div>
        </div>
        <!-- End Shop Page -->
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
		<!-- END QUICKVIEW PRODUCT -->
		</div>
		<!-- //Main wrapper -->

		<!-- JS Files -->
		<script src="js/vendor/jquery-3.2.1.min.js"></script>
		<script src="js/popper.min.js"></script>
		<script src="js/bootstrap.min.js"></script>
		<script src="js/plugins.js"></script>
		<script src="js/active.js"></script>
		
	</body>
	
<!-- Mirrored from demo.hasthemes.com/boighor-preview/boighor-v3/noslivres.jsp by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 29 Jun 2019 22:54:51 GMT -->
</html>