<!DOCTYPE html>


<html class="no-js" lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>Merchant</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="apple-touch-icon" href="apple-touch-icon.png">

<!--  Place favicon.ico in the root directory -->
<link rel="stylesheet" href="css/vendor.css">
<!--   Theme initialization -->
<link rel="stylesheet" href="css/app.css">
<%--    <%@ include file = "UILayout.jsp"%>  --%>

</head>
<body>
	<div class="main-wrapper">
		<div class="app" id="app">
			<header class="header">
				<div class="header-block header-block-collapse d-lg-none d-xl-none">
					<button class="collapse-btn" id="sidebar-collapse-btn">
						<i class="fa fa-bars"></i>
					</button>
				</div>

				<div class="header-block header-block-nav">
					<ul class="nav-profile">
						<li class="profile dropdown"><a
							class="nav-link dropdown-toggle" data-toggle="dropdown" href="#"
							role="button" aria-haspopup="true" aria-expanded="false"> <span
								class="name"> ${thisUser.firstName } ${thisUser.lastName }</span>
						</a>
							<div class="dropdown-menu profile-dropdown-menu"
								aria-labelledby="dropdownMenu1">
								<a class="dropdown-item" href="/logout">Logout</a>
							</div></li>
					</ul>
				</div>
			</header>
			<aside class="sidebar" id="sidebar">
				<div class="sidebar-container">
					<div class="sidebar-header">
						<div class="brand">Easy Banking</div>
					</div>
					<nav class="menu">
						<ul class="sidebar-menu metismenu" id="sidebar-menu">

							<li><a href="/callDeposite">Deposite </a></li>
							<li><a href="/callWithdraw">Withdraw </a></li>
							<li><a href="/viewAllTransactions">viewAllTransactions </a></li>
							<li><a href="/callBalance">View Balance </a></li>
			
							<li><a href="/logout"> <i class="fa fa-power-off icon"></i>
									Logout
							</a></li>
						</ul>
					</nav>
				</div>
				<footer class="sidebar-footer">
					<ul class="sidebar-menu metismenu" id="customize-menu">
						<li>
							<ul>
								<li class="customize">
									<div class="customize-item">
										<div class="row customize-header">
											<div class="col-4"></div>
											<div class="col-4">
												<label class="title">fixed</label>
											</div>
											<div class="col-4">
												<label class="title">static</label>
											</div>
										</div>
										<div class="row">
											<div class="col-4">
												<label class="title">Sidebar:</label>
											</div>
											<div class="col-4">
												<label> <input class="radio" type="radio"
													name="sidebarPosition" value="sidebar-fixed"> <span></span>
												</label>
											</div>
											<div class="col-4">
												<label> <input class="radio" type="radio"
													name="sidebarPosition" value=""> <span></span>
												</label>
											</div>
										</div>
										<div class="row">
											<div class="col-4">
												<label class="title">Header:</label>
											</div>
											<div class="col-4">
												<label> <input class="radio" type="radio"
													name="headerPosition" value="header-fixed"> <span></span>
												</label>
											</div>
											<div class="col-4">
												<label> <input class="radio" type="radio"
													name="headerPosition" value=""> <span></span>
												</label>
											</div>
										</div>
										<div class="row">
											<div class="col-4">
												<label class="title">Footer:</label>
											</div>
											<div class="col-4">
												<label> <input class="radio" type="radio"
													name="footerPosition" value="footer-fixed"> <span></span>
												</label>
											</div>
											<div class="col-4">
												<label> <input class="radio" type="radio"
													name="footerPosition" value=""> <span></span>
												</label>
											</div>
										</div>
									</div>

								</li>
							</ul> <a href=""> <i class="fa fa-cog"></i> Customize
						</a>
						</li>
					</ul>
				</footer>
			</aside>
			<div class="sidebar-overlay" id="sidebar-overlay"></div>
			<div class="sidebar-mobile-menu-handle"
				id="sidebar-mobile-menu-handle"></div>
			<div class="mobile-menu-handle"></div>

			<!--   <footer class="footer">
                    <div class="footer-block buttons">
                        <iframe class="footer-github-btn" src="https://ghbtns.com/github-btn.html?user=modularcode&repo=modular-admin-html&type=star&count=true" frameborder="0" scrolling="0" width="140px" height="20px"></iframe>
                    </div>
                    <div class="footer-block author">
                        <ul>
                            <li> created by
                                <a href="https://github.com/modularcode">ModularCode</a>
                            </li>
                            <li>
                                <a href="https://github.com/modularcode/modular-admin-html#get-in-touch">get in touch</a>
                            </li>
                        </ul>
                    </div>
                </footer> -->
			<%-- <div class="modal fade" id="modal-media">
                    <div class="modal-dialog modal-lg">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h4 class="modal-title">Media Library</h4>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                    <span class="sr-only">Close</span>
                                </button>
                            </div>
                            <div class="modal-body modal-tab-container">
                                <ul class="nav nav-tabs modal-tabs" role="tablist">
                                    <li class="nav-item">
                                        <a class="nav-link" href="#gallery" data-toggle="tab" role="tab">Gallery</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link active" href="#upload" data-toggle="tab" role="tab">Upload</a>
                                    </li>
                                </ul>
                                <div class="tab-content modal-tab-content">
                                    <div class="tab-pane fade" id="gallery" role="tabpanel">
                                        <div class="images-container">
                                            <div class="row"> </div>
                                        </div>
                                    </div>
                                    <div class="tab-pane fade active in" id="upload" role="tabpanel">
                                        <div class="upload-container">
                                            <div id="dropzone">
                                                <form action="/" method="POST" enctype="multipart/form-data" class="dropzone needsclick dz-clickable" id="demo-upload">
                                                    <div class="dz-message-block">
                                                        <div class="dz-message needsclick"> Drop files here or click to upload. </div>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                <button type="button" class="btn btn-primary">Insert Selected</button>
                            </div>
                        </div>
                        <!-- /.modal-content -->
                    </div>
                    <!-- /.modal-dialog -->
                </div> --%>
			<!-- /.modal -->
			<div class="modal fade" id="confirm-modal">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h4 class="modal-title">
								<i class="fa fa-warning"></i> Alert
							</h4>
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body">
							<p>Are you sure want to do this?</p>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-primary"
								data-dismiss="modal">Yes</button>
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal">No</button>
						</div>
					</div>
					<!-- /.modal-content -->
				</div>
				<!-- /.modal-dialog -->
			</div>
			<!-- /.modal -->
		</div>
	</div>
	<!-- Reference block for JS -->
	<div class="ref" id="ref">
		<div class="color-primary"></div>
		<div class="chart">
			<div class="color-primary"></div>
			<div class="color-secondary"></div>
		</div>
	</div>

	<script type="text/javascript">
        var url = document.URL;
        if(url.includes("/showCouponForm"))
        {
        	document.getElementById("sidebar").style.display = "none";
        }	
   
        </script>
	<!-- <script>
            (function(i, s, o, g, r, a, m)
            {
                i['GoogleAnalyticsObject'] = r;
                i[r] = i[r] || function()
                {
                    (i[r].q = i[r].q || []).push(arguments)
                }, i[r].l = 1 * new Date();
                a = s.createElement(o),
                    m = s.getElementsByTagName(o)[0];
                a.async = 1;
                a.src = g;
                m.parentNode.insertBefore(a, m)
            })(window, document, 'script', 'https://www.google-analytics.com/analytics.js', 'ga');
            ga('create', 'UA-80463319-4', 'auto');
            ga('send', 'pageview');
        </script> -->
	<script src="js/vendor.js"></script>
	<script src="js/app.js"></script>
	<%--   <%@ include file = "ScriptLayout.jsp"%> --%>
</body>
</html>